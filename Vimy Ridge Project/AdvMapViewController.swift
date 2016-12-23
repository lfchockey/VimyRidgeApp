//
//  ViewController.swift
//  VimyAdvancements
//
//  Created by Student on 2016-01-07.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AdvMapViewController: UIViewController, MKMapViewDelegate {

	var lineColour = 1
    
	//Variable of different day polylines
	var BlackLine = AdvProp(Coor: "BlackLine")
	var BlueLine = AdvProp(Coor: "BlueLine")
	var RedLine = AdvProp(Coor: "RedLine")
	var BrownLine = AdvProp(Coor: "BrownLine")
	var BeforeVimyRed = AdvProp(Coor: "BeforeVimyRed")
	var BeforeVimyBlue = AdvProp(Coor: "BeforeVimyBlue")
    var GermanLineMorningApril13 = AdvProp(Coor: "GermanLineMorningApril13th")
    var GermanLineApril12 = AdvProp(Coor: "GermanLineApril12th")
    var LineApril10 = AdvProp(Coor: "LineApril10")
	var LineLastLightApril9 = AdvProp(Coor: "LineLastLightApril9th")
    var LineApril12 = AdvProp(Coor: "LineApril12th")
    var Line2April12 = AdvProp(Coor: "Line2April12")
    var Line3April12 = AdvProp(Coor: "Line3April12")
    
    
    var pointsToUse: [CLLocationCoordinate2D] = []
    var regionRadius: CLLocationDistance = 4000
    var myPolyline: MKPolyline = MKPolyline()
    
	//@IBOutlet weak var mapView: MKMapView!
	var mapView: MKMapView = MKMapView()
    var sliderDemo = UISlider()
	@IBOutlet weak var mapType: UISegmentedControl!
	
	@IBOutlet weak var dayOfBattle: UILabel!
	
	//@IBOutlet weak var dayOfBattleSlider: UISlider!
	
	
	//What map type you are using
	@IBAction func mapTypeSwitch(sender: AnyObject) {
		let mapSwitch = mapType.selectedSegmentIndex
		switch(mapSwitch) {
		case 0:
			mapView.mapType = MKMapType.standard
		case 1:
			mapView.mapType = MKMapType.hybrid
		case 2:
			mapView.mapType = MKMapType.satellite
		default:
			mapView.mapType = MKMapType.standard
		}
	}
	
	
	
	
	
	@IBAction func ZoomIn(sender: AnyObject) {
		regionRadius = regionRadius * 0.5
		centerMapOnLocation()
	}
	
	@IBAction func ZoomOut(sender: AnyObject) {
		regionRadius = regionRadius * 2.0
		centerMapOnLocation()
	}
	
	
	
	
//	//Sets first view
//	override func viewDidLoad() {
//		let initialLocation = CLLocation(latitude: 50.373953, longitude: 2.810418)
//		let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
//		mapView.setRegion(coordinateRegion, animated: true)
//		myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
//		
//	}
    
    //Sets first view
    func loadAdvMapVC(mV: MKMapView,  value: Int) {
        
        // This connects the parameter passed (mV) and sets it as the delegate for the mapView used throughout this file
        //      In other words, it allows the mapView on the ComprehensiveMapVC to use all of the code in this file to handle different actions
        mapView = mV
        mapView.delegate = self
        
//        let initialLocation = CLLocation(latitude: 50.386911, longitude: 2.7683211)
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
//        mapView.setRegion(coordinateRegion, animated: true)
        
        let r = value
		
        // Use day 1 points
        let allOverlays = mapq.overlays
        pointsToUse = []
        
        if(r <= 10) {
            mapq.removeOverlays(allOverlays)
            lineColour = 1
            pointsToUse = BeforeVimyRed.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = BeforeVimyBlue.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            
            }
        
        //Use day 2 points
        else if(r > 10 && r <= 20) {
            mapq.removeOverlays(allOverlays)
           
            lineColour = 1
            pointsToUse = BeforeVimyRed.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = BeforeVimyBlue.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 3
            pointsToUse = BlackLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = RedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = BlueLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = LineLastLightApril9.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            }
        
        //Use day 3 points
        else if(r > 20 && r <= 30) {
            mapq.removeOverlays(allOverlays)
            
            lineColour = 1
            pointsToUse = BeforeVimyRed.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = BeforeVimyBlue.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 3
            pointsToUse = BlackLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = RedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = BlueLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = LineLastLightApril9.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 4
            pointsToUse = BrownLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 5
            pointsToUse = LineApril10.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            }
        
        //Use day 4 points
        else if(r > 30 && r <= 40) {
            mapq.removeOverlays(allOverlays)
            
            lineColour = 1
            pointsToUse = BeforeVimyRed.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = BeforeVimyBlue.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 3
            pointsToUse = BlackLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = RedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = BlueLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = LineLastLightApril9.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 4
            pointsToUse = BrownLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 5
            pointsToUse = LineApril10.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = GermanLineApril12.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = GermanLineMorningApril13.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 5
            pointsToUse = LineApril12.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = Line2April12.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = Line3April12.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            }
       
        
            
        
        
        
//        pointsToUse = []
//        // delete any polylines already on the map
//        // load the proper polyline
//        //add(1)
//        //addBoundary(1)
//        pointsToUse = SolidBlueGermanLine.advancementCoords
//        
//        myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
//        mapView.add(myPolyline)
//
//        pointsToUse = []
//        // delete any polylines already on the map
//        // load the proper polyline
//        //add(1)
//        //addBoundary(1)
//        pointsToUse = BlackLine.advancementCoords
//        
//        myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
//        mapView.add(myPolyline)

        
//        var pts: [CLLocationCoordinate2D] = []
//        let p1 = CLLocationCoordinate2D (latitude: 50.38691198022126, longitude: 2.768321143717947)
//        let p2 = CLLocationCoordinate2D (latitude: 50.38787775561922, longitude: 2.76832577888142)
//        let p3 = CLLocationCoordinate2D (latitude: 50.38883506194434, longitude: 2.768331561774544)
//        pts = [p1,p2,p3]
//        var newPolyLine = MKPolyline(coordinates: &pts, count: pts.count)
//        mapView.add(newPolyLine)
//        
//        print(mapView.overlays)
        
        
        //     programatically makes a slider
//        sliderDemo = UISlider(frame:CGRectMake(675, 1262.5, 280, 20))
//        sliderDemo.minimumValue = 10
//        sliderDemo.maximumValue = 40
//        sliderDemo.continuous = true
//        sliderDemo.tintColor = UIColor.redColor()
//        sliderDemo.value = 10
//        //sliderDemo.addTarget(self, action: #selector(AdvMapViewController.sliderValueDidChange(_:)), forControlEvents: .ValueChanged)
//        sliderDemo.addTarget(self, action: #selector(AdvMapViewController.sliderValueDidChange(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        //self.view.addSubview(sliderDemo)
//        mapq.addSubview(sliderDemo)
    }
	
	//Centers the map
	func centerMapOnLocation() {
		let newCenter = mapView.centerCoordinate
		
		let coordinateRegion = MKCoordinateRegionMakeWithDistance(newCenter, regionRadius, regionRadius)
		
		mapView.setRegion(coordinateRegion, animated: true)
		
		
		
	}
	
    
    
    
	func add(day: Int) {
//		if (day == 1) {
//			let overlay = AdvMapOverlay(town: townDay1)
//			mapView.add(overlay)
//		}  
	}
	
	func addBoundary(day: Int) {
//		if (day == 1) {
//			let polygon = MKPolygon(coordinates: &townDay1.advancementCoords, count: townDay1.advancementPointsCount)
//			mapView.add(polygon)
//		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//Sets the polyline properties
	func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
		if overlay is MKPolyline {
			let polylineView = MKPolylineRenderer(overlay: overlay)
            if lineColour == 1 {
                polylineView.strokeColor = UIColor.blue
            }
            else if lineColour == 2 {
                polylineView.strokeColor = UIColor.red
            }
            else if lineColour == 3 {
                polylineView.strokeColor = UIColor.black
            }
            else if lineColour == 4 {
                polylineView.strokeColor = UIColor.brown
            }
            else if lineColour == 5 {
                polylineView.strokeColor = UIColor.magenta
            }
			polylineView.lineWidth = 3
			
			return polylineView
		}
		return MKOverlayRenderer()
	}
	
    //func sliderValueDidChange(Sender:Int)
    //{
    //    let sliderVal = Int(Sender.value)
    //    print("value--\(sliderVal)")
    //}
 	
	

}
