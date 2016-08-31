//
//
//  SFDCICoordinates.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-24.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import Foundation
import MapKit

class VimyCoordinates{
    
    // Use this tutorial to help develop a plist and model class: http://www.raywenderlich.com/87008/overlay-views-mapkit-swift-tutorial
    
    
    var allCemeteries: [CemAnno]? = []
    
    
    
    init(filename: String) {
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)
        
        let allMemorials:NSArray = properties!["Memorials"] as! NSArray
        
        for memorial in allMemorials {
            
            let memorialDict: NSDictionary =  memorial as! NSDictionary
            
            let memTitle = memorialDict["Title"] as! String
            let memRegion = memorialDict["Region"] as! String
            let memCasualties = memorialDict["Casualties"] as! String
            let memVisitInfo = memorialDict["VisitorInfo"] as! String
            let memHistInfo = memorialDict["HistInfo"] as! String
            let newPoint = CGPointFromString(memorialDict["Coordinate"] as! String)
            let memCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(newPoint.x), CLLocationDegrees(newPoint.y))
            var cemIm = ""
            
            if memTitle == "Vimy Memorial" {
                cemIm = "VimyAppNoPhotoIcon"
            }
            else{
                cemIm = "SoG"
            }
            let Cemetery = CemAnno(title: memTitle, coordinate: memCoordinate, region: memRegion, casualties: memCasualties, visitInfo: memVisitInfo, histInfo: memHistInfo, imageName: cemIm)
            
            allCemeteries?.append(Cemetery)
        }
        
    }
}