//
//  BattalionReader.swift
//  JacobCulminating
//
//  Created by Student on 2016-05-27.
//  Copyright © 2016 Jacob Bland. All rights reserved.
//

import Foundation


class BattalionReader {

    var battalions = [Battalions]()
    var battalionCount: Int
    
    init()
    {
        let filePath = Bundle.main.path(forResource: "BattalionTest", ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)

        
        battalionCount = (properties!["Battalions"]! as AnyObject).count
        let allBattalions = properties!["Battalions"] as! NSArray
        
        
        for i in 0..<battalionCount {
            
            let IndviBattalion = allBattalions[i] as! NSDictionary
            let allIDS = IndviBattalion["id"] as! Int
            let allNames = IndviBattalion["name"]
            //let splitArray = allNAMES!.componentsSeparatedByString("-")
            let splitArray = (allNames! as! String).components(separatedBy: "-")
            let battalion2 = Battalions (id: allIDS , name: splitArray[0] , brigade: splitArray[1] , division: splitArray[2] )
        
            battalions.append(battalion2)
        }
        

    }


}
