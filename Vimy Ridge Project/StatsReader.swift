//
//  StatsReader.swift
//  StatsPage
//
//  Created by Student on 2016-06-09.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class StatsReader
{
    var info = [String: String]()

    
    init(categories: String)
    {
        let filePath = NSBundle.mainBundle().pathForResource("Stats", ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)
        let information = properties![categories] as! NSDictionary
        
        info = information as! [String : String]
       
    }
}

