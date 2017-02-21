//
//  Medals.swift
//  VimyRidgeApp
//
//  Created by Matthew Falkner on 2015-06-21.
//  Copyright (c) 2015 Matt Falkner. All rights reserved.
//

import Foundation
import UIKit

class Medals: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var totalAwards = 0
    var allAwards = JSON([])//[JSON]()
    
    @IBOutlet weak var awardTableView: UITableView!
    @IBOutlet weak var medalImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var MedalName: UILabel!
    
    @IBOutlet weak var MainLabel: UILabel!
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
        
        cell.textLabel?.font = UIFont(name: "Chapter11W00-Regular", size:18)
        
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
            
            
        case "1914-15 Star":
            let medal = MedalReader(medalName: "1914-15 Star")
            let image : UIImage = UIImage(named: medal.medal.imageName)!
            cell.imageView?.image = image
            
            
        case "British War Medal":
            let medal = MedalReader(medalName: "British War Medal")
            let image : UIImage = UIImage(named: medal.medal.imageName)!
            cell.imageView?.image = image
            
        //            /Users/student/Downloads/VimyRidgeApp-master 3/Vimy Ridge Project/Medals List.plist
        case "Silver War Badge":
            let medal = MedalReader(medalName: "Silver War Badge")
            let image : UIImage = UIImage(named: medal.medal.imageName)!
            cell.imageView?.image = image
            
        case "Victoria Cross Medal":
            let medal = MedalReader(medalName: "Victoria Cross Medal")
            let image : UIImage = UIImage(named: medal.medal.imageName)!
            cell.imageView?.image = image
        //
        case "Military Medal":
            let medal = MedalReader(medalName: "Military Medal")
            let image : UIImage = UIImage(named: medal.medal.imageName)!
            cell.imageView?.image = image
            //
            //
            
            
            //                        case "British War Medal":
            //                            let image : UIImage = UIImage(named: "British war medal")!
            //                            cell.imageView?.image = image
            
        default:
            let image : UIImage = UIImage(named: "BasicMedal")! // get another image for an award that is unknown
            cell.imageView?.image = image
            
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let theAwardIClickedOn = allAwards[indexPath.row]
        print(theAwardIClickedOn)
        
        let medal = MedalReader(medalName: theAwardIClickedOn.rawString()!)
        let NameofMedal = theAwardIClickedOn.rawString()!
        let description = medal.medal.medalDescription
        descriptionLabel.text = description
        medalImageView.image = UIImage(named: medal.medal.imageName)// UIImage(named: medal.medal.imageName)
        MedalName.text = NameofMedal
        
        let url = NSURL(string: medal.medal.website)
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest)
        
        
        
        //        else {
        //            print("jason")
        //        }
        //print(medal.medal.medalDescription)
        
        //descriptionLabel.text = allAwards.rawString()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildMedals(data: NSData?) {
        var awardsArray = JSON([])
        //        do {
        //            if let _ =  try JSONSerialization.jsonObject(with: data! as Data, options:JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
        //            {
        //if let bob: NSDictionary try JSONSerialization.JSONObjectWithData(data! as Data, options:JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
        
        if data != nil {
            awardsArray = JSON(data: data! as Data)
            allAwards = awardsArray
            totalAwards = awardsArray.count
            DispatchQueue.main.async() {
                self.awardTableView!.reloadData()
            }
            
        }
        else if totalAwards == 0 {
            let alert = UIAlertController(title: "Sorry,", message: "This Soldier Has No Medals", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        else {
            print ("(MedalsVC) Data came back from server as nil")
            
            let alert = UIAlertController(title: "Sorry,", message: "We could not find any medals for this soldier", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        
        

        
        
        //            }
        //            else {
        //                print("(MedalsVC) Problem with NSJSONSerialization")
        //            }
        //        } catch let error as NSError {
        //            print("(MedalsVC) Error parsing results: \(error.localizedDescription)")
        //        }
        
    }
    
    
}
