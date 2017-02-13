//
//  CollapsibleTableViewController.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 5/30/16.
//  Copyright © 2016 Yong Su. All rights reserved.
//

import UIKit

struct BattalionSection {
    var name: String!
    var items: [[String:String]]!
    var collapsed: Bool!
    
    init(name: String, items: [[String:String]], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

//
// MARK: - View Controller
//
class BattalionCollapsibleTableVC: UITableViewController {
    
    var sections = [BattalionSection]()
    
    var filteredSections = [BattalionSection]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let allBattalions = BattalionReader()
    
    var battalions = [Battalions]()
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        
        
        filteredSections = [BattalionSection]()
        
        for sec in sections {
            var tempSection = BattalionSection(name: sec.name, items: [])
            for item in sec.items {
                for (key, value) in item {
                    print(key)
                    if value.lowercased().contains(searchText.lowercased()) {
                        tempSection.items.append(item)
                    }
                }
            }
            filteredSections.append(tempSection)
        }
        
        //print(filteredSections)
        
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
        battalions = allBattalions.battalions
        // Initialize the sections array
        var Div1Array = [[String: String]]()
        var Div2Array = [[String: String]]()
        var Div3Array = [[String: String]]()
        var Div4Array = [[String: String]]()
        // Loop (for loop) through every single battalion that is stored inside the "battalions" array
        for bat in battalions {
            
            if bat.id != 0{
                
                if bat.division == " 1st Division" {
                    let batName = [String(bat.id) : bat.name + bat.brigade]
                    Div1Array.append(batName)
                    
                } else if bat.division == " 2nd Division" {
                    
                    let batName = [String(bat.id) : bat.name + bat.brigade]
                    Div2Array.append(batName)
                    
                } else if bat.division == " 3rd Division" {
                    
                    let batName = [String(bat.id) : bat.name + bat.brigade]
                    Div3Array.append(batName)
                    
                } else if bat.division == " 4th Division" {
                    
                    let batName = [String(bat.id) : bat.name + bat.brigade]
                    Div4Array.append(batName)
                }
            }
        }
        

        
        sections = [
            BattalionSection(name: "Division 1", items: Div1Array),
            BattalionSection(name: "Division 2", items: Div2Array),
            BattalionSection(name: "Division 3", items: Div3Array),
            BattalionSection(name: "Division 4", items: Div4Array),
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        //print( sections[indexPath.section].items[indexPath.row])

        
        //let battalion: Battalions
        
        // The following code segues to the Single Battalion View Controller once a battalion has been selected
        if searchController.isActive && searchController.searchBar.text != "" && battalions.count != 0 {
            //battalion = filteredSections[indexPath.section].items[indexPath.row]//battalions[indexPath.row]
           // BattVars.battalion_id = String(battalion.id)
            var battalionName: String
            for (key, value) in filteredSections[indexPath.section].items[indexPath.row] {
                battalionName = value
                print("Search: \(battalionName)")
                BattVars.battalion_id = key
            }
        } else {
            var battalionName: String
            for (key, value) in sections[indexPath.section].items[indexPath.row] {
                battalionName = value
                print("No search: \(battalionName)")
                BattVars.battalion_id = key
            }
        }
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let singleBattalionController = storyboard.instantiateViewController(withIdentifier: "SingleBattalion") as! SingleBattalionViewController
        //singleBattalionController.weaponName = sections[indexPath.section].items[indexPath.row]
        self.navigationController?.pushViewController(singleBattalionController, animated: true)

//        // Segue to the SingleBattalionViewController once a row has been selected
//        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "SingleBattalionSegue", sender: self)
//        }
        
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        //cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        
        //return cell
        
        //print("Is Active: \(searchController.isActive) - Text: \(searchController.searchBar.text)")
        //let sec: Section
        //print(sections[indexPath.section].items[indexPath.row])
        var battalionName: String
        var battalionId: String
        if searchController.isActive && searchController.searchBar.text != "" {
            
            for (key, value) in filteredSections[indexPath.section].items[indexPath.row] {
                battalionId = key
                battalionName = value
                cell.textLabel?.text = battalionName//filteredSections[indexPath.section].items[indexPath.row]
            }
            //cell.textLabel?.text = filteredSections[indexPath.section].items[indexPath.row]
        } else {
            
            for (key, value) in sections[indexPath.section].items[indexPath.row] {
                battalionId = key
                battalionName = value
                cell.textLabel?.text = battalionName//filteredSections[indexPath.section].items[indexPath.row]
            }
            //cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
            //sec = sections[indexPath.section].items[indexPath.row]
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width + 1000, height: cell.frame.height - 1))
        
        let image = UIImage(named: "cellBackground")
        imageView.image = image
        cell.backgroundView = UIView()
        cell.backgroundView!.addSubview(imageView)
        cell.backgroundColor = .clear
        
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
