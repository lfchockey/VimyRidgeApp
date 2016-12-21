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
    var subtitle: String?
    var battalionID: Int
    
    init (title: String, coordinate: CLLocationCoordinate2D, info: String, imageName: String, battalionID: Int)
    {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        let image = UIImage(named: imageName)
        self.image = image!
        self.battalionID = battalionID
    }
    
    init (title: String, subtitle: String, coordinate: CLLocationCoordinate2D, info: String, imageName: String, battalionID: Int)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.info = info
        let image = UIImage(named: imageName)
        self.image = image!
        self.battalionID = battalionID
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
