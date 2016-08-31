/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

class SearchViewController: UITableViewController, UISearchControllerDelegate {
  
  // MARK: - Properties

  var finalSoldierArray = [Soldier_Search]()
  var filteredSoldiers = [Soldier_Search]()
    
  let searchController = UISearchController(searchResultsController: nil)
  
    
    func filterContentForSearchText(searchText: String, scope: String = "Soldier Name") {

        filteredSoldiers = finalSoldierArray.filter { soldier in
            let categoryMatch = (scope == "Soldier Name") || (soldier.category == scope)
            return  categoryMatch && soldier.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        filteredSoldiers = finalSoldierArray.filter { soldier in
            if scope == "Soldier Name"{
                return  soldier.name.lowercaseString.containsString(searchText.lowercaseString)
            }
            else if scope == "Location" {
                var matchFound = false
                for loc in soldier.locations {
                    for (key, value) in loc {
                        if value.lowercaseString.containsString(searchText.lowercaseString) {
                            matchFound = true
                            soldier.category = "Location"
                            soldier.subcategory = key
                            soldier.value = value
                            break
                        }
                    }
                }
                return matchFound
                
            }
            else if scope == "Battalion" {
                var matchFound = false
                for loc in soldier.battalions {
                    for (key, value) in loc {
                        if value.lowercaseString.containsString(searchText.lowercaseString) {
                            matchFound = true
                            soldier.category = "Battalion"
                            soldier.subcategory = key
                            soldier.value = value
                            break
                        }
                    }
                }
                return matchFound
            }
            return false
        }
        
        
        tableView.reloadData()
    }
    
    
    var totalSoldiersAtTime = 0
    
    func didPresentSearchController(searchController: UISearchController) {
        self.searchController.searchBar.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if Reachability.isConnectedToNetwork() == true {
            
            // This builds a Soldier_Search object broken into the 'scopes' that will be used to search later on
            if MyVariables.allSoldiersDownloaded {
                totalSoldiersAtTime = MyVariables.allVimySoldiers.count
                
                for soldier in MyVariables.allVimySoldiers {
                    
                    // Variables used to build a Soldier_Search object
                    let soldier_id = soldier.soldier_id
                    let name = soldier.christian_names + " " + soldier.surname
                    let locations = soldier.location_array
                    
 
                    // Set up the searchable battalions
                    var battalion_array: [[String:String]] = []
                    
                    if soldier.unit_at_discharge != "" {
                        battalion_array.append(["unit_at_discharge":soldier.unit_at_discharge])
                    }
                    
                    if soldier.battalion != "" {
                        battalion_array.append(["battalion":soldier.battalion])
                    }
                    
                    if soldier.regiment_upon_enlistment != "" {
                        battalion_array.append(["regiment_upon_enlistment":soldier.regiment_upon_enlistment])
                    }
                    
                    if soldier.regiment_at_death != "" {
                        battalion_array.append(["regiment_at_death":soldier.regiment_at_death])
                    }
                    
                    let newSoldier = Soldier_Search(id: soldier_id, name: name, locations: locations, battalions: battalion_array)
                    
                    finalSoldierArray.append(newSoldier)
                }
            }
            else {
                // Re-download all soldiers OR wait until they are downloaded MyVariables().downloadAllVimySoldiers()
                if MyVariables.allSoldiersDownloadStarted {
                    // wait until download completes
                }
                else {
                    // download again
                }
            }
                
            // Setup the Search Controller
            searchController.searchResultsUpdater = self
            searchController.searchBar.delegate = self
            definesPresentationContext = true
            searchController.dimsBackgroundDuringPresentation = false
            
            // Setup the Scope Bar
            //searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
            searchController.searchBar.scopeButtonTitles = ["Soldier Name", "Location", "Battalion"]
            tableView.tableHeaderView = searchController.searchBar
            
            searchController.searchBar.text = "Please choose a category to search for soldiers"
            
            
            searchController.active = true
            
            dispatch_async(dispatch_get_main_queue(), {
                self.searchController.searchBar.becomeFirstResponder()
            });
                
            
            
        }
        else  {
            print("(Search) Internet connection FAILED")
            
            let alertController = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // When OK is pressed, segue back to the previous ViewController (Main Screen)
                self.navigationController?.popViewControllerAnimated(true)
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }

        }
    }
    
  // MARK: - View Setup
  override func viewDidLoad() {
    super.viewDidLoad()
    
    searchController.delegate = self

  }
  
    override func viewWillAppear(animated: Bool) {
        //clearsSelectionOnViewWillAppear = splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
  
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredSoldiers.count
        }
        return finalSoldierArray.count
    }
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let soldier: Soldier_Search
        
        if searchController.active && searchController.searchBar.text != "" && filteredSoldiers.count != 0 {
            soldier = filteredSoldiers[indexPath.row]
        } else {
            soldier = finalSoldierArray[indexPath.row]
        }
        cell.textLabel?.text = soldier.name
        if soldier.category == "Soldier Name" {
            cell.detailTextLabel?.text = soldier.id
        }
        else {
            cell.detailTextLabel?.text = "\(soldier.subcategory): \(soldier.value)"
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let soldier: Soldier_Search
        
        // The following code segues to the Facebook View Controller once a soldier has been selected
        if searchController.active && searchController.searchBar.text != "" && filteredSoldiers.count != 0 {
            soldier = filteredSoldiers[indexPath.row]
        } else {
            soldier = finalSoldierArray[indexPath.row]
        }
        //let index = indexPath.row as Int //Gets the index for the cell being done at that time
        MyVariables.facebookSoldierID = soldier.id //"55" // allSoldiersSorted[index]["soldier_id"].stringValue
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("FacebookSegue", sender: self)
        }
        
    }
  
  // MARK: - Segues
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    

  }
  
}

