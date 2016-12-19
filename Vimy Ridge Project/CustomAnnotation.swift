//
//  CustomAnnotation.swift
//  MapsTutorial
//
//  Created by Student on 2016-01-06.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation
{
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var image: UIImage
    
    init (title: String, coordinate: CLLocationCoordinate2D, info: String, imageName: String)
    {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        let image = UIImage(named: imageName)
        self.image = image!
    }
}

class MapAnnotation: NSObject, MKAnnotation
{
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var image: UIImage
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, imageName: String)
    {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        let image = UIImage(named: imageName)
        self.image = image!
    }
}