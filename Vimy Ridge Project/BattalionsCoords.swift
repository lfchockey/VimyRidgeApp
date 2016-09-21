//
//  Coordinates.swift
//  MapsTutorial
//
//  Created by Student on 2016-01-13.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import Foundation
import MapKit

class BattalionsCoords
{
    var battalion: [CLLocationCoordinate2D]
    var battalionPointsCount: NSInteger
    
    var name: String?
    
    init(filename: String, battalionName: String)
    {
        let filePath = Bundle.main.path(forResource: filename, ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)
        
        let battalionPoints = properties![battalionName] as! NSArray
        
        battalionPointsCount = battalionPoints.count
        
        battalion = []
        
        for i in 0...battalionPointsCount - 1
        {
            let p = CGPointFromString(battalionPoints[i] as! String)
            battalion += [CLLocationCoordinate2DMake(CLLocationDegrees(p.x), CLLocationDegrees(p.y))]
        }
        
        self.name = battalionName
    }
}
