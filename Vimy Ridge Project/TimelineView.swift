//
//  TimelineView.swift
//  VimyRidgeApp
//
//  Created by MacBook on 2015-06-13.
//  Copyright (c) 2015 Matt Falkner. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class TimelineView:UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {
    
    var signSearch = [String]()
    var pins = [JSON]()
    var polyLine = [CLLocationCoordinate2D]()
    
    let regionRadius: CLLocationDistance = 100000
    
    var pindex = 0
    var pin: MKAnnotation?
    
    @IBOutlet var Mapper: MKMapView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func Polyline(_ sender: AnyObject) {
        
        let polyline = MKPolyline(coordinates: &polyLine, count: polyLine.count)
        
        self.Mapper.add(polyline)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        let url = "http://lest-we-forget.ca/apis/get_ww1_soldier_locations.php?access_code=\(MyVariables.access_code)&soldier_id=\(MyVariables.facebookSoldierID)"
        
        // This defines how the information will be passed to the API website
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: url) as URL?
        request.httpMethod = "GET"
        
        var response : URLResponse?

        //An array of information(url) 
        let locationData = JSON(data: try! NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response))
        
        pins = locationData.arrayValue

        if pins == [] {
            // Have message pop up explaining that no locations were found for this soldier
            //      Indicate this in the UI
        }
        else { // we have an array of locations
            for i in 0...pins.count - 1 {
                //Loops through the array then takes the significance
                let data = pins[i]
                //Allows the significance to enter an array
                signSearch.append(data["significance"].stringValue)
                
                // Create array of only CLlocation coordinate 2D points using the for-loop
                let lat = Double(data["latitude"].stringValue)
                let long = Double(data["longitude"].stringValue)
                let coor = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
                polyLine.append(coor)

            }

        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.Mapper.delegate = self
      
        
        changePin(newPindex: pindex)

    }
    //Enables the pin to change image when a new location is selected
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationReuseId = "Place"
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationReuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationReuseId)
        } else {
            anView!.annotation = annotation
        }
        
        let anno = annotation as! SoldierLocation
        
        if (anno.title == "Place of Birth") {
            anView!.image = UIImage(named: "PlaceOfBirth")
        }
        else if (anno.title == "Place of Enlistment") {
            anView!.image = UIImage(named: "PlaceOfEnlist")
        }
        else if (anno.title == "Place of Embarkation") {
            anView!.image = UIImage(named: "PlaceOfEmbark")
        }
        else if (anno.title == "Place of Disembarkation") {
            anView!.image = UIImage(named: "PlaceOfDisembark")
        }
        else if (anno.title == "Place of Death") {
            anView!.image = UIImage(named: "PlaceOfDeath")
        }
        else if (anno.title == "Place of Burial") {
            anView!.image = UIImage(named: "PlaceOfBurial")
        }
        else {
        anView!.image = UIImage(named: "OtherPin")
        }
        
        anView!.canShowCallout = true
        return anView
    }
    
    @IBAction func Previous(_ sender: AnyObject) {
        changePin(newPindex: pindex - 1)
        
    }
    @IBAction func Next(_ sender: AnyObject) {
        changePin(newPindex: pindex + 1)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        Mapper.setRegion(coordinateRegion, animated: true)
    }
    // Changes the pin(soldierLocation) on the mapView
    func changePin(newPindex: Int)
    {
        
        if pins.count == 0
        {
            return
        }
        
        pindex = newPindex
        
        if newPindex > (pins.count - 1)
        {
            pindex = 0
        }
        
        if newPindex < 0
        {
            pindex = (pins.count - 1)
        }
        
        let data = pins[pindex]

        let location = SoldierLocation(title: data["significance"].stringValue, address: data["location"].stringValue, coordinate: CLLocationCoordinate2D(latitude: data["latitude"].doubleValue, longitude: data["longitude"].doubleValue))
        if let notEmptyPin = pin
        {
            Mapper.removeAnnotation(notEmptyPin)
        }
        Mapper.addAnnotation(location)
        
        pin = location
        
        Mapper.selectAnnotation(pin!, animated: true)
        
        centerMapOnLocation(location: CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        changePin(newPindex: indexPath.row)
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return signSearch.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath as IndexPath)
        
        // Configure the cell...
        cell.textLabel?.text = signSearch[indexPath.row]
        
        if (signSearch[indexPath.row] == "Place of Birth") {
        cell.imageView?.image = UIImage(named: "PlaceOfBirth")
        }
        else if (signSearch[indexPath.row] == "Place of Enlistment") {
            cell.imageView?.image = UIImage(named: "PlaceOfEnlist")
        }
        else if (signSearch[indexPath.row] == "Place of Embarkation") {
            cell.imageView?.image = UIImage(named: "PlaceOfEmbark")
        }
        else if (signSearch[indexPath.row] == "Place of Disembarkation") {
            cell.imageView?.image = UIImage(named: "PlaceOfDisembark")
        }
        else if (signSearch[indexPath.row] == "Place of Death") {
            cell.imageView?.image = UIImage(named: "PlaceOfDeath")
        }
        else if (signSearch[indexPath.row] == "Place of Burial") {
            cell.imageView?.image = UIImage(named: "SoG")
        }
        else  {
        cell.imageView?.image = UIImage(named: "OtherPin")
        }
        
        return cell
    }
    
    //Creates polyline and connects all locations
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 5
            return polylineRenderer
        }
        
        return MKOverlayRenderer()
    }
    
}
