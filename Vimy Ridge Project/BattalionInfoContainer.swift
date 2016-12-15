
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
            Info_1.text = ""
       Lbl_2.text = "Location:"
        
       Lbl_3.text = "Commanded by:"
        
        Lbl_4.text = "Strength:"
        
        Lbl_5.text = "Embarked in:"
        
        Lbl_6.text = "Disembarked in:"
        
        Lbl_7.text = "Perpetuated by:"
        
        Lbl_8.text = "Arrived in France on:"
        
       
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}