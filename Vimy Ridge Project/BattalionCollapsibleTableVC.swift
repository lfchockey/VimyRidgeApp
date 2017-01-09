//
//  CollapsibleTableViewController.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 5/30/16.
//  Copyright © 2016 Yong Su. All rights reserved.
//

import UIKit

//
// MARK: - View Controller
//
class BattalionCollapsibleTableVC: UITableViewController {
    
    var sections = [Section]()
    
    var filteredSections = [Section]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let allBattalions = BattalionReader()
    //
    var battalions = [Battalions]()
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        
        filteredSections = [Section]()
        
        for sec in sections {
            var tempSection = Section(name: sec.name, items: [])
            for item in sec.items {
                if item.lowercased().contains(searchText.lowercased()) {
                    tempSection.items.append(item)
                }
            }
            filteredSections.append(tempSection)
        }
        
        print(filteredSections)
        
        DispatchQueue.main.async{
            
            //self.tableView.deleteRows(at: [IndexPath], with: <#T##UITableViewRowAnimation#>)
            //self.tableView.deleteSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableViewRowAnimation#>)
            self.tableView.reloadData()
        }
        
        //tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Battalions"
        
        // Initialize the sections array
        // Jacob, right here you are going to have to create 4 different arrays for each one of your divisions.
        // How do you do that:
            // Create four different division arrays that will hold all of the battalions from that specific division
            // Loop (for loop) through every single battalion that is stored inside the "battalions" array
                // the "battalions" array is an array filled with "Battalion" objects from Battalions.swift
                // that means they get the following properties: id, name, brigade, division
                // you only need to look at the division
        
                // use a big if... else if... else if statement to determine which divison the specific battalion belongs to
                    // i.e. if the battalion is a part of the "2nd Division" then we should append the "battalions.name" to the 2nd division array
                    // this way you'll have all of the battalions in their proper division
        
            // After the loop is completed, all you have to do is add the array name to the items below
        
        //you also may want to add a piece of code that filters out any of the divisions that we don't have information on in the database (if we don't have information on them, we probably don't want to be able to select them)
        
        sections = [
            Section(name: "Division 1", items: ["\(battalions)"]),
            //Section(name: "Division 2", items: ["\(battalions.name) \(battalions.brigade)"]),
            //Section(name: "Division 3", items: ["\(battalions.name) \(battalions.brigade)"]),
            //Section(name: "Division 4", items: ["\(battalions.name) \(battalions.brigade)"]),
        ]
    }
    
}

extension BattalionCollapsibleTableVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

//
// MARK: - View Controller DataSource and Delegate
//
extension BattalionCollapsibleTableVC {
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredSections.count
        }
        
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return sections[section].items.count
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredSections[section].items.count
        }
        return sections[section].items.count
        //return sections.count
    }
    
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        //cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        
        //return cell
        
        print("Is Active: \(searchController.isActive) - Text: \(searchController.searchBar.text)")
        //let sec: Section
        
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.textLabel?.text = filteredSections[indexPath.section].items[indexPath.row]
        } else {
            
            cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
            //sec = sections[indexPath.section].items[indexPath.row]
        }
        
        //cell.textLabel?.text = sec
        //cell.detailTextLabel?.text = battalion.brigade
        // How to change the image in the table view cell
        //      cell.imageView?.image = UIImage (named: "2nd Canadian Mounted Rifles Battalion")
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredSections[indexPath.section].collapsed! ? 0 : 44.0
        }
        
        return sections[indexPath.section].collapsed! ? 0 : 44.0
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        if searchController.isActive && searchController.searchBar.text != "" {
            header.titleLabel.text = filteredSections[section].name
            header.setCollapsed(filteredSections[section].collapsed)
        }
        else {
            header.titleLabel.text = sections[section].name
            header.setCollapsed(sections[section].collapsed)
        }
        header.arrowLabel.text = ">"
        
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

//
// MARK: - Section Header Delegate
//
extension BattalionCollapsibleTableVC: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        if searchController.isActive && searchController.searchBar.text != "" {
            let collapsed = !filteredSections[section].collapsed
            
            // Toggle collapse
            filteredSections[section].collapsed = collapsed
            header.setCollapsed(collapsed)
        }
        else {
            let collapsed = !sections[section].collapsed
            
            // Toggle collapse
            sections[section].collapsed = collapsed
            header.setCollapsed(collapsed)
        }
        
        
        // Adjust the height of the rows inside the section
        tableView.beginUpdates()
        if searchController.isActive && searchController.searchBar.text != "" {
            for i in 0 ..< filteredSections[section].items.count {
                tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
            }
        }
        else {
            for i in 0 ..< sections[section].items.count {
                tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
            }
        }
        tableView.endUpdates()
    }
    
}
