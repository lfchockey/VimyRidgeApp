//
//  ViewController.swift
//  HopeThisActuallyWorksThisTime
//
//  Created by Student on 2016-06-10.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import MapKit

class CemViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var nameLabel: UILabel!
    
    var regionRadius: CLLocationDistance = 10000

    override func viewDidAppear(_ animated: Bool) {
        nameLabel.text = ("Title: \(MapVariables.cemeteryTitle)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = ("Title: \(MapVariables.cemeteryTitle)")
    }
}

