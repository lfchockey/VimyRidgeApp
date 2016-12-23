//
//  MyVariables.swift
//  Vimy Ridge Project
//
//  Created by Mason Black on 2016-08-26.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import Foundation
import UIKit

struct MyVariables {
    static var globalSoldier:FullSoldier = FullSoldier()
    static var access_code: String = "SFDCI_Black"
    static var soldierSet:Bool = false
    static var facebookSoldierID: String = ""
    static var soldierOfTheHour: String = ""
    
    static var allSoldiersDownloadStarted = false
    static var allSoldiersDownloaded = false
    static var allVimySoldiers: [FullSoldier] = [FullSoldier]()
    
    func downloadAllVimySoldiers() {
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        var dataTask: URLSessionDataTask?
        
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = NSURL(string: "http://lest-we-forget.ca/apis/get_all_full_vimy_soldiers_api.php?access_code=\(MyVariables.access_code)")
        MyVariables.allSoldiersDownloadStarted = true
        // 5
        dataTask = defaultSession.dataTask(with: url! as URL) {
            data, response, error in

            // 6
            DispatchQueue.main.async() {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            // 7
            if let error = error {
                print("(MyVars) \(error.localizedDescription)")
                // *** add some code here that explains that the request timed out (or some other option)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    self.buildSoldiers(data: data as NSData?)
                    
                }
            }
        }
        // 8
        dataTask?.resume()
        
       
    }
    
    
    
    func buildSoldiers(data: NSData?) {
        var soldierArray = JSON([])
                
        if data != nil {
            soldierArray = JSON(data: data! as Data)
            
            for jsonSoldier in soldierArray {
                //let bob = init(parseJSON: jsonSoldier.1.stringValue)
                //let soldier = JSON.parse(json: jsonSoldier.1.stringValue)
                let soldier = JSON(parseJSON: jsonSoldier.1.stringValue)
                
                var soldierDict = Dictionary<String, AnyObject>()
                
                var count = 0
                for (key, value) in soldier {
                    if key == "soldier_of_the_hour" {
                        //print("\(key) - \(value)")
                    }
                    count += 1
                    if MyVariables.soldierOfTheHour == "" {
                        if key == "soldier_of_the_hour" {
                            if soldier["soldier_of_the_hour"] != "" {
                                let soth = soldier["soldier_of_the_hour"].stringValue
                                MyVariables.soldierOfTheHour = soth
                                MyVariables.facebookSoldierID = soth
                            }
                        }
                    }
                    if count > 105
                    {
                        break // *** choppy piece of code that is getting into an infinite loop if a soldier is returned with no values
                    }
                    if key == "locations" {
                        var location_array: [[String:String]] = []
                        let locations = soldier["locations"]
                        
                        for location in locations {
                            let loc = location.1["location"].stringValue
                            let sig = location.1["significance"]
                            location_array.append([sig.stringValue:loc])
                        }
                        soldierDict.updateValue(location_array as AnyObject, forKey: key)
                    }
                    else{
                        soldierDict.updateValue(value.stringValue as AnyObject, forKey: key)
                    }
                    
                    if key == "friends" {
                        var friends_array: [[String:String]] = []
                        let friends = soldier["friends"]
                        
                        for friend in friends {
                            // *** need to get the values from the friends array
                            let loc = friend.1["location"].stringValue
                            let sig = friend.1["significance"]
                            friends_array.append([sig.stringValue:loc])
                        }
                        soldierDict.updateValue(friends_array as AnyObject, forKey: key)
                    }
                    else{
                        soldierDict.updateValue(value.stringValue as AnyObject, forKey: key)
                    }

                    
                }
                
                
                let finalSoldier: NSDictionary = soldierDict as NSDictionary
                var newSoldier: FullSoldier = FullSoldier()
                newSoldier = newSoldier.assignSoldier(soldierDict: finalSoldier)
                
                
                //  Store the current soldier in the allVimySoldiers global variable array
                MyVariables.allVimySoldiers.append(newSoldier)
                
            }
            
        }
        else {
            print ("(MyVars) Data came back from server as nil")
        }

        
        // If the soldiers have been downloaded
        if MyVariables.allVimySoldiers.count > 0 {
            MyVariables.allSoldiersDownloaded = true
        }
        else {
            MyVariables.allSoldiersDownloaded = false
        }
    }
    
    func setGlobalSoldier(id: String) {
        
        
        // Make sure there are soldiers already downloaded
        if MyVariables.allVimySoldiers.count > 0 && MyVariables.facebookSoldierID != "" {
            for singleSoldier in MyVariables.allVimySoldiers {
                if singleSoldier.soldier_id == MyVariables.facebookSoldierID {
                    MyVariables.globalSoldier = singleSoldier
                    MyVariables.soldierSet = true
                }
            }
        }
        else {
            // print error message
            print ("No soldier found with that ID. Could NOT set MyVariables.globalSoldier.")
        }
        
    }
}
