//
//  TheFrontPartTwo.swift
//  MapsTutorial
//
//  Created by Student on 1/25/16.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class WesternFrontVC: UIViewController, MKMapViewDelegate
{
    
    @IBOutlet weak var MapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.purple
            polylineRenderer.lineWidth = 2
            return polylineRenderer
        }
        
        return MKOverlayRenderer()
    }
}
