//
//  ViewController.swift
//  VimmyWeapons
//
//  Created by Griffin on 2015-06-12.
//  Copyright (c) 2015 KatsuSoft. All rights reserved.
//

import UIKit

//
// MARK: - Section Data Structure
//
struct Section {
    var name: String!
    var items: [String]!
    var collapsed: Bool!
    
    init(name: String, items: [String], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

//
// MARK: - View Controller
//
class WeaponSelectVC: UITableViewController {
    
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weapons"
        
        // Initialize the sections array
        // Here we have three sections: Mac, iPad, iPhone
        sections = [
            Section(name: "Canadian Weapons", items: ["Colt-browning machine gun M1895/14","Lee Enfield", "Ross Rifle MK III",  "Webley Revolver", "Lewis", "Mills bomb"]),
            Section(name: "German Weapons", items: ["KAR-98K", "Mauser Gewehr 98", "Luger", "Stick grenade"])]
    }
    
}

//
// MARK: - View Controller DataSource and Delegate
//
extension WeaponSelectVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        //print( sections[indexPath.section].items[indexPath.row])
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let exampleViewController: WeaponDetailsVC = mainStoryboard.instantiateViewController(withIdentifier: "WDVC") as!WeaponDetailsVC
        
        exampleViewController.weaponName = sections[indexPath.section].items[indexPath.row]
        self.view.window!.rootViewController = exampleViewController
        
        //            if let destination = segue.destination as? WeaponDetailsVC {
        //                if let weaponIndex = tableView.indexPathForSelectedRow?.row {
        //                   // destination.weaponName = CanWeapons[weaponIndex]
        //                }
        //            }

    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].collapsed! ? 0 : 44.0
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
extension WeaponSelectVC: CollapsibleTableViewHeaderDelegate {
    
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


//    //Navigation for the segues
//    //func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//      //  if segue.identifier == weaponDetailsSegueIdentifier {
//            if let destination = segue.destination as? WeaponDetailsVC {
//                if let weaponIndex = tableView.indexPathForSelectedRow?.row {
//                   // destination.weaponName = CanWeapons[weaponIndex]
//                }
//            }
//        }
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var countfinal = 1
//        return countfinal//"Canadian Weapons".count + "German Weapons".count
//
//    }
//
//    //Methods required by viewController protocols
//    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return sections.count
//
//    }
//
////    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return weapons.count
////    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
//
//        let row = indexPath.row
//
//
//        return cell
//    }
//

//}

