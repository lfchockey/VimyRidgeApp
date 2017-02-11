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
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TitleLabel.text = "hi""
        let Title = TitleLabel
        Title?.text = ""
        let Description = DescriptionLabel
        Description?.text = ""
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.purple
            polylineRenderer.lineWidth = 2
            return polylineRenderer
        }
        
        return MKOverlayRenderer()
    }
}
