//
//  BiographyView.swift
//  VimyRidgeApp
//
//  Created by MacBook on 2015-06-13.
//  Copyright (c) 2015 Matt Falkner. All rights reserved.
//

import Foundation
import UIKit
class BiographyView:UIViewController {
    
    @IBOutlet var Selector: UISegmentedControl!
    
    @IBOutlet var Label_Bio_1: UILabel! // Static Label
    @IBOutlet var Label_Bio_2: UILabel! // Static Label
    @IBOutlet var Label_Bio_3: UILabel! // Static Label
    @IBOutlet var Label_Bio_4: UILabel! // Static Label
    @IBOutlet var Label_Bio_5: UILabel! // Static Label
    @IBOutlet var Label_Bio_6: UILabel! // Static Label
    @IBOutlet var Label_Bio_7: UILabel! // Static Label
    @IBOutlet var Label_Bio_8: UILabel! // Static Label
    @IBOutlet var Label_Info_1: UILabel! // Changing Label
    @IBOutlet var Label_Info_2: UILabel! // Changing Label
    @IBOutlet var Label_Info_3: UILabel! // Changing Label
    @IBOutlet var Label_Info_4: UILabel! // Changing Label
    @IBOutlet var Label_Info_5: UILabel! // Changing Label
    @IBOutlet var Label_Info_6: UILabel! // Changing Label
    @IBOutlet var Label_Info_7: UILabel! // Changing Label
    @IBOutlet var Label_Info_8: UILabel! // Changing Label
    
    override func viewDidLoad()
    {
        Label_Bio_1.text = "Place of Birth:"
        Label_Info_1.text = "\(MyVariables.globalSoldier.place_of_birth_town) \(MyVariables.globalSoldier.place_of_birth_province) \(MyVariables.globalSoldier.place_of_birth_country)"
        Label_Bio_2.text = "Address at Enlistment:"
        Label_Info_2.text = "\(MyVariables.globalSoldier.present_address_street) \(MyVariables.globalSoldier.present_address_town) \(MyVariables.globalSoldier.present_address_province) \(MyVariables.globalSoldier.present_address_country)"
        Label_Bio_3.text = "Next of Kin:"
        Label_Info_3.text = MyVariables.globalSoldier.name_next_of_kin
        Label_Bio_4.text = "Relationship to Next of Kin:"
        Label_Info_4.text = MyVariables.globalSoldier.relationship_to_next_of_kin
        Label_Bio_5.text = "Number of Dependents:"
        Label_Info_5.text = MyVariables.globalSoldier.number_of_dependants
        Label_Bio_6.isHidden = true
        Label_Info_6.isHidden = true
        Label_Bio_7.isHidden = true
        Label_Info_7.isHidden = true
        Label_Bio_8.isHidden = true
        Label_Info_8.isHidden = true
    }
    
    @IBAction func Switch(sender: AnyObject)
    {
        let index = Selector.selectedSegmentIndex
        switch index {
        case 0:
            Label_Bio_1.text = "Place of Birth:"
            Label_Info_1.text = "\(MyVariables.globalSoldier.place_of_birth_town) \(MyVariables.globalSoldier.place_of_birth_province) \(MyVariables.globalSoldier.place_of_birth_country)"
            Label_Bio_2.text = "Address at Enlistment:"
            Label_Info_2.text = "\(MyVariables.globalSoldier.present_address_street) \(MyVariables.globalSoldier.present_address_town) \(MyVariables.globalSoldier.present_address_province) \(MyVariables.globalSoldier.present_address_country)"
            Label_Bio_3.text = "Next of Kin:"
            Label_Info_3.text = MyVariables.globalSoldier.name_next_of_kin
            Label_Bio_4.text = "Relationship to Next of Kin:"
            Label_Info_4.text = MyVariables.globalSoldier.relationship_to_next_of_kin
            Label_Bio_5.text = "Number of Dependents:"
            Label_Info_5.text = MyVariables.globalSoldier.number_of_dependants
            Label_Bio_6.isHidden = true
            Label_Info_6.isHidden = true
            Label_Bio_7.isHidden = true
            Label_Info_7.isHidden = true
            Label_Bio_8.isHidden = true
            Label_Info_8.isHidden = true

        case 1:
            Label_Bio_1.text = "Military Rank at Enlistment:"
            Label_Info_1.text = MyVariables.globalSoldier.rank_upon_enlistment
            Label_Bio_2.text = "Military Rank at Death:"
            Label_Info_2.text = MyVariables.globalSoldier.rank_highest_achieved
            Label_Bio_3.text = "Active Militia:"
            Label_Info_3.text = MyVariables.globalSoldier.active_militia
            Label_Bio_4.text = "Terms of Service:"
            Label_Info_4.text = MyVariables.globalSoldier.conscription
            Label_Bio_5.text = "Saw Service In:"
            Label_Info_5.text = MyVariables.globalSoldier.saw_service_in
            Label_Bio_6.text = "Location at Death:"
            Label_Info_6.text = MyVariables.globalSoldier.rank_highest_achieved
            Label_Bio_7.text = "Burial Location:"
            Label_Info_7.text = "\(MyVariables.globalSoldier.remains_buried_in_cemetery) \(MyVariables.globalSoldier.remains_buried_in_city_village) \(MyVariables.globalSoldier.remains_buried_in_country)"
            Label_Bio_8.text = "Burial Information:"
            Label_Info_8.text = "Grave: \(MyVariables.globalSoldier.remains_buried_in_grave) Row: \(MyVariables.globalSoldier.remains_buried_in_row) Plot: \(MyVariables.globalSoldier.remains_buried_in_plot)"
            Label_Bio_6.isHidden = false
            Label_Info_6.isHidden = false
            Label_Bio_7.isHidden = false
            Label_Info_7.isHidden = false
            Label_Bio_8.isHidden = false
            Label_Info_8.isHidden = false
            
        case 2:
            Label_Bio_1.text = "Gender:"
            Label_Info_1.text = MyVariables.globalSoldier.gender
            Label_Bio_2.text = "Ethnic Origin:"
            Label_Info_2.text = MyVariables.globalSoldier.ethnic_origin_att
            Label_Bio_3.text = "Complexion:"
            Label_Info_3.text = MyVariables.globalSoldier.complexion_att
            Label_Bio_4.text = "Hair Colour:"
            Label_Info_4.text = MyVariables.globalSoldier.hair_colour_att
            Label_Bio_5.text = "Eye Colour:"
            Label_Info_5.text = MyVariables.globalSoldier.eye_colour_att
            Label_Bio_6.text = "Physical Development:"
            Label_Info_6.text = MyVariables.globalSoldier.physical_development
            Label_Bio_7.text = "Height in Imperial:"
            Label_Info_7.text = "\(MyVariables.globalSoldier.height_feet) \(MyVariables.globalSoldier.height_inches)"
            Label_Bio_8.text = "Weight in Imperial:"
            Label_Info_8.text = MyVariables.globalSoldier.weight
            Label_Bio_6.isHidden = false
            Label_Info_6.isHidden = false
            Label_Bio_7.isHidden = false
            Label_Info_7.isHidden = false
            Label_Bio_8.isHidden = false
            Label_Info_8.isHidden = false
            
            
        case 3:
            print("Honours")
            
            // Default case should never happen...
            
        default:
            print("This should not happen (Biography View)")
        
        }
    }
}
