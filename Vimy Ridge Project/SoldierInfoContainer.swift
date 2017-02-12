//
//  File.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-10-25.
//  Copyright © 2016 Mason Black. All rights reserved.
//
import Foundation
import UIKit

class SoldierInfoContainer: UITableViewController {
    
    var totalSoldiers = 0
    var allSoldiers = [JSON]()
   
    
    @IBOutlet var soldierTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        var battalionMatchArray = [String]()
        let battalion_name: String = BattVars.singleBattalion.battalion_name
        //battalion_name = "87th"
        print(battalion_name)
        
        //battalion_name = "Canadian Infantry"      //TEST
        
        //loop through soldier array
        for soldier in MyVariables.allVimySoldiers {
            //get one soldier
                
            //loop through their battalion array
            for bat in soldier.battalion_array {
                for (key, value) in bat {
                    print("Battalion Name: \(battalion_name)  -  Key: \(key) ~ Value: \(value)")
                  
                    if value == battalion_name {
                        print("~~~~AAA~~~~")
                        print(value)
                        battalionMatchArray.append(value)
                        print(battalionMatchArray)
                        
                        //No value that == battalion_name. Values are either empty or different from what shows in search.
                    } else {
                        //print("|||WWW|A||")
                    }
                }
            }
        }
        
        
        if (battalion_name != "")
        {
            print("{RUNNING}")
            // The url webpage that we'll be connecting to.
            //      *****NOTICE THE ACTION VARIABLE "search_battalion" IN THE URL. THIS IS HOW YOU TELL THE SERVER WHAT TYPE OF SEARCH YOU ARE DOING
            let url : String = "http://lest-we-forget.ca/apis/search2.php?access_code=SFDCI_Black&action=search_battalion&battalion=\(battalion_name)"
            
            let safeURL = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            print(safeURL)
            // Build the URL request with the URL above
            let request : NSMutableURLRequest = NSMutableURLRequest()
            request.url = URL(string: safeURL)
            request.httpMethod = "GET"  // This defines how the information will be passed to the API website
            
            
            var response : URLResponse?
            var err : NSError?
            
            var soldierArray = JSON([])
            let data: Data?
            do {
                data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response)
            } catch let error as NSError {
                err = error
                data = nil
            }
            
            print(data)
            
            //let jsn: NSDictionary = data as NSDictionary
            if data != nil {
                soldierArray = JSON(data: data!)
                
                //print(soldierArray)
                totalSoldiers = soldierArray.count
                print(soldierArray) // print to see the data that was passed back from the server
            }
            else {
                print(err)
            }
            
            allSoldiers = soldierArray.arrayValue // This creates an array of all the soldiers sent back
            
            if totalSoldiers > 1 {
                for i in 0..<totalSoldiers - 1 {
                    let soldier = allSoldiers[i]["name"].stringValue
                    print("index: \(i) soldier: \(soldier)")
                    
                    if soldier == MyVariables.globalSoldier.christian_names + " " + MyVariables.globalSoldier.surname {
                        allSoldiers.remove(at: i)   //(allSoldiers.indexOf(i))
                        totalSoldiers = totalSoldiers - 1
                        //print("index: \(i) soldier: \(allSoldiers[i]["name"].stringValue)")
                    }
                }
            }
            else if totalSoldiers == 1 {
                allSoldiers.remove(at: 0)
                totalSoldiers = 0
                //show popup: saying no soldiers found
                print("||||||||||||||||||||||||||||No soldiers found||||||||||||||||||||||||||")
                
            
           
            
            //            print(allSoldiers[0]) // This shows how to select an individual soldier
            //            print(allSoldiers[0]["name"]) // This shows how to select a specific property of a selected soldier
            
            soldierTableView!.reloadData()
                
            }
        }
    }
    
    
    
  
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalSoldiers
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let soldier = allSoldiers[(indexPath as NSIndexPath).row]
        
        
        
        //cell.imageView?.image = UIImage(named: rankName) //self.arrImageName[indexPath.row])
        
        cell.textLabel?.font = UIFont(name:"Chapter11W00-Regular", size:18)
        
        cell.textLabel?.text = soldier ["name"].stringValue
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let soldier = allSoldiers[(indexPath as NSIndexPath).row]
        MyVariables.facebookSoldierID = soldier["soldier_id"].stringValue
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "facebookVCSegue2", sender: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // no lines where there aren't cells
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //cell.backgroundColor = .clear()
    }
}


