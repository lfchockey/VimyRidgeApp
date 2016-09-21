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
        
        
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        var dataTask: URLSessionDataTask?
        
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = NSURL(string: "http://lest-we-forget.ca/apis/search2.php?action=search_awards&access_code=\(MyVariables.access_code)&soldier_id=\(MyVariables.facebookSoldierID)")
        
        dataTask = defaultSession.dataTask(with: url! as URL) {
            data, response, error in
            
            DispatchQueue.main.async() {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            if let error = error {
                print(" MedalsVC \(error.localizedDescription)")
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    self.buildMedals(data: data as NSData?)
                }
            }
        }
        // 8
        dataTask?.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalAwards
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
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
                    awardsArray = JSON(data: data! as Data)
                    allAwards = awardsArray
                    totalAwards = awardsArray.count
                    DispatchQueue.main.async() {
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
