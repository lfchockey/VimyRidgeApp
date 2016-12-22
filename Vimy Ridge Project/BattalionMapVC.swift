//
//  WW1MapVC.swift
//  MapsTutorial
//
//  Created by Student on 2015-12-01.
//  Copyright © 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit

class BattalionMapVC: UIViewController, MKMapViewDelegate
{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var mapView: MKMapView = MKMapView()
    
    override func viewDidLoad() {
        
        nameLabel.text = ""
        
    }
    
//    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer
//    {
//        if overlay is MKPolyline
//        {
//            let polyLineView = MKPolylineRenderer(overlay: overlay)
//            polyLineView.strokeColor = UIColor.blackColor()
//            polyLineView.lineWidth = 1.0
//            
//            return polyLineView
//        }
//        
//        return MKOverlayRenderer()
//        
//    }

    
}
