//
//  ViewController.swift
//  Kevins_Facebook_Interface
//
//  Created by Student on 2016-10-25.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class UnderlinedLabel: UILabel {
    
    override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.characters.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
            // Add other attributes if needed
            self.attributedText = attributedText
        }
    }
}

class FacebookNonMilitaryVC: UIViewController {
    
    
    @IBOutlet weak var christianNameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var dateOfEnlistmentLabel: UILabel!
    @IBOutlet weak var maritalStatusLabel: UILabel!
    @IBOutlet weak var nextOfKinLabel: UILabel!
    @IBOutlet weak var dependantsLabel: UILabel!
    @IBOutlet weak var birthCountryLabel: UILabel!
    @IBOutlet weak var birthProvinceLabel: UILabel!
    @IBOutlet weak var birthTownLabel: UILabel!
    @IBOutlet weak var enlistmentPlaceLabel: UILabel!
    @IBOutlet weak var presentCountryLabel: UILabel!
    @IBOutlet weak var presentProvinceLabel: UILabel!
    @IBOutlet weak var presentStreetLabel: UILabel!
    @IBOutlet weak var presentTownLabel: UILabel!
    @IBOutlet weak var relationToKinLabel: UILabel!
    @IBOutlet weak var religionLabel: UILabel!
    @IBOutlet weak var tradeCallingLabel: UILabel!
    @IBOutlet weak var medicalAgeLabel: UILabel!
    @IBOutlet weak var attestedAgeLabel: UILabel!
    @IBOutlet weak var attestedComplexionLabel: UILabel!
    @IBOutlet weak var dateExaminedLabel: UILabel!
    @IBOutlet weak var ethnicOriginLabel: UILabel!
    @IBOutlet weak var eyeColourLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var attestedHairLabel: UILabel!
    @IBOutlet weak var heightFeetLabel: UILabel!
    @IBOutlet weak var heightInchesLabel: UILabel!
    @IBOutlet weak var marksLabel: UILabel!
    @IBOutlet weak var physicalDevelopmentLabel: UILabel!
    @IBOutlet weak var marksOfDiseaseLabel: UILabel!
    @IBOutlet weak var slightDefectsLabel: UILabel!
    @IBOutlet weak var tradeOccupationLabel: UILabel!
    @IBOutlet weak var vaccinationMarksLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var activeMilitiaLabel: UILabel!
    
    
    @IBOutlet weak var activeMilitiaLbl: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var labelArray: [UILabel] = [UILabel]()
        
        labelArray = [christianNameLabel, surnameLabel] // dateOfBirthLabel, dateOfEnlistmentLabel, maritalStatusLabel, nextOfKinLabel, dependantsLabel, birthCountryLabel, birthProvinceLabel, birthTownLabel, enlistmentPlaceLabel, presentCountryLabel, presentTownLabel, presentProvinceLabel, presentStreetLabel, relationToKinLabel, religionLabel, tradeCallingLabel, medicalAgeLabel, attestedAgeLabel, attestedComplexionLabel, dateExaminedLabel, ethnicOriginLabel, eyeColourLabel, genderLabel, attestedHairLabel, heightFeetLabel, heightInchesLabel, marksLabel, physicalDevelopmentLabel, marksOfDiseaseLabel, slightDefectsLabel, tradeOccupationLabel, vaccinationMarksLabel, weightLabel, activeMilitiaLabel]
        
        christianNameLabel.text = MyVariables.globalSoldier.christian_names
        surnameLabel.text = MyVariables.globalSoldier.surname
        dateOfBirthLabel.text = MyVariables.globalSoldier.date_of_birth
        dateOfEnlistmentLabel.text = MyVariables.globalSoldier.date_of_enlistment
        maritalStatusLabel.text = MyVariables.globalSoldier.marital_status
        nextOfKinLabel.text = MyVariables.globalSoldier.name_next_of_kin
        dependantsLabel.text = MyVariables.globalSoldier.number_of_dependants
        birthCountryLabel.text = MyVariables.globalSoldier.place_of_birth_country
        birthProvinceLabel.text = MyVariables.globalSoldier.place_of_birth_province
        birthTownLabel.text = MyVariables.globalSoldier.place_of_birth_town
        enlistmentPlaceLabel.text = MyVariables.globalSoldier.place_of_enlistment
        presentCountryLabel.text = MyVariables.globalSoldier.present_address_country
        presentProvinceLabel.text = MyVariables.globalSoldier.present_address_province
        presentStreetLabel.text = MyVariables.globalSoldier.present_address_street
        presentTownLabel.text = MyVariables.globalSoldier.present_address_town
        relationToKinLabel.text = MyVariables.globalSoldier.relationship_to_next_of_kin
        religionLabel.text = MyVariables.globalSoldier.religion
        tradeCallingLabel.text = MyVariables.globalSoldier.trade_or_calling
        medicalAgeLabel.text = MyVariables.globalSoldier.age_years_medical
        attestedAgeLabel.text = MyVariables.globalSoldier.apparent_age_years_att
        attestedComplexionLabel.text = MyVariables.globalSoldier.complexion_att
        dateExaminedLabel.text = MyVariables.globalSoldier.date_examined
        ethnicOriginLabel.text = MyVariables.globalSoldier.ethnic_origin_att
        eyeColourLabel.text = MyVariables.globalSoldier.eye_colour_att
        genderLabel.text = MyVariables.globalSoldier.gender
        attestedHairLabel.text = MyVariables.globalSoldier.hair_colour_att
        heightFeetLabel.text = MyVariables.globalSoldier.height_feet
        heightInchesLabel.text = MyVariables.globalSoldier.height_inches
        marksLabel.text = MyVariables.globalSoldier.identifying_marks
        physicalDevelopmentLabel.text = MyVariables.globalSoldier.physical_development
        marksOfDiseaseLabel.text = MyVariables.globalSoldier.previous_disease_marks
        slightDefectsLabel.text = MyVariables.globalSoldier.slight_defects
        tradeOccupationLabel.text = MyVariables.globalSoldier.trade_or_occupation
        vaccinationMarksLabel.text = MyVariables.globalSoldier.vaccination_marks_number
        weightLabel.text = MyVariables.globalSoldier.weight
        activeMilitiaLabel.text = MyVariables.globalSoldier.active_militia
        
        
        let modelName = UIDevice.current.modelName
        if modelName == "Simulator" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:24)
            }
        }
            
        else if modelName == "iPhone SE" || modelName == "iPhone SE" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:16)
            }
        }
        else if modelName == "iPhone 2G" || modelName == "iPhone 2G" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:12)
            }
        }
        else if modelName == "iPhone 3G" || modelName == "iPhone 3G" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:12)
            }
        }
        else if modelName == "iPhone 3GS" || modelName == "iPhone 3GS" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:12)
            }
        }
        else if modelName == "iPhone 4" || modelName == "iPhone 4" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:16)
            }
        }
        else if modelName == "iPhone 4s" || modelName == "iPhone 4s" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:16)
            }
        }
        else if modelName == "iPhone 5s" || modelName == "iPhone 5s" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:16)
            }
        }
            
        else if modelName == "iPhone 5" || modelName == "iPhone 5" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:16)
            }
        }
            
        else if modelName == "iPhone 7 Plus" || modelName == "iPhone 7 Plus" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:32)
            }
        }
        else if modelName == "iPhone 6 Plus" || modelName == "iPhone 6 Plus" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:32)
            }
        }
        else if modelName == "iPhone 6s Plus" || modelName == "iPhone 6s Plus" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:32)
            }
        }
            
        else if modelName == "iPhone 7" || modelName == "iPhone 7" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:18)
            }
        }
        else if modelName == "iPhone 6" || modelName == "iPhone 6" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:18)
            }
        }
        else if modelName == "iPhone 6s" || modelName == "iPhone 6s" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:18)
            }
        }
        else if modelName == "iPad Mini" || modelName == "iPad Mini" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:24)
            }
        }
        else if modelName == "iPad Air" || modelName == "iPad Air" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:24)
            }
        }
        else if modelName == "iPad Pro" || modelName == "iPad Pro" {
            for nextLabel in labelArray {
                nextLabel.font = UIFont(name: "Chapter11W00-Regular", size:30)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
