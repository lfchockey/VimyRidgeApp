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
    
    @IBOutlet weak var first: UIView!
    @IBOutlet weak var second: UIView!
    @IBOutlet weak var third: UIView!
    @IBOutlet weak var fourth: UIView!
    
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
                self.first.alpha = 1
                self.second.alpha = 0;
                self.third.alpha = 0;
                self.fourth.alpha = 0;
            })
        }else if sender.selectedSegmentIndex == 1{
            UIView.animate(withDuration: 0.5, animations: {
                MapVariables.mapSection = 2
                self.first.alpha = 0
                self.second.alpha = 1;
                self.third.alpha = 0;
                self.fourth.alpha = 0;
            })

        }else if sender.selectedSegmentIndex == 2{
            UIView.animate(withDuration: 0.5, animations: {
                MapVariables.mapSection = 3
                self.first.alpha = 0
                self.second.alpha = 0;
                self.third.alpha = 1;
                self.fourth.alpha = 0;
            })
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                MapVariables.mapSection = 4
                self.first.alpha = 0
                self.second.alpha = 0;
                self.third.alpha = 0;
                self.fourth.alpha = 1;            })
        }
        
        moveViews(sender: sender.selectedSegmentIndex)
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
    
    
    func moveViews(sender:Int) {
        
        removeAnnotationsAndOverlays() 
        // This function handles which button on the Segmented Control was clicked
        // Two things should be done for each 
        //      1. re-centre the map
        //      2. load the appropriate information
        
        
        // Each View Controller gets passed the 'mapView' as a parameter so that it can load the proper map into the mapView
        if sender == 0 {
            
//            // Battalions Map was selected
//            let battalionsMapVC = BattalionMapVC()
//            battalionsMapVC.loadBattalionView(mapq)
//            battalionsMapVC.centerMapOnLocation()
        }
        else if sender == 1 {
//            // Cemeteries/Memorials Map was selected
//            let cemeteriesMapVC = CemeteriesMapVC()
//            cemeteriesMapVC.loadCemeteriesView(mapq)
        }
        else if sender == 2 {
//            // Trenchline Progression Map was selected
//            let advMapVC = AdvMapViewController()
//            advMapVC.loadAdvMapVC(mapq)
        }
        else if sender == 3 {
//            // Western Front Map was selected
//            let westernFrontVC = WesternFrontVC()
//            westernFrontVC.loadWesternFrontVC(mapq)
       }
       else {
//            // Default to Battalions Map
//            let battalionsMapVC = BattalionMapVC()
//            battalionsMapVC.loadBattalionView(mapq)
//            battalionsMapVC.centerMapOnLocation()
       }
        //mapView.showAnnotations(mapView.annotations, animated: true)
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
