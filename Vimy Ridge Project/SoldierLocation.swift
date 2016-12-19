
//  Mapping
//
//  Created by Student on 5/21/15.
//  Copyright (c) 2015 StarHopper Studios. All rights reserved.
//

import MapKit

class SoldierLocation : NSObject, MKAnnotation
{
    let title:String?
    let address:String
    let coordinate:CLLocationCoordinate2D
    
    init (title:String, address:String, coordinate:CLLocationCoordinate2D)
    {
        self.title = title
        self.address = address
 
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String?
    {
        return address
    }
}