
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
}


class SingleBattalionViewController: UIViewController {

    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBAction func SwapViews(sender: AnyObject) {
        moveViews(sender.selectedSegmentIndex)
        
    }
    
    func moveViews(sender:Int) {
        let viewControllerIdentifiers = ["Info", "Facts", "More"]
        let newController = (storyboard?.instantiateViewControllerWithIdentifier(viewControllerIdentifiers[sender]))! as UIViewController
        let oldController = childViewControllers.last! as UIViewController
        
        oldController.willMoveToParentViewController(nil)
        addChildViewController(newController)
        newController.view.frame = oldController.view.frame
        transitionFromViewController(oldController, toViewController: newController, duration: 0.25, options: .TransitionCrossDissolve, animations:{ () -> Void in
            }, completion: { (finished) -> Void in
                oldController.removeFromParentViewController()
                newController.didMoveToParentViewController(self)
        })
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachability.isConnectedToNetwork() == true {
            
            let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
            var dataTask: NSURLSessionDataTask?
            
            if dataTask != nil {
                dataTask?.cancel()
            }
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            let url = NSURL(string: "http://lest-we-forget.ca/apis/get_ww1_battalion_info.php")
            
            // 5
            dataTask = defaultSession.dataTaskWithURL(url!) {
                data, response, error in
                
                // 6
                dispatch_async(dispatch_get_main_queue()) {
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                }
                // 7
                if let error = error {
                    print("(Battalion \(error.localizedDescription)")
                } else if let httpResponse = response as? NSHTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        self.buildBattalions(data)
                        
                        //                        var BattArray = JSON([])
                        //                        BattArray = JSON(data: data!)
                    }
                }
            }
            // 8
            dataTask?.resume()
            
        }
        else {
            // Error message stating that you need an internet connection to view this section of the app
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func buildBattalions(data: NSData?) {
        //var soldierArray = JSON([])
        var allBatts = JSON([])
        do {
            if let _: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                
                if data != nil {
                    allBatts = JSON(data: data!)
                    
                    // Search through the allBatts array(read from lwf.ca database) and find the proper id
                    BattVars.battalionFound = false
                    for jsonBattalion in allBatts {
                        
                        let bat = jsonBattalion.1.dictionary
                        if BattVars.battalionFound {
                            break
                        }
                        
                        // Set all individual variables and build a singleBattalion global object
                        if BattVars.battalion_id == (bat!["battalion_id"]?.stringValue)! {
                            let properBattalion = FullBattalionInfo()
                            properBattalion.battalion_id = (bat!["battalion_id"]?.stringValue)!
                            properBattalion.france_arrival = (bat!["france_arrival"]?.stringValue)!
                            properBattalion.strength = (bat!["strength"]?.stringValue)!
                            properBattalion.war_diary = (bat!["war_diary"]?.stringValue)!
                            properBattalion.perpetuated_by = (bat!["perpetuated_by"]?.stringValue)!
                            properBattalion.candaian_arrival = (bat!["canadian_arrival"]?.stringValue)!
                            properBattalion.location = (bat!["location"]?.stringValue)!
                            properBattalion.embarkation = (bat!["embarkation"]?.stringValue)!
                            properBattalion.interesting_facts = (bat!["interesting_facts"]?.stringValue)!
                            properBattalion.date_created = (bat!["date_created"]?.stringValue)!
                            properBattalion.disembarkation = (bat!["disembarkation"]?.stringValue)!
                            properBattalion.battalion_name = (bat!["battalion_name"]?.stringValue)!
                            properBattalion.commanded_by = (bat!["commanded_by"]?.stringValue)!
                            properBattalion.reinforced_by = (bat!["reinforced_by"]?.stringValue)!
                            
                            BattVars.singleBattalion = properBattalion
                            BattVars.battalionFound = true
                            break
                        }
                        else {
                            break
                        }
                    }
                    
                    if !BattVars.battalionFound {
                        // *** print error message indicating that the selected battalion could not be retrieved from the database
                        //      then segue back to BattalionTableViewController
                    }
                }
            }
        } catch let error as NSError {
            print("Error parsing results: \(error.localizedDescription)")
        }
        
    }
    
}