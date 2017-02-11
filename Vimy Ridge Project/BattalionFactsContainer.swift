
//  ViewController.swift
//  SingleBatt.ViewUI-DRAFT
//
//  Created by Student on 2016-05-10.
//  Copyright © 2016 Student. All rights reserved.
//
import Foundation
import UIKit

class BattalionFactsContainer: UIViewController {
    
    @IBOutlet var Lbl_IntFacts: UILabel!    //constant
    
    @IBOutlet var Info_IntFacts: UILabel!   //variable
    
    @IBOutlet var Lbl_WarDiary: UILabel!    //Constant
    
    @IBOutlet var Info_WarDiary: UILabel!   //variable
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        Lbl_IntFacts.text = "Some interesting facts about the \(BattVars.singleBattalion.battalion_name):"
        
        if Lbl_IntFacts.text == "Some interesting facts about the :" {
            Lbl_IntFacts.text = "Some interesting facts about this battalion:"
        }
        
        Info_IntFacts.text =  BattVars.singleBattalion.interesting_facts
        
        if BattVars.singleBattalion.interesting_facts == "" {
            Info_IntFacts.text = "Information Unknown"
            
        }
        
        Info_WarDiary.text =  BattVars.singleBattalion.war_diary
        
        if BattVars.singleBattalion.war_diary == "" {
            Info_WarDiary.text = "Information Unknown"
        }
        
        if Info_WarDiary.text == "Information Unknown" && Info_IntFacts.text == "Information Unknown" {
            let alert = UIAlertController(title: "Missing Information", message: "We are missing all information in this section. Sorry!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if Info_WarDiary.text == "Information Unknown" && Info_IntFacts.text != "Information Unknown"  || Info_WarDiary.text != "Information Unknown" && Info_IntFacts.text == "Information Unknown"{
            let alert = UIAlertController(title: "Missing Information", message: "We are missing some information in this section. You can still view what we have.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
