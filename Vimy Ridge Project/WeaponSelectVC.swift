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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == weaponDetailsSegueIdentifier {
            if let destination = segue.destination as? WeaponDetailsVC {
                if let weaponIndex = tableView.indexPathForSelectedRow?.row {
                    //print (weaponIndex)
                    destination.weaponName = weapons[weaponIndex]
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return weapons.count
    }
    
    //Methods required by viewController protocols
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weapons.count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath) 
        
        let row = indexPath.row
        cell.textLabel?.text = weapons[row]
        
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        //let row = indexPath.row
        //print(weapons[row])
    }
}

