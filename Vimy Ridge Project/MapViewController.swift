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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    var menuVC: MenuVC = MenuVC()
    
    // User Swipes left
    @IBAction func closeMenu(_ sender: UISwipeGestureRecognizer) {
        
        var zoomRegion: CLLocationDistance = 10000
        var centerCoordinate = CLLocation(latitude: 50.3603125, longitude: 2.794017)
        leftButton.isHidden = true
        rightButton.isHidden = true
        slider.isHidden = true
        nameLabel.isHidden = true
        infoButton.isHidden = true
        
        if MapVariables.mapSection == 1{
            // Battalions
            zoomRegion = 10000
            loadBattalionView()
        }
        else if MapVariables.mapSection == 2{
            // Cemeteries
            zoomRegion = 110000
            centerCoordinate = CLLocation(latitude: 50.3603125, longitude: 2.3)
            addCemeteryPins()
        }
        else if MapVariables.mapSection == 3{
            // Battalion Progression
            zoomRegion = 10000
            let dummySlider = UISlider()
            sliderValueDidChange(dummySlider)
            slider.isHidden = false
        }
        else if MapVariables.mapSection == 4{
            // Western Front
            zoomRegion = 100000
            leftButton.isHidden = false
            rightButton.isHidden = false
            let dummyButton = UIButton()
            LeftPreviousClick(dummyButton)
            RightNextClick(dummyButton)
            nameLabel.isHidden = false
            nameLabel.text = lineArray[indexCounter].name
            infoButton.isHidden = false
        }
        else {
            
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
        
        //let mapAnno = MapAnnotation(title: "", coordinate: mapView.centerCoordinate, info: "", imageName: "WW1_Map")
        
        let RCDAnno = CustomAnnotation(title: "1st Canadian Division", coordinate: CLLocationCoordinate2D(latitude: 50.342916, longitude: 2.762067), info: "", imageName: "1st_Canadian_Division")
        
        let BCDAnno = CustomAnnotation(title: "2nd Canadian Division", coordinate: CLLocationCoordinate2D(latitude: 50.357961, longitude: 2.760195), info: "", imageName: "2nd_Canadian_Division")
        
        let TCDAnno = CustomAnnotation(title: "3rd Canadian Division", coordinate: CLLocationCoordinate2D(latitude: 50.368502, longitude: 2.756538), info: "", imageName: "3rd_Canadian_Division")
        
        let GCDAnno = CustomAnnotation(title: "4th Canadian Division", coordinate: CLLocationCoordinate2D(latitude: 50.380502, longitude: 2.748538), info: "", imageName: "4th_Canadian_Division")
        
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
        let firstBtln = MKPointAnnotation()
        firstBtln.coordinate = CLLocationCoordinate2D(latitude: 50.34348275, longitude: 2.795996613)
        firstBtln.title = "First Infantry Battalion"
        firstBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let thirdBtln = MKPointAnnotation()
        thirdBtln.coordinate = CLLocationCoordinate2D(latitude: 50.34784179 , longitude: 2.802417669)
        thirdBtln.title = "Third Infantry Battalion"
        thirdBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let fourthBtln = MKPointAnnotation()
        fourthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35104023, longitude: 2.801177693)
        fourthBtln.title = "Fourth Infantry Battalion"
        fourthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let fifthBtln = MKPointAnnotation()
        fifthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.3394157, longitude: 2.778975022)
        fifthBtln.title = "Fifth Infantry Battalion"
        fifthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let seventhBtln = MKPointAnnotation()
        seventhBtln.coordinate = CLLocationCoordinate2D(latitude: 50.3409035, longitude: 2.776169928)
        seventhBtln.title = "Seventh Infantry Battalion"
        seventhBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let tenthBtln = MKPointAnnotation()
        tenthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.34316676 , longitude: 2.776272507)
        tenthBtln.title = "Tenth Infantry Battalion"
        tenthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let fifteenthBtln = MKPointAnnotation()
        fifteenthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.34671669, longitude: 2.7782153)
        fifteenthBtln.title = "Fifteenth Infantry Battalion"
        fifteenthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let sixteenthBtln = MKPointAnnotation()
        sixteenthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35080195, longitude: 2.777740588)
        sixteenthBtln.title = "Sixteenth Infantry Battalion"
        sixteenthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let fourteenthBtln = MKPointAnnotation()
        fourteenthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.34923897, longitude: 2.777667547)
        fourteenthBtln.title = "Fourteenth Infantry Battalion"
        fourteenthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        mapView.addAnnotations([firstBtln, thirdBtln, fourthBtln, fifthBtln, seventhBtln, tenthBtln, fifteenthBtln, sixteenthBtln, fourteenthBtln])
        
        //THESE ARE THE BATTALIONS FOR THE SECOND CANADIAN DIVISION
        //THEY WILL BE REPRESENTED BY THE BLUE COLORED PINS
        let eighteenthBtln = MKPointAnnotation()
        eighteenthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35473195, longitude: 2.779731165)
        eighteenthBtln.title = "Eighteenth Infantry Battalion"
        eighteenthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let nineteenthBtln = MKPointAnnotation()
        nineteenthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35682645, longitude: 2.779599529)
        nineteenthBtln.title = "Nineteenth Infantry Battalion"
        nineteenthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let twentyFirstBtln = MKPointAnnotation()
        twentyFirstBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35690015, longitude: 2.788733997)
        twentyFirstBtln.title = "Twenty First Infantry Battalion"
        twentyFirstBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let twentyFourthBtln = MKPointAnnotation()
        twentyFourthBtln.coordinate = CLLocationCoordinate2D(latitude:  50.36014951, longitude: 2.777689765)
        twentyFourthBtln.title = "Twenty Fourth Infantry Battalion"
        twentyFourthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let twentyFifthBtln = MKPointAnnotation()
        twentyFifthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.36226467, longitude: 2.788116412)
        twentyFifthBtln.title = "Twenty Fifth Infantry Battalion"
        twentyFifthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let twentySixthBtln = MKPointAnnotation()
        twentySixthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.3621372, longitude: 2.776310446)
        twentySixthBtln.title = "Twenty Sixth Infantry Battalion"
        twentySixthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let twentySeventhBtln = MKPointAnnotation()
        twentySeventhBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35565268, longitude: 2.812303409)
        twentySeventhBtln.title = "Twenty Seventh Infantry Battalion"
        twentySeventhBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let twentyEighthBtln = MKPointAnnotation()
        twentyEighthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.3571143, longitude: 2.79977458)
        twentyEighthBtln.title = "Twenty Eighth Infantry Battalion"
        twentyEighthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let twentyNinthBtln = MKPointAnnotation()
        twentyNinthBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35870853, longitude: 2.799682779)
        twentyNinthBtln.title = "Twenty Ninth Infantry Battalion"
        twentyNinthBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let thirtyFirstBtln = MKPointAnnotation()
        thirtyFirstBtln.coordinate = CLLocationCoordinate2D(latitude: 50.35499403, longitude: 2.800049098)
        thirtyFirstBtln.title = "Thirty First Infantry Battalion"
        thirtyFirstBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        //IF NEEDED ADD KOSB AND RWK, as they are apart of Vimy but British Battalions
        
        mapView.addAnnotations([eighteenthBtln, nineteenthBtln, twentyFirstBtln, twentyFourthBtln, twentyFifthBtln, twentySixthBtln, twentySeventhBtln, twentyEighthBtln, twentyNinthBtln, thirtyFirstBtln])
        
        
        //THESE ARE THE BATTALIONS FOR THE THIRD CANADIAN DIVISION
        //THEY WILL BE REPRESENTED BY TEAL COLORED PINS
        let firstCMRBtln = MKPointAnnotation()
        firstCMRBtln.coordinate = CLLocationCoordinate2D(latitude: 50.36463325, longitude: 2.775284673)
        firstCMRBtln.title = "First Canadian Mounted Rifles"
        firstCMRBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let secondCMRBtln = MKPointAnnotation()
        secondCMRBtln.coordinate = CLLocationCoordinate2D(latitude: 50.36588241, longitude: 2.774601799)
        secondCMRBtln.title = "Second Canadian Mounted Rifles"
        secondCMRBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let fourthCMRBtln = MKPointAnnotation()
        fourthCMRBtln.coordinate = CLLocationCoordinate2D(latitude: 50.36749979, longitude: 2.774809122)
        fourthCMRBtln.title = "Fourth Canadian Mounted Rifles"
        fourthCMRBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let RCRBtln = MKPointAnnotation()
        RCRBtln.coordinate = CLLocationCoordinate2D(latitude: 50.36994368, longitude: 2.773580659)
        RCRBtln.title = "Royal Canadian Regiment"
        RCRBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let PPCLBtln = MKPointAnnotation()
        PPCLBtln.coordinate = CLLocationCoordinate2D(latitude: 50.37109738, longitude: 2.773026878)
        PPCLBtln.title = "Princess Patricia's Canadian Light Infantry"
        PPCLBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let fourtySecondBtln = MKPointAnnotation()
        fourtySecondBtln.coordinate = CLLocationCoordinate2D(latitude: 50.37249977, longitude: 2.772518971)
        fourtySecondBtln.title = "Fourty Second Battalion"
        fourtySecondBtln.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        mapView.addAnnotations([firstCMRBtln, secondCMRBtln, fourthCMRBtln, RCRBtln, PPCLBtln, fourtySecondBtln])
        
        //THESE ARE THE BATTALIONS FOR THE FOURTH CANADIAN DIVISION
        //THEY WILL BE REPRESENTED BY GREEN PINS
        /*
         let Bn38 = MKPointAnnotation()
         Bn38.coordinate = CLLocationCoordinate2D() //Missing Cooridnates
         Bn38.title = "Thirty Eighth Battalion"
         */
        let Bn44 = MKPointAnnotation()
        Bn44.coordinate = CLLocationCoordinate2D(latitude: 50.39012826, longitude: 2.757368657)
        Bn44.title = "Fourty Fourth Battalion"
        Bn44.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let Bn46 = MKPointAnnotation()
        Bn46.coordinate = CLLocationCoordinate2D(latitude: 50.39394918, longitude: 2.755998408)
        Bn46.title = "Fourty Sixth Battalion"
        Bn46.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let Bn50 = MKPointAnnotation()
        Bn50.coordinate = CLLocationCoordinate2D(latitude: 50.3921456, longitude: 2.75685735)
        Bn50.title = "Fiftieth Battalion"
        Bn50.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let Bn54 = MKPointAnnotation()
        Bn54.coordinate = CLLocationCoordinate2D(latitude: 50.37399391, longitude: 2.766712696)
        Bn54.title = "Fifty Fourth Battalion"
        Bn54.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let Bn72 = MKPointAnnotation()
        Bn72.coordinate = CLLocationCoordinate2D(latitude: 50.38554766, longitude: 2.757600297)
        Bn72.title = "Seventy Second Battalion"
        Bn72.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let Bn73 = MKPointAnnotation()
        Bn73.coordinate = CLLocationCoordinate2D(latitude: 50.3882427, longitude: 2.758001418)
        Bn73.title = "Seventy Third Battalion"
        Bn73.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let Bn78 = MKPointAnnotation()
        Bn78.coordinate = CLLocationCoordinate2D(latitude: 50.38443809, longitude: 2.768904849)
        Bn78.title = "Seventy Eighth Battalion"
        Bn78.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let Bn87 = MKPointAnnotation()
        Bn87.coordinate = CLLocationCoordinate2D(latitude: 50.37694187, longitude: 2.763486207)
        Bn87.title = "Eighty Seventh Battalion"
        Bn87.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        let Bn102 = MKPointAnnotation()
        Bn102.coordinate = CLLocationCoordinate2D(latitude: 50.375318, longitude: 2.765923169)
        Bn102.title = "One Hundred and Second Battalion"
        Bn102.subtitle = "ADD LINK TO BATTALION WEBSITE HERE"
        
        mapView.addAnnotations([Bn44, Bn46, Bn50, Bn54, Bn72, Bn73, Bn78, Bn87, Bn102])
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
        let battalion4A = BattalionsCoords(filename: "BattalionMovement", battalionName: " 44th Bn ")
        let battalion4B = BattalionsCoords(filename: "BattalionMovement", battalionName: " 46th Bn ")
        let battalion4C = BattalionsCoords(filename: "BattalionMovement", battalionName: " 50th Bn ")
        let battalion4D = BattalionsCoords(filename: "BattalionMovement", battalionName: " 54th Bn ")
        let battalion4E = BattalionsCoords(filename: "BattalionMovement", battalionName: " 72nd Bn ")
        let battalion4F = BattalionsCoords(filename: "BattalionMovement", battalionName: " 73rd Bn ")
        let battalion4G = BattalionsCoords(filename: "BattalionMovement", battalionName: " 78th Bn ")
        let battalion4H = BattalionsCoords(filename: "BattalionMovement", battalionName: " 87th Bn ")
        let battalion4I = BattalionsCoords(filename: "BattalionMovement", battalionName: " 102nd Bn ")
        
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
    
    @IBAction func infoClick(_ sender: AnyObject) {
        let name = lineArray[indexCounter].name
//      let info = lineArray[indexCounter]."whatever the information varibale is called"
        
        let wfVC = menuVC.childViewControllers[0] as! WesternFrontVC
        
        wfVC.titleLabel.text = name
//      wfVC.descriptionLabel = info
        
        menu.isHidden = false
        self.menu.alpha = 1
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
            self.menuImage.transform = CGAffineTransform(translationX: self.menu.frame.size.width, y: 0)
            self.menu.transform = CGAffineTransform(translationX: self.menu.frame.size.width, y: 0)
        }
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
        
        var zoomRegion: CLLocationDistance = 11000
        var centerCoordinate = CLLocation(latitude: 50.3603125, longitude: 2.794017)
        
        let sliderVal = Int(sender.value)
        let r = sliderVal
        
        var lineColour = 0
        let allOverlays = mapView.overlays
        mapView.removeOverlays(allOverlays)
        pointsToUse = []
        
        if(r <= 10) {
            mapq.removeOverlays(allOverlays)
            lineColour = 1
            pointsToUse = BeforeVimyRed.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = BeforeVimyBlue.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            
        }
            
            //Use day 2 points
        else if(r > 10 && r <= 20) {
            mapq.removeOverlays(allOverlays)
            
            lineColour = 1
            pointsToUse = BeforeVimyRed.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = BeforeVimyBlue.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 3
            pointsToUse = BlackLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = RedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = BlueLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = LineLastLightApril9th.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
        }
            
            //Use day 3 points
        else if(r > 20 && r <= 30) {
            mapq.removeOverlays(allOverlays)
            
            lineColour = 1
            pointsToUse = BeforeVimyRed.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = BeforeVimyBlue.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 3
            pointsToUse = BlackLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = RedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = BlueLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = LineLastLightApril9th.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 4
            pointsToUse = BrownLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 5
            pointsToUse = LineApril10.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
        }
            
            //Use day 4 points
        else if(r > 30 && r <= 40) {
            mapq.removeOverlays(allOverlays)
            
            lineColour = 1
            pointsToUse = BeforeVimyRed.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = BeforeVimyBlue.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 3
            pointsToUse = BlackLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = RedLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = BlueLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 1
            pointsToUse = LineLastLightApril9th.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 4
            pointsToUse = BrownLine.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 5
            pointsToUse = LineApril10.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 2
            pointsToUse = GermanLineApril12th.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = GermanLineMorningApril13th.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            lineColour = 5
            pointsToUse = LineApril12th.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = Line2April12.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
            pointsToUse = Line3April12.advancementCoords
            myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
            mapView.add(myPolyline)
            
        }
        centerMap(zoomRegion: zoomRegion, centerCoordinate: centerCoordinate)
    }

    var BlackLine = AdvProp(Coor: "BlackLine")
    var BlueLine = AdvProp(Coor: "BlueLine")
    var RedLine = AdvProp(Coor: "RedLine")
    var BrownLine = AdvProp(Coor: "BrownLine")
    var BeforeVimyRed = AdvProp(Coor: "BeforeVimyRed")
    var BeforeVimyBlue = AdvProp(Coor: "BeforeVimyBlue")
    var GermanLineMorningApril13th = AdvProp(Coor: "GermanLineMorningApril13th")
    var GermanLineApril12th = AdvProp(Coor: "GermanLineApril12th")
    var LineApril10 = AdvProp(Coor: "LineApril10")
    var LineLastLightApril9th = AdvProp(Coor: "LineLastLightApril9th")
    var LineApril12th = AdvProp(Coor: "LineApril12th")
    var Line2April12 = AdvProp(Coor: "Line2April12")
    var Line3April12 = AdvProp(Coor: "Line3April12")
    
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
            let customAnno = view.annotation as! CemAnno
            let title = customAnno.title
            let casualties = customAnno.casualties
            let region = customAnno.region
            let visitInfo = customAnno.visitInfo
            let HistInfo = customAnno.histInfo
            
            let cemVC = menuVC.childViewControllers[2] as! CemViewController
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
        else if view.annotation is MKPointAnnotation
        {
            let anno = view.annotation as! MKPointAnnotation
            let title = anno.title
            let subtitle = anno.subtitle
            
            let batVC = menuVC.childViewControllers[3] as! BattalionMapVC
            batVC.nameLabel.text = title!
            
            menu.isHidden = false
            self.menu.alpha = 1
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
                self.menuImage.transform = CGAffineTransform(translationX: self.menu.frame.size.width, y: 0)
                self.menu.transform = CGAffineTransform(translationX: self.menu.frame.size.width, y: 0)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let vc = segue.destination as? MenuVC {
            menuVC = vc
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
