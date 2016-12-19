import UIKit
import MapKit

class CemAnno: MKPointAnnotation {
    //var coordinate: CLLocationCoordinate2D
    //var title: String?
    var casualties: String?
    var visitInfo: String?
    var histInfo: String?
    var region: String?
    var imageName: String?
    //
    
    init(title: String, coordinate: CLLocationCoordinate2D, region: String, casualties: String, visitInfo: String, histInfo: String, imageName: String) {
        super.init()
        //super.init(coordinate: coordinate)
        self.coordinate = coordinate
        //super.init(title.title)
        self.title = title
        self.region = region
        self.casualties = casualties
        self.visitInfo = visitInfo
        self.histInfo = histInfo
        self.imageName = imageName
        
        
    }
}