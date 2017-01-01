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
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var casualties: UILabel!
    @IBOutlet weak var histInfo: UITextView!
    @IBOutlet weak var visitInfo: UITextView!
    
    var regionRadius: CLLocationDistance = 10000
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = "Tap A Cemetery"
        casualties.text = ""
        region.text = ""
        histInfo.text = ""
        visitInfo.text = ""
    }
}

