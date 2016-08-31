//
//  ViewController.swift
//  VimmyWeapons
//
//  Created by Griffin on 2015-06-12.
//  Copyright (c) 2015 KatsuSoft. All rights reserved.
//

import UIKit

class WeaponSelectVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    //Identifiers
    let textCellIdentifier = "TextCell"
    let weaponDetailsSegueIdentifier = "weaponDetailsSegue"
    
    //array of weapon names
    let weapons = ["Ross Rifle MK III (Canada)", "Lee Enfield (Canadian)", "KAR-98K (German)", "Mauser Gewehr 98 (German)", "Webley revolver (Canadian)", "Luger (German)", "Colt-browning machine gun M1895/14 (Canadian)", "Lewis (Canadian)", "Mills bomb (Canadian)", "Stick grenade (German)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Navigation for the segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == weaponDetailsSegueIdentifier {
            if let destination = segue.destinationViewController as? WeaponDetailsVC {
                if let weaponIndex = tableView.indexPathForSelectedRow?.row {
                    destination.weaponName = weapons[weaponIndex]
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return weapons.count
    }
    
    //Methods required by viewController protocols
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weapons.count
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) 
        
        let row = indexPath.row
        cell.textLabel?.text = weapons[row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //let row = indexPath.row
        //print(weapons[row])
    }
}

