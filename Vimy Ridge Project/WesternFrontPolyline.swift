//
//  WesternFrontPolyline.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-12-21.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import Foundation
import MapKit

class WesternFrontPolyline: MKPolyline {
    override init () {
        super.init()
    }
}

class BattalionPolyline: MKPolyline {
    let coordinates: UnsafeMutablePointer<CLLocationCoordinate2D>
    var count: Int = 0
    
    init(coordinates: UnsafeMutablePointer<CLLocationCoordinate2D>, count: Int) {
        self.coordinates = coordinates
        self.count = count
    }
}

class TrenchLineProgression: MKPolyline {
    let coordinates: UnsafeMutablePointer<CLLocationCoordinate2D>
    var count: Int = 0
    
    init(coordinates: UnsafeMutablePointer<CLLocationCoordinate2D>, count: Int) {
        self.coordinates = coordinates
        self.count = count
    }
}
