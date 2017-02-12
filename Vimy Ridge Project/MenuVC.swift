//
//  Menu.swift
//  ComprehensiveMap
//
//  Created by Student on 2016-04-04.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct MapVariables {
    //static var mapType: MKMapView
    //static var sliderValue: Double = 1.0
    //static var mapCenter: CLLocationCoordinate2D
    static var zoomRegion: CLLocationDistance = 10000
    static var mapSection: Int = 1
    static var cemeteryTitle: String = ""
    //static var easterFrontID: Int
}

class MenuVC: UIViewController {
    
    @IBOutlet weak var battalionView: UIView!
    @IBOutlet weak var westernFrontView: UIView!
    @IBOutlet weak var cemeteryView: UIView!
    @IBOutlet weak var progressionView: UIView!
    
    @IBOutlet weak var maptype: UISegmentedControl!
    
    //let mapq = MapViewController.mapView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // This changes the type of map that is displayed (Battalions, Cemetery, Trenchline Progress, Western Front
    // It also changes the options inside the Menu's container for each different type of map
    @IBAction func sgementSelect(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                
                MapVariables.mapSection = 1
                self.battalionView.alpha = 1
                self.westernFrontView.alpha = 0;
                self.cemeteryView.alpha = 0;
                self.progressionView.alpha = 0;
            })
        }else if sender.selectedSegmentIndex == 1{
            UIView.animate(withDuration: 0.5, animations: {
                MapVariables.mapSection = 2
                self.battalionView.alpha = 0
                self.westernFrontView.alpha = 1;
                self.cemeteryView.alpha = 0;
                self.progressionView.alpha = 0;
            })
            
        }else if sender.selectedSegmentIndex == 2{
            UIView.animate(withDuration: 0.5, animations: {
                MapVariables.mapSection = 3
                self.battalionView.alpha = 0
                self.westernFrontView.alpha = 0;
                self.cemeteryView.alpha = 1;
                self.progressionView.alpha = 0;
            })
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                MapVariables.mapSection = 4
                self.battalionView.alpha = 0
                self.westernFrontView.alpha = 0;
                self.cemeteryView.alpha = 0;
                self.progressionView.alpha = 1;
            })
        }
        
        removeAnnotationsAndOverlays()
        
        if let parentVC = self.parent {
            if let parentVC = parentVC as? MapViewController {
                parentVC.closeMenu(UISwipeGestureRecognizer())
                // parentVC is someViewController
            }
        }
        
        //menuVC.childViewControllers[0].description
    }
    
    // This changes the display type of the map
    @IBAction func maptypeSeg(_ sender: AnyObject) {
        switch maptype.selectedSegmentIndex{
        case 0:
            mapq.mapType = .standard
        case 1:
            mapq.mapType = .hybrid
        case 2:
            mapq.mapType = .satellite
        default:
            mapq.mapType = .standard
            break;
        }
    }
    

    
    // Function to remove all items from the map
    func removeAnnotationsAndOverlays()
    {
        let allAnnotations = mapq.annotations
        mapq.removeAnnotations(allAnnotations)
        
        let allOverlays = mapq.overlays
        mapq.removeOverlays(allOverlays)
    }
}
