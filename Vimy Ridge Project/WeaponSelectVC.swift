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

struct ImageSection {
    var name: String!
    var items: [UIImage]!
    var collapsed: Bool!
    
    init(name: String, items: [UIImage], collapsed: Bool = false) {
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
    var imageSections = [ImageSection]()
    var canPics = [ #imageLiteral(resourceName: "Ross Rifle"), #imageLiteral(resourceName: "Lewis Gun"), #imageLiteral(resourceName: "Webley Revolver"),#imageLiteral(resourceName: "Mills Bomb"),#imageLiteral(resourceName: "Sopwith Camel"),#imageLiteral(resourceName: "Mark V Tank")]
    var gerPics = [#imageLiteral(resourceName: "Luger"),#imageLiteral(resourceName: "Stick Grenade")]
    //Identifiers
    let textCellIdentifier = "TextCell"
    let weaponDetailsSegueIdentifier = "weaponDetailsSegue"
    
    //array of weapon names

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weapons"
        
        // Initialize the sections array
        sections = [
            Section(name: "Canadian Weapons", items: ["Ross Rifle MK III",  "Lewis",  "Webley Revolver",   "Mills bomb" , "Sopwith Camel", "Mark V Tank"]),
            Section(name: "German Weapons", items: ["Luger", "Stick grenade"])]
       
        imageSections = [
            ImageSection(name: "Canadian Weapons", items: canPics),
            ImageSection(name: "German Weapons", items: gerPics)]

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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SpencerTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SpencerTableViewCell? ?? SpencerTableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        //cell.imageView?.image = imageSections[indexPath.section].items[indexPath.row]
        let img = imageSections[indexPath.section].items[indexPath.row]
        let imgW = img.size.width
        let imgH = img.size.height
        print ("width : \(imgW) height : \(imgH)")
        let frameWidth = cell.myImage.frame.width
        let newheight = frameWidth * imgH / imgW
        cell.myImage.frame = CGRect (x: cell.bounds.width - 50, y: 0, width: frameWidth, height: newheight)
        cell.myImage?.image = imageSections[indexPath.section].items[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        //print( sections[indexPath.section].items[indexPath.row])
        //let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let exampleViewController: WeaponDetailsVC = mainStoryboard.instantiateViewController(withIdentifier: "WDVC") as!WeaponDetailsVC
        //if let exampleViewController: HistoryViewController = self.storyboard?.instantiateViewController(withIdentifier: "History") as? HistoryViewController
        //self.navigationController?.pushViewController(WeaponDetailsVC(), animated: true)
        //print(self.storyboard?.description)
        
        
        //self.navigationController?.pushViewController(WeaponDetailsVC(), animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let weaponDetailController = storyboard.instantiateViewController(withIdentifier: "WDVC") as! WeaponDetailsVC
        weaponDetailController.weaponName = sections[indexPath.section].items[indexPath.row]
        self.navigationController?.pushViewController(weaponDetailController, animated: true)
        
        
        //self.storyboard = storyboard
        //self.present(controller, animated: true, completion: nil)
        
//        if let exampleViewController: WeaponDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "WDVC") as? WeaponDetailsVC
//        {
//            exampleViewController.weaponName = sections[indexPath.section].items[indexPath.row]
//            //self.view.window!.rootViewController = exampleViewController
//            self.navigationController?.pushViewController(exampleViewController, animated: true)
//        }
        
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

