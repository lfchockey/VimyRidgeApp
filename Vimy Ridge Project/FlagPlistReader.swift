//
//  plistReader.swift
//  MapAnnotaionTest
//
//  Created by Student on 2016-12-06.
//  Copyright © 2016 KayleeCorporation. All rights reserved.
//

import Foundation
import MapKit

class FlagPlistReader {
    var flags = [Flag]()
   
    var mapMidCoord: CLLocationCoordinate2D
    var mapTopLeftCoord: CLLocationCoordinate2D
    var mapTopRightCoord: CLLocationCoordinate2D
    var mapBottomLeftCoord:CLLocationCoordinate2D
    var mapBottomRightCoord: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2DMake (mapBottomLeftCoord.latitude, mapTopRightCoord.longitude)
        }
    }
    
    var overlayBoundingMapRect: MKMapRect {
        get{
            let topLeft = MKMapPointForCoordinate(mapTopLeftCoord)
            let topRight = MKMapPointForCoordinate(mapTopRightCoord)
            let bottomLeft = MKMapPointForCoordinate(mapBottomLeftCoord)
            
            return MKMapRectMake(topLeft.x, topLeft.y, fabs(topLeft.x-topRight.x), fabs(topLeft.y-bottomLeft.y))
        }
    }
    
    var name: String?
    
    init(frontName: String) {
        let filePath = Bundle.main.path(forResource: "Flags", ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)
        
        // Get the proper Western Front Line
        let frontLine = properties![frontName] as! NSDictionary
        self.name = frontName
        
        let mapBoundary = frontLine["Boundary"] as! NSDictionary
        
        
        let midPoint = CGPointFromString(mapBoundary["midCoord"] as! String)
        mapMidCoord = CLLocationCoordinate2DMake(CLLocationDegrees(midPoint.x), CLLocationDegrees(midPoint.y))
        
        let overlayTopLeftPoint = CGPointFromString(mapBoundary["midCoord"] as! String)
        
        
        mapTopLeftCoord = CLLocationCoordinate2DMake(CLLocationDegrees(overlayTopLeftPoint.x),
                                                              CLLocationDegrees(overlayTopLeftPoint.y))
        
        let overlayTopRightPoint = CGPointFromString(mapBoundary["topRightCoord"] as! String)
        mapTopRightCoord = CLLocationCoordinate2DMake(CLLocationDegrees(overlayTopRightPoint.x),
                                                               CLLocationDegrees(overlayTopRightPoint.y))
        
        let overlayBottomLeftPoint = CGPointFromString(mapBoundary["bottomLeftCoord"] as! String)
        mapBottomLeftCoord = CLLocationCoordinate2DMake(CLLocationDegrees(overlayBottomLeftPoint.x),
                                                                 CLLocationDegrees(overlayBottomLeftPoint.y))
        
        
        let flagsArray = frontLine["Flags"] as! NSArray
        
        for flag in flagsArray
        {
            let newFlag = flag as! NSDictionary
            let newPoint = CGPointFromString(newFlag["Coordinate"] as! String)
            let newCoord = CLLocationCoordinate2DMake(CLLocationDegrees(newPoint.x), CLLocationDegrees(newPoint.y))
            let newCountry = newFlag["Country"] as! String
            let f: Flag = Flag(country: newCountry, coordinate: newCoord)
            
            flags.append(f)
        }

    }
    
}

class Flag {
    var country: String
    var name: String
    var midCoord: CLLocationCoordinate2D
    var topLeftCoord: CLLocationCoordinate2D
    var topRightCoord: CLLocationCoordinate2D
    var bottomLeftCoord:CLLocationCoordinate2D
    var bottomRightCoord: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2DMake (bottomLeftCoord.latitude, topRightCoord.longitude)
        }
    }
    
    var overlayBoundingRect: MKMapRect {
        get{
            let topLeft = MKMapPointForCoordinate(topLeftCoord)
            let topRight = MKMapPointForCoordinate(topRightCoord)
            let bottomLeft = MKMapPointForCoordinate(bottomLeftCoord)
            
            return MKMapRectMake(topLeft.x, topLeft.y, fabs(topLeft.x-topRight.x), fabs(topLeft.y-bottomLeft.y))
        }
    }
    
    init(country: String, coordinate: CLLocationCoordinate2D) {
        self.country = country
        self.name = "\(country)Flag"
        self.midCoord = coordinate
        //here is how to make the topLeftCoord from the midPoint
        topLeftCoord = CLLocationCoordinate2DMake(midCoord.latitude + 0.1, midCoord.longitude - 0.2)
        topRightCoord = CLLocationCoordinate2DMake(midCoord.latitude + 0.1, midCoord.longitude + 0.2)
        bottomLeftCoord = CLLocationCoordinate2DMake(midCoord.latitude - 0.1, midCoord.longitude - 0.2)
    }
}
