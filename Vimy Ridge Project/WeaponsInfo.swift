//
//  WeaponsInfo.swift
//  VimyRidgeMaster
//
//  Created by SFDCI on 2016-03-24.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import Foundation

class WeaponsInfo
{
    var country: String
    var year: String
    var overallLength: String
    var barrelLength: String
    var weight: String
    var calibre: String
    var action: String
    var magazineSize: String
    var muzzleVelocity: String
    var rateOfFire: String
    var range: String
    var sight: String
    
    init(weaponName: String)
    {
        let filePath = Bundle.main.path(forResource: "WeaponInfo", ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)
        
        let individualWeaponInfo = properties![weaponName] as! NSArray
        
        print(individualWeaponInfo)
        
        country = individualWeaponInfo[0] as! String
        year = individualWeaponInfo[1] as! String
        overallLength = individualWeaponInfo[2] as! String
        barrelLength = individualWeaponInfo[3] as! String
        weight = individualWeaponInfo[4] as! String
        calibre = individualWeaponInfo[5] as! String
        action = individualWeaponInfo[6] as! String
        magazineSize = individualWeaponInfo[7] as! String
        muzzleVelocity = individualWeaponInfo[8] as! String
        rateOfFire = individualWeaponInfo[9] as! String
        range = individualWeaponInfo[10] as! String
        sight = individualWeaponInfo[11] as! String

    }
}
