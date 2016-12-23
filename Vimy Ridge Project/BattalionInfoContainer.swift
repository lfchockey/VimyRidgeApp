
//  ViewController.swift
//  SingleBatt.ViewUI-DRAFT
//
//  Created by Student on 2016-05-10.
//  Copyright © 2016 Student. All rights reserved.
//
import Foundation
import UIKit

class BattalionInfoContainer: UIViewController {
    
    
    @IBOutlet var Lbl_1: UILabel!   //Constant label
    @IBOutlet var Lbl_2: UILabel!   //Constant label
    @IBOutlet var Lbl_3: UILabel!   //Constant label
    @IBOutlet var Lbl_4: UILabel!   //Constant label
    @IBOutlet var Lbl_5: UILabel!   //Constant label
    @IBOutlet var Lbl_6: UILabel!   //Constant label
    @IBOutlet var Lbl_7: UILabel!   //Constant label
    @IBOutlet var Lbl_8: UILabel!   //constant
    
    @IBOutlet var Info_1: UILabel!  //Variable label
    @IBOutlet var Info_2: UILabel!  //Variable label
    @IBOutlet var Info_3: UILabel!  //Variable label
    @IBOutlet var Info_4: UILabel!  //Variable label
    @IBOutlet var Info_5: UILabel!  //Variable label
    @IBOutlet var Info_6: UILabel!  //Variable label
    @IBOutlet var Info_7: UILabel!  //Variable label
    @IBOutlet var Info_8: UILabel!  //variable
    
    @IBOutlet var Batt_MapButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Lbl_1.text = "Created in:"
        Info_1.text =  "\(BattVars.singleBattalion.date_created)"
        
        if BattVars.singleBattalion.date_created == "" {
            Info_1.text = "Information Unknown"
          
        }
        
        Lbl_2.text = "Location:"
        Info_2.text = BattVars.singleBattalion.location
        
        if BattVars.singleBattalion.location == "" {
            Info_2.text = "Information Unknown"
        }
        
        Lbl_3.text = "Commanded by:"
        Info_3.text = BattVars.singleBattalion.commanded_by
        
        if BattVars.singleBattalion.commanded_by == "" {
            Info_3.text = "Information Unknown"
        }
        
        Lbl_4.text = "Strength:"
        Info_4.text = BattVars.singleBattalion.strength
        
        if BattVars.singleBattalion.strength == "" {
            Info_4.text = "Information Unknown"
        }
        
        Lbl_5.text = "Embarked in:"
        Info_5.text = BattVars.singleBattalion.embarkation
        
        if BattVars.singleBattalion.embarkation == "" {
            Info_5.text = "Information Unknown"
        }
        
        Lbl_6.text = "Disembarked in:"
        Info_6.text = BattVars.singleBattalion.disembarkation
        
        if BattVars.singleBattalion.disembarkation == "" {
            Info_6.text = "Information Unknown"
        }
        
        Lbl_7.text = "Perpetuated by:"
        Info_7.text = BattVars.singleBattalion.perpetuated_by
        
        if BattVars.singleBattalion.perpetuated_by == "" {
            Info_7.text = "Information Unknown"
        }
        
        Lbl_8.text = "Arrived in France on:"
        Info_8.text = BattVars.singleBattalion.france_arrival
        
        if BattVars.singleBattalion.france_arrival == "" {
            Info_8.text = "Information Unknown"
        }
         if Info_1.text == "Information Unknown" && Info_2.text == "Information Unknown" && Info_3.text == "Information Unknown" && Info_4.text == "Information Unknown" && Info_5.text == "Information Unknown" && Info_6.text == "Information Unknown" && Info_7.text == "Information Unknown" && Info_8.text == "Information Unknown"{
            
            let alert = UIAlertController(title: "Missing Information", message: "We are missing all information on this battalion. Sorry!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else if Info_1.text == "Information Unknown" || Info_2.text == "Information Unknown" || Info_3.text == "Information Unknown" || Info_4.text == "Information Unknown" || Info_5.text == "Information Unknown" || Info_6.text == "Information Unknown" || Info_7.text == "Information Unknown" || Info_8.text == "Information Unknown" {
        
            let alert = UIAlertController(title: "Missing Information", message: "We are missing some information on this battalion. However, you can still view the information that we have.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
