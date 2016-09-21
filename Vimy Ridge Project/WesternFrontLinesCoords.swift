//
//  Coordinates.swift
//  MapsTutorial
//
//  Created by Student on 2016-01-13.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import Foundation
import MapKit

class WesternFrontLinesCoords
{
    var frontLineCoords: [CLLocationCoordinate2D]
    var coordCount: NSInteger
    
    var name: String?
    
    init(lineName: String)
    {
        let filename = "westernFront"
        let filePath = Bundle.main.path(forResource: filename, ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)

        let linePoints = properties![lineName] as! NSArray
        
        coordCount = linePoints.count
        
        frontLineCoords = []
        
        for i in 0...coordCount - 1
        {
            let p = CGPointFromString(linePoints[i] as! String)
            frontLineCoords += [CLLocationCoordinate2DMake(CLLocationDegrees(p.x), CLLocationDegrees(p.y))]
        }

    }
}
