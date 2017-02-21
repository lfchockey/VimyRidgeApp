
//  ViewController.swift
//  SingleBatt.ViewUI-DRAFT
//
//  Created by Student on 2016-05-10.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

struct BattVars {
    static var battalion_id: String = ""
    static var singleBattalion: FullBattalionInfo = FullBattalionInfo()
    static var battalionFound = false
    static var BattalionsArrayFound = false
    static var BattsArray = [FullBattalionInfo]()
    static var allBattalionsDownloaded = false
}


class SingleBattalionViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func SwapViews(_ sender: AnyObject) {
        moveViews(sender: sender.selectedSegmentIndex)
        
    }
    
    func moveViews(sender:Int) {

        let viewControllerIdentifiers = ["Info", "Facts", "More"] //"Soldiers", "More"] *** re-add the Soldiers Matching section once the database is cleaned up
        
        let newController = (storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifiers[sender]))! as UIViewController
        let oldController = childViewControllers.last! as UIViewController
        
        oldController.willMove(toParentViewController: nil)
        addChildViewController(newController)
        newController.view.frame = oldController.view.frame
        transition(from: oldController, to: newController, duration: 0.25, options: .transitionCrossDissolve, animations:{ () -> Void in
        }, completion: { (finished) -> Void in
            oldController.removeFromParentViewController()
            newController.didMove(toParentViewController: self)
        })
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BattVars.battalionFound = false
        
        if BattVars.allBattalionsDownloaded {
            //loop through each battalion until the proper one is found
            for bat in BattVars.BattsArray {
                if BattVars.battalion_id == bat.battalion_id {
                    BattVars.singleBattalion = bat
                    BattVars.battalionFound = true
                    self.moveViews(sender: 0)
                    break
                }
            }
        }
        else {
            if Reachability.isConnectedToNetwork() == true {
                
                let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
                var dataTask: URLSessionDataTask?
                
                if dataTask != nil {
                    dataTask?.cancel()
                }
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                
                let url = NSURL(string: "http://lest-we-forget.ca/apis/get_ww1_battalion_info.php")
                
                // 5
                dataTask = defaultSession.dataTask(with: url! as URL) {
                    data, response, error in
                    
                    // 6
                    DispatchQueue.main.async{
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    }
                    // 7
                    if let error = error {
                        print("(Battalion \(error.localizedDescription)")
                    } else if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            self.buildBattalions(data: data as NSData?)
        
                        }
                    }
                }
                // 8
                dataTask?.resume()
                
            }
            else {
                
                
                print("(SingleBattalionVC) Internet connection FAILED")
                
                let alertController = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    //When OK is pressed, segue back to the previous ViewController (Main Screen)
                    _ = self.navigationController?.popViewController(animated: true)
                }
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true) {
                    // ...
                }
                
            }
        }
        
        self.title = "\(BattVars.singleBattalion.battalion_name)"
        print(BattVars.singleBattalion.battalion_name)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func buildBattalions(data: NSData?) {
        //var soldierArray = JSON([])
        var allBatts = JSON([])
        //do {
        //    if let _: NSDictionary? = try JSONSerialization.jsonObject(with: data! as Data, options:JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
        
        if data != nil {
            allBatts = JSON(data: data! as Data)
            
            // Search through the allBatts array(read from lwf.ca database) and find the proper id
            BattVars.battalionFound = false
            for jsonBattalion in allBatts {
                //print(allBatts)   //test
                let bat = jsonBattalion.1.dictionary
                
                // Set all individual variables and build a singleBattalion global object
                let properBattalion = FullBattalionInfo()
                
                properBattalion.battalion_id = (bat!["battalion_id"]?.stringValue)!
                properBattalion.france_arrival = (bat!["france_arrival"]?.stringValue)!
                properBattalion.strength = (bat!["strength"]?.stringValue)!
                properBattalion.war_diary = (bat!["war_diary"]?.stringValue)!
                properBattalion.perpetuated_by = (bat!["perpetuated_by"]?.stringValue)!
                properBattalion.canadian_arrival = (bat!["canadian_arrival"]?.stringValue)!
                properBattalion.location = (bat!["location"]?.stringValue)!
                properBattalion.embarkation = (bat!["embarkation"]?.stringValue)!
                properBattalion.interesting_facts = (bat!["interesting_facts"]?.stringValue)!
                properBattalion.date_created = (bat!["date_created"]?.stringValue)!
                properBattalion.disembarkation = (bat!["disembarkation"]?.stringValue)!
                properBattalion.battalion_name = (bat!["battalion_name"]?.stringValue)!
                properBattalion.commanded_by = (bat!["commanded_by"]?.stringValue)!
                properBattalion.reinforced_by = (bat!["reinforced_by"]?.stringValue)!
                
                // Add the proper batt to our global batt array
                BattVars.BattsArray.append(properBattalion)
                if BattVars.battalion_id == (bat!["battalion_id"]?.stringValue)! {
                    
                    BattVars.singleBattalion = properBattalion
                    BattVars.battalionFound = true
                    BattVars.BattalionsArrayFound = true

                }
                
            }
            
            BattVars.allBattalionsDownloaded = true
            if !BattVars.battalionFound {
                // *** print error message indicating that the selected battalion could not be retrieved from the database
                //      then segue back to BattalionTableViewController
                let alert = UIAlertController(title: "No soldier indicated", message: "Unfortunately the soldier's ID was not properly passed. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                

                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // When OK is pressed, segue back to the previous ViewController (Main Screen)
                    _ = self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(OKAction)
                
                self.present(alert, animated: true) {
                    
                }

            }
            else {
                DispatchQueue.main.async{
                    self.moveViews(sender: 0)
                }
            }
        }
    }
    
}
