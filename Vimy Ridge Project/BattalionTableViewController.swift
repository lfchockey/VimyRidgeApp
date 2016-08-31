//
//  ViewController.swift
//  JacobCulminating
//
//  Created by Student on 2016-05-25.
//  Copyright © 2016 Jacob Bland. All rights reserved.
//

import UIKit

extension BattalionTableViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

class BattalionTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var filteredBattalions = [Battalions]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let allBattalions = BattalionReader()
    
    // MARK: - Properties
//    var detailViewController: DetailViewController? = nil
    var battalions = [Battalions]()
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredBattalions = battalions.filter { battalion in
            return battalion.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredBattalions.count
        }
        return battalions.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        let battalion: Battalions
        if searchController.active && searchController.searchBar.text != "" {
            battalion = filteredBattalions[indexPath.row]
        } else {
            battalion = battalions[indexPath.row]
        }

        cell.textLabel?.text = "\(battalion.name) \(battalion.brigade) \(battalion.division)"
        cell.detailTextLabel?.text = battalion.brigade
        // How to change the image in the table view cell
        //      cell.imageView?.image = UIImage (named: "2nd Canadian Mounted Rifles Battalion")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let battalion: Battalions
        
        // The following code segues to the Single Battalion View Controller once a battalion has been selected
        if searchController.active && searchController.searchBar.text != "" && filteredBattalions.count != 0 {
            battalion = filteredBattalions[indexPath.row]
            BattVars.battalion_id = String(battalion.id)
        } else {
            battalion = battalions[indexPath.row]
            BattVars.battalion_id = String(battalion.id)
        }

        // Segue to the SingleBattalionViewController once a row has been selected
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("SingleBattalionSegue", sender: self)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false 
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        
        battalions = allBattalions.battalions
        
        
        // loop through your allBattalions.names array
//        
//        for i in 0..<allBattalions.battalionCount
//        {
//
//            let splitArray = allBattalions.names[i].componentsSeparatedByString("-")
//
//            let battalion2 = Battalions (name: splitArray[0] , brigade: splitArray[1] , division: splitArray[2] )
//            
//            battalions.append(battalion2)
//            
//            
//        }

        
            // inside the loop
            // split up the value of each battalion based on the hyphen '-'
            // let fullNameArr = fullName.componentsSeparatedByString(" ")
            // create a local Battalion variable 
            // set each property of the object
            // stuff this inside the battalions array (use .append)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}



