//
//  ViewController.swift
//  masterMapApplication
//
//  Created by Student on 2016-06-22.
//  Copyright © 2016 StudentQ. All rights reserved.
//

import UIKit
import MapKit

internal var mapq = MKMapView();

class MapViewController: UIViewController, MKMapViewDelegate
{
    @IBOutlet weak var mapTypeSeg: UISegmentedControl!
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    var thumbImage: UIImage = UIImage(named: "PlaceOfDeath")!
    
    
    @IBOutlet weak var slider: UISlider! {
        didSet{
            slider.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI_2))
        }
    }
    
    func shouldAutoRotate() -> Bool {
        return false
    }
    
    var menuVC: MenuVC = MenuVC()
    
    // User Swipes left
    @IBAction func closeMenu(_ sender: UISwipeGestureRecognizer) {
        
        var zoomRegion: CLLocationDistance = 10000
        var centerCoordinate = CLLocation(latitude: 50.3603125, longitude: 2.794017)
        leftButton.isHidden = true
        rightButton.isHidden = true
        slider.isHidden = true
        
        if MapVariables.mapSection == 1{
            // Battalions
            zoomRegion = 10000
            loadBattalionView()
        }
        else if MapVariables.mapSection == 3{
            // Cemeteries
            zoomRegion = 110000
            centerCoordinate = CLLocation(latitude: 50.3603125, longitude: 2.3)
            addCemeteryPins()
        }
        else if MapVariables.mapSection == 4{
            // Battalion Progression
            zoomRegion = 10000
            let dummySlider = UISlider()
            sliderValueDidChange(dummySlider)
            slider.isHidden = false
        }
        else if MapVariables.mapSection == 2{
            // Western Front
            indexCounter = 0
            zoomRegion = 100000
            let dummyButton = UIButton(type: UIButtonType.custom)
            LeftPreviousClick(dummyButton)
            leftButton.isHidden = false
            rightButton.isHidden = false
        }
        else {
            // Battalions
            zoomRegion = 10000
            loadBattalionView()
        }
        
        centerMap(zoomRegion: zoomRegion, centerCoordinate: centerCoordinate)
        //NSLog(String(self.menu.frame.size.width)+"1")
        //NSLog(String(self.ribbon.frame.size.width))
        UIView.animate(withDuration: 0.5){
            // self.view.layoutIfNeeded()
            self.menuImage.transform = CGAffineTransform(translationX: 0, y: 0)
            self.menu.transform = CGAffineTransform( translationX: 0, y: 0)
        }
        UIView.animate(withDuration: 0.3, delay:0.3, options:UIViewAnimationOptions.transitionFlipFromTop,animations: {self.menu.alpha = 0}, completion: { finished in self.menu.isHidden = true})
        
        
    }
    
    // User Swipes right
    @IBAction func openMenu(_ sender: UISwipeGestureRecognizer) {
        
        menu.isHidden = false
        self.menu.alpha = 1
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
            self.menuImage.transform = CGAffineTransform(translationX: self.menu.frame.size.width, y: 0)
            self.menu.transform = CGAffineTransform(translationX: self.menu.frame.size.width, y: 0)
        }
    }
    
    
    func centerMap(zoomRegion: CLLocationDistance, centerCoordinate: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(centerCoordinate.coordinate, zoomRegion, zoomRegion)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    //************************************************************ Cemeteries Code ********//
    
    var coords = VimyCoordinates(filename: "CoordinatePrime")
    
    func addCemeteryPins(){
        mapView.addAnnotations(coords.allCemeteries!)
        //        for cem in coords.allCemeteries!
        //        {
        //            mapView.addAnnotation(cem)
        //        }
    }
    
    //************************************************************ Battalions Code ********//
    
    func loadBattalionView()
    {
        addBattalionProgression()
        
        //A battalion ID of 0 means it is a division and an ID of 200 means there is no info on this battalion//
        
        //let mapAnno = MapAnnotation(title: "", coordinate: mapView.centerCoordinate, info: "", imageName: "WW1_Map")
        
        let RCDAnno = CustomAnnotation(title: "1st Canadian Division", coordinate: CLLocationCoordinate2D(latitude: 50.342916, longitude: 2.762067), info: "", imageName: "1st_Canadian_Division", battalionID: 0)
        
        let BCDAnno = CustomAnnotation(title: "2nd Canadian Division", coordinate: CLLocationCoordinate2D(latitude: 50.357961, longitude: 2.760195), info: "", imageName: "2nd_Canadian_Division", battalionID: 0)
        
        let TCDAnno = CustomAnnotation(title: "3rd Canadian Division", coordinate: CLLocationCoordinate2D(latitude: 50.368502, longitude: 2.756538), info: "", imageName: "3rd_Canadian_Division", battalionID: 0)
        
        let GCDAnno = CustomAnnotation(title: "4th Canadian Division", coordinate: CLLocationCoordinate2D(latitude: 50.380502, longitude: 2.748538), info: "", imageName: "4th_Canadian_Division", battalionID: 0)
        
        
        //mapView.addAnnotation(mapAnno)
        mapView.addAnnotations([RCDAnno, BCDAnno, TCDAnno, GCDAnno])
        
        //CANADIAN LIGHT HORSE BATTALION
        let CLHBtln = MKPointAnnotation()
        CLHBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35618098, longitude: 2.828108226)
        CLHBtln.title = "Canadian Light Horse"
        CLHBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        mapView.addAnnotation(CLHBtln)
        
        //THESE ARE THE BATTALIONS FOR THE FIRST CANADIAN BATTALION
        //THEY ARE REPRESENTED IN THE RED COLORED PINS
        let firstBtln = CustomAnnotation(title: "First Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.34348275, longitude: 2.795996613), info: "", imageName: "redpin", battalionID: 2)
        
        let thirdBtln = CustomAnnotation(title: "Third Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.34784179 , longitude: 2.802417669), info: "", imageName: "redpin", battalionID: 4)
        
        let fourthBtln = CustomAnnotation(title: "Fourth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.35104023, longitude: 2.801177693), info: "", imageName: "redpin", battalionID: 5)
        
        let fifthBtln = CustomAnnotation(title: "Fifth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.3394157, longitude: 2.778975022), info: "", imageName: "redpin", battalionID: 6)
        
        let seventhBtln = CustomAnnotation(title: "Seventh Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.3409035, longitude: 2.776169928), info: "", imageName: "redpin", battalionID: 8)
        
        let tenthBtln = CustomAnnotation(title: "Tenth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.34316676 , longitude: 2.776272507), info: "", imageName: "redpin", battalionID: 11)
        
        let fifteenthBtln = CustomAnnotation(title: "Fifteenth Infantry battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.34671669, longitude: 2.7782153), info: "", imageName: "redpin", battalionID: 16)
        
        let sixteenthBtln = CustomAnnotation(title: "Sixteenth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.35080195, longitude: 2.777740588), info: "", imageName: "redpin", battalionID: 17)
        
        let fourteenthBtln = CustomAnnotation(title: "Fourteenth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.34923897, longitude: 2.777667547), info: "", imageName: "redpin", battalionID: 15)
        
        mapView.addAnnotations([firstBtln, thirdBtln, fourthBtln, fifthBtln, seventhBtln, tenthBtln, fifteenthBtln, sixteenthBtln, fourteenthBtln])
        
        //THESE ARE THE BATTALIONS FOR THE SECOND CANADIAN DIVISION
        //THEY WILL BE REPRESENTED BY THE BLUE COLORED PINS
        let eighteenthBtln = CustomAnnotation(title: "Eighteenth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.35473195, longitude: 2.779731165), info: "", imageName: "bluepin", battalionID: 19)
        
        let nineteenthBtln = CustomAnnotation(title: "Ninteenth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.35682645, longitude: 2.779599529), info: "", imageName: "bluepin", battalionID: 20)
        
        let twentyFirstBtln = CustomAnnotation(title: "Twenty First Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.35690015, longitude: 2.788733997), info: "", imageName: "bluepin", battalionID: 22)
        
        let twentyFourthBtln = CustomAnnotation(title: "Twenty Fourth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude:  50.36014951, longitude: 2.777689765), info: "", imageName: "bluepin", battalionID: 25)
        
        let twentyFifthBtln = CustomAnnotation(title: "Twenty Fifth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.36226467, longitude: 2.788116412), info: "", imageName: "bluepin", battalionID: 26)
        
        let twentySixthBtln = CustomAnnotation(title: "Twenty Sixth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.3621372, longitude: 2.776310446), info: "", imageName: "bluepin", battalionID: 27)
        
        let twentySeventhBtln = CustomAnnotation(title: "Twenty Seventh Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.35565268, longitude: 2.812303409), info: "", imageName: "bluepin", battalionID: 28)
        
        let twentyEighthBtln = CustomAnnotation(title: "Twenty Eighth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.3571143, longitude: 2.79977458), info: "", imageName: "bluepin", battalionID: 29)
        
        let twentyNinthBtln = CustomAnnotation(title: "Twenty Ninth Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.35870853, longitude: 2.799682779), info: "", imageName: "bluepin", battalionID: 30)
        
        let thirtyFirstBtln = CustomAnnotation(title: "Thirty First Infantry Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.35499403, longitude: 2.800049098), info: "", imageName: "bluepin", battalionID: 32)
        
        //IF NEEDED ADD KOSB AND RWK, as they are apart of Vimy but British Battalions
        
        mapView.addAnnotations([eighteenthBtln, nineteenthBtln, twentyFirstBtln, twentyFourthBtln, twentyFifthBtln, twentySixthBtln, twentySeventhBtln, twentyEighthBtln, twentyNinthBtln, thirtyFirstBtln])
        
        
        //THESE ARE THE BATTALIONS FOR THE THIRD CANADIAN DIVISION
        //THEY WILL BE REPRESENTED BY TEAL COLORED PINS
        let firstCMRBtln = CustomAnnotation(title: "First Canadian Mounted Rifles", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.36463325, longitude: 2.775284673), info: "", imageName: "greypin", battalionID: 200)
        
        let secondCMRBtln = CustomAnnotation(title: "Second Canadian Mounted Rifles", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.36588241, longitude: 2.774601799), info: "", imageName: "greypin", battalionID: 200)
        
        let fourthCMRBtln = CustomAnnotation(title: "Fourth Canadian Mounted Rifles", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.36749979, longitude: 2.774809122), info: "", imageName: "greypin", battalionID: 200)
        
        let RCRBtln = CustomAnnotation(title: "Royal Canadian Regiment", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.36994368, longitude: 2.773580659), info: "", imageName: "greypin", battalionID: 200)
        
        let PPCLBtln = CustomAnnotation(title: "Princess Patricia's Canadian Light Infantry", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.37109738, longitude: 2.773026878), info: "", imageName: "greypin", battalionID: 200)
        
        let fourtySecondBtln = CustomAnnotation(title: "Fourty Second Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.37249977, longitude: 2.772518971), info: "", imageName: "greypin", battalionID: 43)
        
        mapView.addAnnotations([firstCMRBtln, secondCMRBtln, fourthCMRBtln, RCRBtln, PPCLBtln, fourtySecondBtln])
        
        //THESE ARE THE BATTALIONS FOR THE FOURTH CANADIAN DIVISION
        //THEY WILL BE REPRESENTED BY GREEN PINS
        let Bn38 = CustomAnnotation(title: "Thirty Eighth Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.381244765, longitude: 2.757600297), info: "", imageName: "greenpin", battalionID: 39)
        
        let Bn44 = CustomAnnotation(title: "Fourty Fourth Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.39012826, longitude: 2.757368657), info: "", imageName: "greenpin", battalionID: 45)
        
        let Bn46 = CustomAnnotation(title: "Fourty Sixth Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.39394918, longitude: 2.755998408), info: "", imageName: "greenpin", battalionID: 47)
        
        let Bn50 = CustomAnnotation(title: "Fiftieth Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.3921456, longitude: 2.75685735), info: "", imageName: "greenpin", battalionID: 51)
        
        let Bn54 = CustomAnnotation(title: "Fifty Fourth Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.37399391, longitude: 2.766712696), info: "", imageName: "greenpin", battalionID: 55)
        
        let Bn72 = CustomAnnotation(title: "Seventy Second Battalion", subtitle: "ADD LIMK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.38554766, longitude: 2.757600297), info: "", imageName: "greenpin", battalionID: 73)
        
        let Bn73 = CustomAnnotation(title: "Seventy Third Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.3882427, longitude: 2.758001418), info: "", imageName: "greenpin", battalionID: 74)
        
        let Bn78 = CustomAnnotation(title: "Seventy Eighth Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.38443809, longitude: 2.768904849), info: "", imageName: "greenpin", battalionID: 79)
        
        let Bn87 = CustomAnnotation(title: "Eighty Seventh Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.37694187, longitude: 2.763486207), info: "", imageName: "greenpin", battalionID: 88)
        //^My Great Great Grandfather and Great Great Uncle were part of this Battalion --- Daniel//
        
        let Bn102 = CustomAnnotation(title: "One Hundred and Second Battalion", subtitle: "ADD LINK TO BATTALION WEBSITE HERE", coordinate: CLLocationCoordinate2D(latitude: 50.375318, longitude: 2.765923169), info: "", imageName: "greenpin", battalionID: 104)
        
        mapView.addAnnotations([Bn38, Bn44, Bn46, Bn50, Bn54, Bn72, Bn73, Bn78, Bn87, Bn102])
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    func addBattalionProgression()
    {
        let CHLbattalion = BattalionsCoords(filename: "BattalionMovement", battalionName: " CND Light Horse ")
        
        let polyLine = MKPolyline(coordinates: &CHLbattalion.battalion, count: CHLbattalion.battalionPointsCount)
        mapView.add(polyLine)
        
        //FIRST CANADIAN DIVISION
        let battalion1A = BattalionsCoords(filename: "BattalionMovement", battalionName: " 1st Bn ")
        let battalion1B = BattalionsCoords(filename: "BattalionMovement", battalionName: " 3rd Bn ")
        let battalion1C = BattalionsCoords(filename: "BattalionMovement", battalionName: " 4th Bn ")
        let battalion1D = BattalionsCoords(filename: "BattalionMovement", battalionName: " 5th Bn ")
        let battalion1E = BattalionsCoords(filename: "BattalionMovement", battalionName: " 7th Bn ")
        let battalion1F = BattalionsCoords(filename: "BattalionMovement", battalionName: " 10th Bn ")
        let battalion1G = BattalionsCoords(filename: "BattalionMovement", battalionName: " 14th Bn ")
        let battalion1H = BattalionsCoords(filename: "BattalionMovement", battalionName: " 15th Bn ")
        let battalion1I = BattalionsCoords(filename: "BattalionMovement", battalionName: " 16th Bn ")
        
        let polyLine1A = MKPolyline(coordinates: &battalion1A.battalion, count: battalion1A.battalionPointsCount)
        mapView.add(polyLine1A)
        
        let polyLine1B = MKPolyline(coordinates: &battalion1B.battalion, count: battalion1B.battalionPointsCount)
        mapView.add(polyLine1B)
        
        let polyLine1C = MKPolyline(coordinates: &battalion1C.battalion, count: battalion1C.battalionPointsCount)
        mapView.add(polyLine1C)
        
        let polyLine1D = MKPolyline(coordinates: &battalion1D.battalion, count: battalion1D.battalionPointsCount)
        mapView.add(polyLine1D)
        
        let polyLine1E = MKPolyline(coordinates: &battalion1E.battalion, count: battalion1E.battalionPointsCount)
        mapView.add(polyLine1E)
        
        let polyLine1F = MKPolyline(coordinates: &battalion1F.battalion, count: battalion1F.battalionPointsCount)
        mapView.add(polyLine1F)
        
        let polyLine1G = MKPolyline(coordinates: &battalion1G.battalion, count: battalion1G.battalionPointsCount)
        mapView.add(polyLine1G)
        
        let polyLine1H = MKPolyline(coordinates: &battalion1H.battalion, count: battalion1H.battalionPointsCount)
        mapView.add(polyLine1H)
        
        let polyLine1I = MKPolyline(coordinates: &battalion1I.battalion, count: battalion1I.battalionPointsCount)
        mapView.add(polyLine1I)
        
        //SECOND CANADIAN DIVISION
        let battalion2A = BattalionsCoords(filename: "BattalionMovement", battalionName: " 18th Bn ")
        let battalion2B = BattalionsCoords(filename: "BattalionMovement", battalionName: " 19th Bn ")
        let battalion2C = BattalionsCoords(filename: "BattalionMovement", battalionName: " 21st Bn ")
        let battalion2D = BattalionsCoords(filename: "BattalionMovement", battalionName: " 24th Bn ")
        let battalion2E = BattalionsCoords(filename: "BattalionMovement", battalionName: " 25th Bn ")
        let battalion2F = BattalionsCoords(filename: "BattalionMovement", battalionName: " 26th Bn ")
        let battalion2G = BattalionsCoords(filename: "BattalionMovement", battalionName: " 27th Bn ")
        let battalion2H = BattalionsCoords(filename: "BattalionMovement", battalionName: " 28th Bn ")
        let battalion2I = BattalionsCoords(filename: "BattalionMovement", battalionName: " 29th Bn ")
        let battalion2J = BattalionsCoords(filename: "BattalionMovement", battalionName: " 31st Bn ")
        
        let polyLine2A = MKPolyline(coordinates: &battalion2A.battalion, count: battalion2A.battalionPointsCount)
        mapView.add(polyLine2A)
        
        let polyLine2B = MKPolyline(coordinates: &battalion2B.battalion, count: battalion2B.battalionPointsCount)
        mapView.add(polyLine2B)
        
        let polyLine2C = MKPolyline(coordinates: &battalion2C.battalion, count: battalion2C.battalionPointsCount)
        mapView.add(polyLine2C)
        
        let polyLine2D = MKPolyline(coordinates: &battalion2D.battalion, count: battalion2D.battalionPointsCount)
        mapView.add(polyLine2D)
        
        let polyLine2E = MKPolyline(coordinates: &battalion2E.battalion, count: battalion2E.battalionPointsCount)
        mapView.add(polyLine2E)
        
        let polyLine2F = MKPolyline(coordinates: &battalion2F.battalion, count: battalion2F.battalionPointsCount)
        mapView.add(polyLine2F)
        
        let polyLine2G = MKPolyline(coordinates: &battalion2G.battalion, count: battalion2G.battalionPointsCount)
        mapView.add(polyLine2G)
        
        let polyLine2H = MKPolyline(coordinates: &battalion2H.battalion, count: battalion2H.battalionPointsCount)
        mapView.add(polyLine2H)
        
        let polyLine2I = MKPolyline(coordinates: &battalion2I.battalion, count: battalion2I.battalionPointsCount)
        mapView.add(polyLine2I)
        
        let polyLine2J = MKPolyline(coordinates: &battalion2J.battalion, count: battalion2J.battalionPointsCount)
        mapView.add(polyLine2J)
        
        //THIRD CANADIAN DIVISION
        let battalion3A = BattalionsCoords(filename: "BattalionMovement", battalionName: " 1st CMR ")
        let battalion3B = BattalionsCoords(filename: "BattalionMovement", battalionName: " 2nd CMR ")
        let battalion3C = BattalionsCoords(filename: "BattalionMovement", battalionName: " 4th CMR ")
        let battalion3D = BattalionsCoords(filename: "BattalionMovement", battalionName: " P.P.L.C.I. ")
        let battalion3E = BattalionsCoords(filename: "BattalionMovement", battalionName: " R.C.R ")
        let battalion3F = BattalionsCoords(filename: "BattalionMovement", battalionName: " 42nd Bn ")
        
        let polyLine3A = MKPolyline(coordinates: &battalion3A.battalion, count: battalion3A.battalionPointsCount)
        mapView.add(polyLine3A)
        
        let polyLine3B = MKPolyline(coordinates: &battalion3B.battalion, count: battalion3B.battalionPointsCount)
        mapView.add(polyLine3B)
        
        let polyLine3C = MKPolyline(coordinates: &battalion3C.battalion, count: battalion3C.battalionPointsCount)
        mapView.add(polyLine3C)
        
        let polyLine3D = MKPolyline(coordinates: &battalion3D.battalion, count: battalion3D.battalionPointsCount)
        mapView.add(polyLine3D)
        
        let polyLine3E = MKPolyline(coordinates: &battalion3E.battalion, count: battalion3E.battalionPointsCount)
        mapView.add(polyLine3E)
        
        let polyLine3F = MKPolyline(coordinates: &battalion3F.battalion, count: battalion3F.battalionPointsCount)
        mapView.add(polyLine3F)
        
        //Fourth Canadian Division
        let battalion4J = BattalionsCoords(filename: "BattalionMovement", battalionName: " 38th Bn ")
        let battalion4A = BattalionsCoords(filename: "BattalionMovement", battalionName: " 44th Bn ")
        let battalion4B = BattalionsCoords(filename: "BattalionMovement", battalionName: " 46th Bn ")
        let battalion4C = BattalionsCoords(filename: "BattalionMovement", battalionName: " 50th Bn ")
        let battalion4D = BattalionsCoords(filename: "BattalionMovement", battalionName: " 54th Bn ")
        let battalion4E = BattalionsCoords(filename: "BattalionMovement", battalionName: " 72nd Bn ")
        let battalion4F = BattalionsCoords(filename: "BattalionMovement", battalionName: " 73rd Bn ")
        let battalion4G = BattalionsCoords(filename: "BattalionMovement", battalionName: " 78th Bn ")
        let battalion4H = BattalionsCoords(filename: "BattalionMovement", battalionName: " 87th Bn ")
        let battalion4I = BattalionsCoords(filename: "BattalionMovement", battalionName: " 102nd Bn ")
        
        let polyLine4J = MKPolyline(coordinates: &battalion4J.battalion, count: battalion4J.battalionPointsCount)
        mapView.add(polyLine4J)
        
        let polyLine4A = MKPolyline(coordinates: &battalion4A.battalion, count: battalion4A.battalionPointsCount)
        mapView.add(polyLine4A)
        
        let polyLine4B = MKPolyline(coordinates: &battalion4B.battalion, count: battalion4B.battalionPointsCount)
        mapView.add(polyLine4B)
        
        let polyLine4C = MKPolyline(coordinates: &battalion4C.battalion, count: battalion4C.battalionPointsCount)
        mapView.add(polyLine4C)
        
        let polyLine4D = MKPolyline(coordinates: &battalion4D.battalion, count: battalion4D.battalionPointsCount)
        mapView.add(polyLine4D)
        
        let polyLine4E = MKPolyline(coordinates: &battalion4E.battalion, count: battalion4E.battalionPointsCount)
        mapView.add(polyLine4E)
        
        let polyLine4F = MKPolyline(coordinates: &battalion4F.battalion, count: battalion4F.battalionPointsCount)
        mapView.add(polyLine4F)
        
        let polyLine4G = MKPolyline(coordinates: &battalion4G.battalion, count: battalion4G.battalionPointsCount)
        mapView.add(polyLine4G)
        
        let polyLine4H = MKPolyline(coordinates: &battalion4H.battalion, count: battalion4H.battalionPointsCount)
        mapView.add(polyLine4H)
        
        let polyLine4I = MKPolyline(coordinates: &battalion4I.battalion, count: battalion4I.battalionPointsCount)
        mapView.add(polyLine4I)
    }
    
    func resizeImage(image: UIImage, newHeight: CGFloat) -> UIImage
    {
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        //UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        //image.draw(in: CGRectMake(0, 0, newWidth, newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    //************************************************************* Western Fronts Code ********//
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func infoClick(_ sender: AnyObject) {
    }
    
    @IBAction func RightNextClick(_ sender: UIButton) {
        let allOverlays = mapView.overlays
        mapView.removeOverlays(allOverlays)
        
        indexCounter += 1
        
        if indexCounter > lineArray.count - 1 {
            indexCounter = 0
        }
        
        let newLine = lineArray[indexCounter]
        
        let printName = lineArray[indexCounter].name
        nameLabel.text = printName
        
        var Polyine1900: MKPolyline = MKPolyline()
        Polyine1900 = MKPolyline(coordinates: &newLine.frontLineCoords, count: newLine.coordCount)
        mapView.add(Polyine1900)
        
    }
    
    @IBAction func LeftPreviousClick(_ sender: UIButton) {
        let allOverlays = mapView.overlays
        mapView.removeOverlays(allOverlays)
        
        indexCounter -= 1
        
        if indexCounter < 0 {
            indexCounter = lineArray.count - 1
        }
        
        let newLine = lineArray[indexCounter]
        
        let printName = lineArray[indexCounter].name
        nameLabel.text = printName
        
        var Polyine1900: MKPolyline = MKPolyline()
        Polyine1900 = MKPolyline(coordinates: &newLine.frontLineCoords, count: newLine.coordCount)
        mapView.add(Polyine1900)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        let newLine = lineArray[0]
        //
        //        var Polyine1900: MKPolyline = MKPolyline()
        //        Polyine1900 = MKPolyline(coordinates: &newLine.frontLineCoords, count: newLine.coordCount)
        
        //mapView.add(Polyine1900)
    }
    
    var regionRadius: CLLocationDistance = 50000
    
    var line191516 = WesternFrontLinesCoords(lineName: "1915-1916")
    var line1917 = WesternFrontLinesCoords(lineName: "1917")
    var lineHB = WesternFrontLinesCoords(lineName: "Hindenburg Line")
    var lineFGO = WesternFrontLinesCoords(lineName: "Final German Offensives 1918")
    var lineFAO = WesternFrontLinesCoords(lineName: "Final Allied Offensives 1918")
    
    var indexCounter: Int = 0
    var lineArray: [WesternFrontLinesCoords] = []
    
    var pointsToUse1: [CLLocationCoordinate2D] = []
    var pointsToUse2: [CLLocationCoordinate2D] = []
    var pointsToUse3: [CLLocationCoordinate2D] = []
    var pointsToUse4: [CLLocationCoordinate2D] = []
    var pointsToUse5: [CLLocationCoordinate2D] = []
    var Polyine1: MKPolyline = MKPolyline()
    var Polyine2: MKPolyline = MKPolyline()
    var Polyine3: MKPolyline = MKPolyline()
    var Polyine4: MKPolyline = MKPolyline()
    var Polyine5: MKPolyline = MKPolyline()
    
    //************************************************************ Trench Line Progressions Code ********//
    
    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
        
        let sliderVal = Int(sender.value)
        let r = sliderVal
        
        let allOverlays = mapView.overlays
        mapView.removeOverlays(allOverlays)
        pointsToUse = []
        
        if(r <= 10) {
            pointsToUse = ThickRedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = RedDashedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = SolidBlueGermanLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
        }
        else if(r > 10 && r <= 20) {
            pointsToUse = ThickBlueLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = RedDottedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = ThickBrownLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
        }
        else if(r > 20 && r <= 30) {
            pointsToUse = BlueDottedLine12thApril.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = GermanLineMorningApril13th.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = RedLineApril12th.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
        }
        else if(r > 30 && r <= 40) {
            pointsToUse = BlackLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
        }
    }
    
    var BlackLine = AdvProp(Coor: "BlackLine")
    var RedDashedLine = AdvProp(Coor: "RedDashedLine")
    var SolidBlueGermanLine = AdvProp(Coor: "SolidBlueGermanLine")
    var RedDottedLine = AdvProp(Coor: "RedDottedLine")
    var ThickBrownLine = AdvProp(Coor: "ThickBrownLine")
    var BlueDottedLine12thApril = AdvProp(Coor: "BlueDottedLine12thApril")
    var GermanLineMorningApril13th = AdvProp(Coor: "GermanLineMorningApril13th")
    var RedLineApril12th = AdvProp(Coor: "RedLineApril12th")
    var ThickBlueLine = AdvProp(Coor: "ThickBlueLine")
    var ThickRedLine = AdvProp(Coor: "ThickRedLine")
    
    var pointsToUse: [CLLocationCoordinate2D] = []
    //    var regionRadius: CLLocationDistance = 4000
    var myPolyline: MKPolyline = MKPolyline()
    
    //******************************************** mapView functions *************//
    
    // Needs an if statement to determine which type of line needs to be displayed (WesternFront, Battalion, Progression)
    // This function is for the Progression
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            
            if indexCounter == 0 {
                polylineRenderer.strokeColor = UIColor.red
            } else if indexCounter == 1 {
                polylineRenderer.strokeColor = UIColor.blue
            } else if indexCounter == 2 {
                polylineRenderer.strokeColor = UIColor.init(colorLiteralRed:0.09, green:0.48, blue:0.18, alpha:1.0)
            } else if indexCounter == 3 {
                polylineRenderer.strokeColor = UIColor.init(colorLiteralRed:0.90, green:0.41, blue:0.00, alpha:1.0)
            } else if indexCounter == 4 {
                polylineRenderer.strokeColor = UIColor.purple
            }
            
            // polylineRenderer.strokeColor = UIColor.init(colorLiteralRed:0.10, green:0.15, blue:0.39, alpha:0.85)
            // polylineRenderer.lineWidth = 2
            return polylineRenderer
        }
        
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        let identifier = "CemAnno"
        let identifier1 = "CustomAnnotation"
        let identifier2 = "Annotation"
        
        if annotation.isKind(of: CemAnno.self)        // The CemAnno is for the cemeteries ONLY
        {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                let btn = UIButton(type: .detailDisclosure)
                
                annotationView!.rightCalloutAccessoryView = btn
                
                let cpa = annotation as! CemAnno
                annotationView!.image = UIImage(named: cpa.imageName!)
                
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        else if annotation.isKind(of: CustomAnnotation.self)         // The CustomAnnotation is for the division squares ONLY
        {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier1)
            
            if annotationView == nil
            {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier1)
                annotationView!.canShowCallout = true
            }
            else
            {
                annotationView!.annotation = annotation
            }
            
            let ca = annotation as! CustomAnnotation
            if ca.battalionID > 1 && ca.battalionID < 18
            {
                annotationView!.centerOffset = CGPoint(x: 0, y: -ca.image.size.height / 9)  //CGPointMake(0, -ca.image.size.height / 2);
            }
            else if ca.battalionID > 18 && ca.battalionID < 33
            {
                annotationView!.centerOffset = CGPoint(x: 0, y: -ca.image.size.height / 3)  //CGPointMake(0, -ca.image.size.height / 2);
            }
            else if ca.battalionID == 43 || ca.battalionID == 200
            {
                annotationView!.centerOffset = CGPoint(x: 0, y: -35)
                //print(ca.image.size.height)
                //annotationView!.centerOffset = CGPoint(x: 0, y: -1 * (ca.image.size.height / 2));
                //annotationView!.centerOffset = CGPoint(x: 0, y: -ca.image.size.height / 10 - 50)  //CGPointMake(0, -ca.image.size.height / 2);
                //annotationView!.backgroundColor = UIColor.black
            }
            else if ca.battalionID > 38 && ca.battalionID < 105
            {
                annotationView!.centerOffset = CGPoint(x: 0, y: -35)
            }
            annotationView!.image = ca.image
            annotationView!.image = resizeImage(image: annotationView!.image!, newHeight: 75)
            
            
            //            let btn = UIButton(type: .DetailDisclosure)
            //            btn.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            //            annotationView!.rightCalloutAccessoryView = btn
            
            return annotationView
        }
        else if annotation is MKPointAnnotation         // The MKPointAnnotation is for the red pins ONLY
        {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier2)
            
            if annotationView == nil
            {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier2)
                annotationView!.canShowCallout = true
                // This line adds a default picture, but this can be customized to be any UIView
                //                if #available(iOS 9.0, *) {
                //                    annotationView!.detailCalloutAccessoryView = UIImageView(image: UIImage(named:"redhawk"))
                //                } else {
                //                    // Fallback on earlier versions
                //                }
            }
            
            let btn = UIButton(type: .detailDisclosure)
            //btn.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            annotationView!.rightCalloutAccessoryView = btn
            //annotationView!.backgroundColor = UIColor.blackColor()
            
            return annotationView
        }
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        
        if view.annotation!.isKind(of: CemAnno.self)
        {
            openMenu(UISwipeGestureRecognizer())
            let customAnno = view.annotation as! CemAnno
            let title = customAnno.title
            let casualties = customAnno.casualties
            let region = customAnno.region
            let visitInfo = customAnno.visitInfo
            let HistInfo = customAnno.histInfo
            print(menuVC.childViewControllers[0].description)
            let cemVC = menuVC.childViewControllers[0] as! CemViewController
            cemVC.nameLabel.text = title!
            cemVC.region.text = region!
            cemVC.casualties.text = casualties!
            cemVC.histInfo.text = HistInfo!
            cemVC.visitInfo.text = visitInfo!
            
            menu.isHidden = false
            self.menu.alpha = 1
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
                self.menuImage.transform = CGAffineTransform(translationX: self.menu.frame.size.width, y: 0)
                self.menu.transform = CGAffineTransform(translationX: self.menu.frame.size.width, y: 0)
            }
        }
        else if view.annotation!.isKind(of: CustomAnnotation.self)
        {
            let customAnno = view.annotation as! CustomAnnotation
            let subtitle = customAnno.subtitle
            print(customAnno.battalionID)
            
            let ac = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
        else
        {
            let anno = view.annotation as! MKPointAnnotation
            let title = anno.title
            let subtitle = anno.subtitle
            
            let ac = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let vc = segue.destination as? MenuVC {
            menuVC = vc
        }
    }
    let startRegionRadius: CLLocationDistance = 10000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, startRegionRadius * 2.0 , startRegionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func mapType(_ sender: AnyObject) {
        switch mapTypeSeg.selectedSegmentIndex{
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
            let thumbImage: UIImage = UIImage (named: "PlaceOfDeath")!
            let reSize = resizeImage(image: thumbImage, newHeight: 55.0)
            
            slider.setThumbImage(reSize, for: UIControlState.normal)
        }
        else if (self.view.traitCollection.horizontalSizeClass != UIUserInterfaceSizeClass.compact) {
            slider.setThumbImage(UIImage(named: "PlaceOfDeath")!, for: .normal)
        }
        
        let initialLocation = CLLocation(latitude: 50.3603125, longitude: 2.794017)
        centerMapOnLocation(location: initialLocation)
        
        
        
        
        mapView.delegate = self
        slider.isHidden = true
        leftButton.isHidden = true
        rightButton.isHidden = true
        
        mapq = mapView
        
        lineArray = [line191516,line1917,lineHB,lineFGO,lineFAO]
        
        //loadBattalionView()
        
        //addCemeteryPins()
        
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
