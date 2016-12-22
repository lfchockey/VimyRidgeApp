 //
//  ViewController.swift
//  Stand alone map TP
//
//  Created by Student on 2016-06-06.
//  Copyright © 2016 Greg Mitchell. All rights reserved.

import UIKit
import MapKit

class TLPViewController: UIViewController, MKMapViewDelegate {

//    @IBOutlet weak var MapViews: MKMapView!
    
    

    var mapView: MKMapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

//    func centerMapOnLocation() {
//        let newCenter = mapView.centerCoordinate
//        
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(newCenter, regionRadius, regionRadius)
//        
//        mapView.setRegion(coordinateRegion, animated: true)
//    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
