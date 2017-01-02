//
//  CustomOverlay.swift
//  MapAnnotaionTest
//
//  Created by Student on 2016-12-09.
//  Copyright © 2016 KayleeCorporation. All rights reserved.
//

import UIKit
import MapKit


class FlagOverlay: NSObject, MKOverlay {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    var properties: Flag
    
    init(flag: Flag) {
        boundingMapRect = flag.overlayBoundingRect 
        coordinate = flag.midCoord
        properties = flag
    }
}
