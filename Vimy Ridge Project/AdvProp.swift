//
//  AdvCoordinates.swift
//  VimyAdvancements
//
//  Created by Student on 2016-01-08.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import Foundation
import MapKit

class AdvProp {
	
	var advancementCoords: [CLLocationCoordinate2D] = []
	var advancementPointsCount: NSInteger = 0
	//Sets the overlay coordinates
	var overlayTopLeftCoordinate: CLLocationCoordinate2D
	var overlayTopRightCoordinate: CLLocationCoordinate2D
	var overlayBottomLeftCoordinate: CLLocationCoordinate2D
	var overlayBottomrightCoordinate: CLLocationCoordinate2D {
		get {
			return CLLocationCoordinate2DMake(overlayBottomLeftCoordinate.latitude, overlayTopRightCoordinate.longitude)
		}
	}
	//makes the overlay boundary map rectangle
	var overlayBoundingMapRect: MKMapRect {
		get {
			let topLeft = MKMapPointForCoordinate(overlayTopLeftCoordinate)
			let topRight = MKMapPointForCoordinate(overlayTopRightCoordinate)
			let bottomLeft = MKMapPointForCoordinate(overlayBottomrightCoordinate)
			
			return MKMapRectMake(topLeft.x, topLeft.y, fabs(topLeft.x-topRight.x), fabs(topLeft.y-bottomLeft.y))
		}
	}
	
	var midCoordinate: CLLocationCoordinate2D
	var name: String?
	
	
	//Decides what day coordinates to use
	init(Coor: String) {
        let filename = "daysOfBattle"
		let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "plist")
		let properties = NSDictionary(contentsOfFile: filePath!)
		var advancementPoints: NSArray = []
		
        
            advancementPoints = properties![Coor] as! NSArray
        
        
        
//		if (Coor == "BlackLine") {
//			advancementPoints = properties!["Day1"] as! NSArray
//		}
//		else if (Coor == 2) {
//			advancementPoints = properties!["Day2"] as! NSArray
//		}
//		else if (day == 3) {
//			advancementPoints = properties!["Day3"] as! NSArray
//		}
//		else if (day == 4) {
//			advancementPoints = properties!["Day4"] as! NSArray
//		}
		
		advancementPointsCount = advancementPoints.count
		advancementCoords = []
		
		//sets the coordinates in the plist
		for i in 0...advancementPoints.count-1{
			
			let k = CGPointFromString(advancementPoints[i] as! String)
			advancementCoords += [CLLocationCoordinate2DMake(CLLocationDegrees(k.x), CLLocationDegrees(k.y))]
		}
		
		//Do not delete code below
		//let midPoint = CGPointFromString(properties!["midCoord"] as! String)
		let midPoint = (CGPointMake( 50.38691198022126, 2.768321143717947))
		midCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(midPoint.x), CLLocationDegrees(midPoint.y))
		
		//let overlayTopLeftPoint = CGPointFromString(properties!["overlayTopLeftCoord"] as! String)
		let overlayTopLeftPoint = CGPointMake(50.41131198022126, 2.716321143717947)
		overlayTopLeftCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(overlayTopLeftPoint.x), CLLocationDegrees(overlayTopLeftPoint.y))
		
		//let overlayTopRightPoint = CGPointFromString(properties!["overlayTopRightCoord"] as! String)
		let overlayTopRightPoint = CGPointMake(50.41131198022126, 2.8439227294921875)
		overlayTopRightCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(overlayTopRightPoint.x), CLLocationDegrees(overlayTopRightPoint.y))
		
		//let overlayBottomLeftPoint = CGPointFromString(properties!["overlayBottomRightCoord"] as! String)
		let overlayBottomLeftPoint = CGPointMake(50.328806355320204, 2.716321143717947)
		overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(overlayBottomLeftPoint.x), CLLocationDegrees(overlayBottomLeftPoint.y))
		
		
		
		//2.768321143717947,50.38691198022126, 2.76832577888142,50.38687775561922, 2.768331561774544,50.38683506194434

	}

}