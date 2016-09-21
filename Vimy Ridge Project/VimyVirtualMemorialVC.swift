//
//  ViewController.swift
//  Vimy
//
//  Created by Student on 2016-04-26.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class VimyVirtualMemorialVC: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var btn3: UIButton!
   
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var label: UILabel!
   
    @IBOutlet weak var btn4: UIButton!
    var totalSoldiersAtTime = 0
    var allSoldiersAtTime = [JSON]()
    var pageNumber = 0
    
    var myArray = [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,]
    let numberOfSoldiersPerPage = 4
    
    var numOfPages: Int = 0
    
    var leftOver: Float = 0.0
    var IDArray: [String] = []
    
  
    
    var finalSoldierArray: [FullSoldier] = []
    
    var testArray: [String] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if MyVariables.allSoldiersDownloaded {
            finalSoldierArray = MyVariables.allVimySoldiers
        }
        
        
        numOfPages = Int(ceil(Float(finalSoldierArray.count) / Float(numberOfSoldiersPerPage)))
        
        
        
        print(" number of pages \(numOfPages)")
       // print(String(newSoldier.newSoldier_id))
        
        //this code sets up your swipe gestures
//        let swipeRight = UISwipeGestureRecognizer(target: self, action:#selector(VimyVirtualMemorialVC.swiped(_:)))
//        swipeRight.direction = .Right
//        self.view.addGestureRecognizer(swipeRight)
//         let swipeLeft = UISwipeGestureRecognizer(target: self, action:#selector(VimyVirtualMemorialVC.swiped(_:)))
//        swipeLeft.direction = .Left
//        self.view.addGestureRecognizer(swipeLeft)
//       
//        // this sets the name of your buttons baced on the page number and soldiers per page
//
//        
//        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        
//        
//        btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//       
//        btn3.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname), forState: UIControlState.Normal)
//        btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//       
//        btn4.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname), forState: UIControlState.Normal)
//        btn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        
//        /*
//        btn5.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname), forState: UIControlState.Normal)
//        btn5.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn6.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname), forState: UIControlState.Normal)
//        btn6.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn7.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname), forState: UIControlState.Normal)
//        btn7.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn8.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname), forState: UIControlState.Normal)
//        btn8.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//       
//        btn9.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname), forState: UIControlState.Normal)
//        btn9.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn10.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname), forState: UIControlState.Normal)
//        btn10.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn11.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].surname), forState: UIControlState.Normal)
//        btn11.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//         
//        btn12.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].surname), forState: UIControlState.Normal)
//        btn12.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn13.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].surname), forState: UIControlState.Normal)
//        btn13.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn14.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].surname), forState: UIControlState.Normal)
//        btn14.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn15.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].surname), forState: UIControlState.Normal)
//        btn15.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn16.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].surname), forState: UIControlState.Normal)
//        btn16.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//       
//        btn17.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].surname), forState: UIControlState.Normal)
//        btn17.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn18.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].surname), forState: UIControlState.Normal)
//        btn18.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        
//        btn19.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].surname), forState: UIControlState.Normal)
//        btn19.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//       
//        btn20.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].surname), forState: UIControlState.Normal)
//        btn20.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        */
//        
//        self.label.text = String(pageNumber)
//    
//        print(myArray.count)
//        leftOver = Float( myArray.count) % Float(numberOfSoldiersPerPage);
//        print("left over \(leftOver)")
//        //remainder = leftOver - Float(maxNumOfPages)
//        //print(remainder)
//    
//        
//        
//        
//        
//        
//        
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    func swiped(gesture: UISwipeGestureRecognizer){
//       
//       
//        //this is just making sure the user swipes
//        
//        //let swipeGesture = gesture as? UISwipeGestureRecognizer
//        
//            //dependent on the direction of the swipe the soldiers names will change
//        switch gesture.direction{
//            case UISwipeGestureRecognizerDirection.right:
//                print("swiped right")
//                pageNumber -= 1
//                print(pageNumber)
//                print(myArray[4])
//            
//                //if the page number gets less than 0 it resets it to the last "page" of names baced on the aray from the databace
//                if(pageNumber <= -1){
//                    
//                    pageNumber = numOfPages - 1
//                    print("i reset to last page")
//                }
//                
//                self.label.text = String(pageNumber)
//                // this is the code for the last page
//                if( pageNumber == numOfPages - 1 ){
//                    
//                    if(leftOver == 1.0){
//                        
//                        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                    }
//                    
//                    
//                    if(leftOver == 2.0){
//                       
//                        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//                        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                    }
//                    
//                    if(leftOver == 3.0){
//                        
//                        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                       
//                        btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//                        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn3.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname), forState: UIControlState.Normal)
//                        btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        
//                        
//                    }
//                    if(leftOver == 0.0){
//                       
//                        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//                        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                       
//                        btn3.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname), forState: UIControlState.Normal)
//                        btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn4.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname), forState: UIControlState.Normal)
//                        btn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        
//                        
//                        /*
//                         btn5.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname), forState: UIControlState.Normal)
//                         btn5.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn6.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname), forState: UIControlState.Normal)
//                         btn6.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn7.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname), forState: UIControlState.Normal)
//                         btn7.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn8.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname), forState: UIControlState.Normal)
//                         btn8.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn9.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname), forState: UIControlState.Normal)
//                         btn9.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn10.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname), forState: UIControlState.Normal)
//                         btn10.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn11.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].surname), forState: UIControlState.Normal)
//                         btn11.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn12.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].surname), forState: UIControlState.Normal)
//                         btn12.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn13.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].surname), forState: UIControlState.Normal)
//                         btn13.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn14.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].surname), forState: UIControlState.Normal)
//                         btn14.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn15.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].surname), forState: UIControlState.Normal)
//                         btn15.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn16.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].surname), forState: UIControlState.Normal)
//                         btn16.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn17.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].surname), forState: UIControlState.Normal)
//                         btn17.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn18.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].surname), forState: UIControlState.Normal)
//                         btn18.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn19.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].surname), forState: UIControlState.Normal)
//                         btn19.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn20.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].surname), forState: UIControlState.Normal)
//                         btn20.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         */
//                        
//                    }
//                    
//                    
//                    
//                }
//                    
//                    
//                    
//                else if(pageNumber != numOfPages - 1){
//                    print(pageNumber)
//                    print(numOfPages)
//                    
//                    btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                    btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                    
//                    btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//                    btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                    btn3.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname), forState: UIControlState.Normal)
//                    btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                    btn4.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname), forState: UIControlState.Normal)
//                    btn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//               
//                    
//                    /*
//                     btn5.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname), forState: UIControlState.Normal)
//                     btn5.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn6.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname), forState: UIControlState.Normal)
//                     btn6.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn7.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname), forState: UIControlState.Normal)
//                     btn7.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn8.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname), forState: UIControlState.Normal)
//                     btn8.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn9.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname), forState: UIControlState.Normal)
//                     btn9.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn10.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname), forState: UIControlState.Normal)
//                     btn10.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn11.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].surname), forState: UIControlState.Normal)
//                     btn11.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn12.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].surname), forState: UIControlState.Normal)
//                     btn12.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn13.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].surname), forState: UIControlState.Normal)
//                     btn13.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn14.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].surname), forState: UIControlState.Normal)
//                     btn14.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn15.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].surname), forState: UIControlState.Normal)
//                     btn15.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn16.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].surname), forState: UIControlState.Normal)
//                     btn16.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn17.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].surname), forState: UIControlState.Normal)
//                     btn17.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn18.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].surname), forState: UIControlState.Normal)
//                     btn18.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn19.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].surname), forState: UIControlState.Normal)
//                     btn19.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn20.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].surname), forState: UIControlState.Normal)
//                     btn20.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     */
//                
//                
//                }
//                
//                
//            break
//            case UISwipeGestureRecognizerDirection.Left:
//                pageNumber += 1
//                print(pageNumber)
//              
//                
//                if(pageNumber > numOfPages - 1){
//                    
//                pageNumber = 0
//                    print("i reset to 0")
//                
//                }
//                
//                self.label.text = String(pageNumber)
//                print("swiped")
//                
//                if(pageNumber == numOfPages - 1){
//                    
//                    if(leftOver == 1.0){
//                    
//                        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                     
//                    }
//                    
//                    if(leftOver == 2.0){
//                        
//                        print(pageNumber)
//                        
//                        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//                        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        
//                        
//                    }
//                    if(leftOver == 3.0){
//                        
//                        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//                        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn3.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname), forState: UIControlState.Normal)
//                        btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        
//                        
//                    }
//                    if(leftOver == 0.0){
//                    
//                        btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//                        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                        
//                        btn3.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname), forState: UIControlState.Normal)
//                        btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                       
//                        btn4.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname), forState: UIControlState.Normal)
//                        btn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                        
//                        /*
//                         btn5.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname), forState: UIControlState.Normal)
//                         btn5.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn6.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname), forState: UIControlState.Normal)
//                         btn6.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn7.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname), forState: UIControlState.Normal)
//                         btn7.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn8.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname), forState: UIControlState.Normal)
//                         btn8.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn9.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname), forState: UIControlState.Normal)
//                         btn9.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn10.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname), forState: UIControlState.Normal)
//                         btn10.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn11.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].surname), forState: UIControlState.Normal)
//                         btn11.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn12.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].surname), forState: UIControlState.Normal)
//                         btn12.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn13.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].surname), forState: UIControlState.Normal)
//                         btn13.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn14.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].surname), forState: UIControlState.Normal)
//                         btn14.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn15.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].surname), forState: UIControlState.Normal)
//                         btn15.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn16.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].surname), forState: UIControlState.Normal)
//                         btn16.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn17.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].surname), forState: UIControlState.Normal)
//                         btn17.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn18.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].surname), forState: UIControlState.Normal)
//                         btn18.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn19.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].surname), forState: UIControlState.Normal)
//                         btn19.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         
//                         btn20.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].surname), forState: UIControlState.Normal)
//                         btn20.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                         */
//                    
//                    }
//                    
//                    
//                    
//                }
//                
//                
//                
//             else if(pageNumber != numOfPages - 1)
//                {
//                    
//                        print("on page \(pageNumber)")
//                        print(numOfPages)
//                    
//                    btn.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].surname), forState: UIControlState.Normal)
//                    btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                    btn2.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname), forState: UIControlState.Normal)
//                    btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                    btn3.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname), forState: UIControlState.Normal)
//                    btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                    btn4.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname), forState: UIControlState.Normal)
//                    btn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//                    
//                    
//                    
//                    
//                    /*
//                     btn5.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname), forState: UIControlState.Normal)
//                     btn5.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn6.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname), forState: UIControlState.Normal)
//                     btn6.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn7.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname), forState: UIControlState.Normal)
//                     btn7.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn8.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname), forState: UIControlState.Normal)
//                     btn8.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn9.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname), forState: UIControlState.Normal)
//                     btn9.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn10.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname), forState: UIControlState.Normal)
//                     btn10.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn11.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].surname), forState: UIControlState.Normal)
//                     btn11.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn12.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].surname), forState: UIControlState.Normal)
//                     btn12.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn13.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 12].surname), forState: UIControlState.Normal)
//                     btn13.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn14.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 13].surname), forState: UIControlState.Normal)
//                     btn14.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn15.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 14].surname), forState: UIControlState.Normal)
//                     btn15.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn16.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 15].surname), forState: UIControlState.Normal)
//                     btn16.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn17.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 16].surname), forState: UIControlState.Normal)
//                     btn17.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn18.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 17].surname), forState: UIControlState.Normal)
//                     btn18.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn19.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 18].surname), forState: UIControlState.Normal)
//                     btn19.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     
//                     btn20.setTitle(String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].christian_names) + " " + String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 19].surname), forState: UIControlState.Normal)
//                     btn20.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                     */
//                
//                
//                }
//                
//             
//             
//            break
//            default:
//                break
//            
//            
//            
//            
//           }
//        
//        
//        
//    
//    
//    
//    
//    }
//    
//    //if buttton is clicked it takes its current string value and makes the lable that value in the app
//    //when the button is pressed it will reset the facebook variable to the current title of the button and 
//    //the will redirect the view controler to the facebook view controler
//    @IBAction func btnAction(sender: AnyObject){
// 
//    labelTest.text = btn.currentTitle
//     
//        MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].soldier_id)
//       
//        dispatch_async(dispatch_get_main_queue()) {
//            self.performSegueWithIdentifier("FacebookSegue", sender: self)
//       
//        }
//    
//    }
//    
//    @IBAction func btn2Action(sender: AnyObject) {
//   
//        labelTest.text = btn2.currentTitle
//        
//        MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].soldier_id)
//        dispatch_async(dispatch_get_main_queue()) {
//            self.performSegueWithIdentifier("FacebookSegue", sender: self)
//       
//        }
//
//    }
//    
//    @IBAction func btn3Action(sender: AnyObject) {
//  
//        labelTest.text = btn3.currentTitle
//        
//        
//        MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].soldier_id)
//        dispatch_async(dispatch_get_main_queue()) {
//        self.performSegueWithIdentifier("FacebookSegue", sender: self)
//       
//        }
//
//    }
//    
//    @IBAction func btn4Action(sender: AnyObject) {
//    
//        labelTest.text = btn4.currentTitle
//        
//        MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].soldier_id)
//        
//        dispatch_async(dispatch_get_main_queue()) {
//            self.performSegueWithIdentifier("FacebookSegue", sender: self)
//        }
//
//    }
//  
}


class SoldierInfo {
    // These are the class properties used to define unique objects
    var soldier_id: String
    var surname: String
    var christian_names: String
    
    init(newSoldier_id: String, newSurname: String, newChristian_names: String){
    
    self.soldier_id = newSoldier_id
    self.surname = newSurname
    self.christian_names = newChristian_names
    
    }
    
}

