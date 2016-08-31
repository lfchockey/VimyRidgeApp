//
//  Medals.swift
//  VimyRidgeApp
//
//  Created by Matthew Falkner on 2015-06-21.
//  Copyright (c) 2015 Matt Falkner. All rights reserved.
//

import Foundation
import UIKit

class Medals:UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var totalAwards = 0
    var allAwards = JSON([])//[JSON]()
    
    @IBOutlet weak var awardTableView: UITableView!
    @IBOutlet weak var medalImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        awardTableView!.delegate = self
        awardTableView!.dataSource = self
        
        
        let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        var dataTask: NSURLSessionDataTask?
        
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let url = NSURL(string: "http://lest-we-forget.ca/apis/search2.php?action=search_awards&access_code=\(MyVariables.access_code)&soldier_id=\(MyVariables.facebookSoldierID)")
        
        dataTask = defaultSession.dataTaskWithURL(url!) {
            data, response, error in
            
            dispatch_async(dispatch_get_main_queue()) {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
            
            if let error = error {
                print(" MedalsVC \(error.localizedDescription)")
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    self.buildMedals(data)
                }
            }
        }
        // 8
        dataTask?.resume()
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalAwards
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let award = allAwards[indexPath.row]
        
        cell.textLabel?.text = award.stringValue
        
        
        // *** The following code attempts to place images of each medal/award in the table view cell
        //      These images need to be created first and placed in the Images.xcassets
        switch award
        {
            
        case "1914 Star":
            let medal = MedalReader(medalName: "1914 Star")
            let image : UIImage = UIImage(named: medal.medal.imageName)!
            cell.imageView?.image = image
            cell.textLabel?.text = medal.medal.medalDescription
            //            case "1914 - 1915 Star":
            //                let image : UIImage = UIImage(named: "1914 1915 star")!
            //                cell.imageView?.image = image
            //
            //            case "British War Medal":
            //                let image : UIImage = UIImage(named: "British war medal")!
            //                cell.imageView?.image = image
            
        default:
            let image : UIImage = UIImage(named: "1914 Star")! // get another image for an award that is unknown
            cell.imageView?.image = image
        }
        
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildMedals(data: NSData?) {
        var awardsArray = JSON([])
        do {
            if let _: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                
                if data != nil {
                    awardsArray = JSON(data: data!)
                    allAwards = awardsArray
                    totalAwards = awardsArray.count
                    dispatch_async(dispatch_get_main_queue()) {
                        self.awardTableView!.reloadData()
                    }
                    
                }
                else {
                    print ("(MedalsVC) Data came back from server as nil")
                }
            }
            else {
                print("(MedalsVC) Problem with NSJSONSerialization")
            }
        } catch let error as NSError {
            print("(MedalsVC) Error parsing results: \(error.localizedDescription)")
        }
        
    }
    
    
}