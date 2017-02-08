//
//  Coordinates.swift
//  MapsTutorial
//
//  Created by Student on 2016-01-13.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import Foundation

class MedalReader
{
    var medal: Medal
    
    var name: String?
    
    init(medalName: String)
    {
        let filePath = Bundle.main.path(forResource: "Medals List", ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)
        
        if let individualMedal = properties![medalName]  {
            let indMedal = individualMedal as! NSDictionary
            let medalWebsite = indMedal["website"]
            
            let medalDescription = indMedal["medalDescription"]
            
            let imageName = indMedal["imageName"]
            
            medal = Medal(newWebsite: medalWebsite! as! String, newMedalDescription: medalDescription! as! String, newImageName: imageName! as! String)
            name = medalName
        }
        else{
            medal = Medal(newWebsite: "", newMedalDescription: "", newImageName: "BasicMedal")
        }
        
    }
}


class Medal
{
    
    var website: String
    var medalDescription: String
    var imageName: String
    init(newWebsite: String, newMedalDescription: String, newImageName: String)
    {
        website = newWebsite
        medalDescription = newMedalDescription
        imageName = newImageName
    }
    
}
