//
//  CollapsibleTableViewController.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 5/30/16.
//  Copyright © 2016 Yong Su. All rights reserved.
//
// maloney

import UIKit


//
// MARK: - View Controller
//
class Developers: UITableViewController {
    
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Developers"
        
        // Initialize the sections array
        sections = [
            Section(name: "General", items: ["Owen Nichols - Tab Bar", "Craig McDonald - Loading Animation", "", "", "", "", "", ""]),
            
            Section(name: "Search", items: ["", "", "", "", "", "", "", ""]),
            
            Section(name: "Battalions", items: ["Dexter Van Zyll De Jong - Single Battalion Info Page", "", "", ""]),
            
            Section(name: "Maps", items: ["Bryce Greer - Battalion Map", "Eric Duberville - Battalion Map", "Daniel Richards - Cemetary Map", "Joey Tripp - Cemetary Map", "Greg Mitchell - Progression Map", "Michael Thibault - Soldier Timeline Map"]),
            
            Section(name: "History", items: ["Jessa Cinnamon - History Images", "Justin Yanosik - History Images", "", ""]),
            
            Section(name: "Weapons", items: ["Brynne Allan - Weapons Display", "Spencer Wright - Weapon Selection"]),
            
            Section(name: "About", items: ["Jordan Maloney - About Page"]),
            
            Section(name: "Vimy Virtual Tour", items: [""]),
            
            Section(name: "Miscellaneous", items: ["Noah Keates - PDF Download", "Tyler McHugh - Music", "Ben Seward - Music Development",])
        ]
    }
    
}

//
// MARK: - View Controller DataSource and Delegate
//
extension Developers {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[(indexPath as NSIndexPath).section].collapsed! ? 0 : 44.0
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = sections[section].name
        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
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
extension Developers: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        // Adjust the height of the rows inside the section
        tableView.beginUpdates()
        for i in 0 ..< sections[section].items.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
}
