//
//  ViewController.swift
//  Kevins_Facebook_Interface
//
//  Created by Student on 2016-10-25.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class FaceBookMilitaryVC: UIViewController {
    
    
    @IBOutlet weak var ageAtDeathLabel: UILabel!
    @IBOutlet weak var examinedDischargedLabel: UILabel!
    @IBOutlet weak var battalionLabel: UILabel!
    @IBOutlet weak var causeOfDeathLabel: UILabel!
    @IBOutlet weak var commemoratedLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var conscriptionLabel: UILabel!
    @IBOutlet weak var dateOfDeathLabel: UILabel!
    @IBOutlet weak var dateOfDischargeLabel: UILabel!
    @IBOutlet weak var enlistmentDateLabel: UILabel!
    @IBOutlet weak var diedAtLabel: UILabel!
    @IBOutlet weak var killedInActionLabel: UILabel!
    @IBOutlet weak var locationOfDeathLabel: UILabel!
    @IBOutlet weak var militaryForceLabel: UILabel!
    @IBOutlet weak var forceParticularsLabel: UILabel!
    @IBOutlet weak var nameOnGraveLabel: UILabel!
    @IBOutlet weak var officerRank: UILabel!
    @IBOutlet weak var pOWLabel: UILabel!
    @IBOutlet weak var qualificationLabel: UILabel!
    @IBOutlet weak var highestRankLabel: UILabel!
    @IBOutlet weak var initialRankLabel: UILabel!
    @IBOutlet weak var regimentAtDeathLabel: UILabel!
    @IBOutlet weak var initialRegimentLabel: UILabel!
    @IBOutlet weak var remainsCemetaryLabel: UILabel!
    @IBOutlet weak var remainsSettlementLabel: UILabel!
    @IBOutlet weak var remainsCountryLabel: UILabel!
    @IBOutlet weak var remainsGrave: UILabel!
    @IBOutlet weak var remainsPlotLabel: UILabel!
    @IBOutlet weak var remainsRowLabel: UILabel!
    @IBOutlet weak var sawServiceInLabel: UILabel!
    @IBOutlet weak var servedInForce: UILabel!
    @IBOutlet weak var reburiedLabel: UILabel!
    @IBOutlet weak var unitAtDischargeLabel: UILabel!
    @IBOutlet weak var unitShipSquadronLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let labelArray = [ageAtDeathLabel] //, examinedDischargedLabel, battalionLabel, causeOfDeathLabel, commemoratedLabel, companyLabel, conscriptionLabel, dateOfDeathLabel, dateOfDischargeLabel, enlistmentDateLabel, diedAtLabel, killedInActionLabel, locationOfDeathLabel, militaryForceLabel, forceParticularsLabel, nameOnGraveLabel, officerRank, pOWLabel, qualificationLabel, highestRankLabel, regimentAtDeathLabel, initialRankLabel, regimentAtDeathLabel, initialRegimentLabel, remainsCemetaryLabel, remainsSettlementLabel, remainsCountryLabel, remainsGrave, remainsPlotLabel, remainsRowLabel, sawServiceInLabel, servedInForce, reburiedLabel, unitAtDischargeLabel, unitShipSquadronLabel]
        
        ageAtDeathLabel.text = MyVariables.globalSoldier.age_at_death
        examinedDischargedLabel.text = MyVariables.globalSoldier.examined_or_discharged
        battalionLabel.text = MyVariables.globalSoldier.battalion
        causeOfDeathLabel.text = MyVariables.globalSoldier.cause_of_death
        commemoratedLabel.text = MyVariables.globalSoldier.commemorated
        companyLabel.text = MyVariables.globalSoldier.company
        conscriptionLabel.text = MyVariables.globalSoldier.date_of_enlistment_conscription
        dateOfDeathLabel.text = MyVariables.globalSoldier.date_of_death
        dateOfDischargeLabel.text = MyVariables.globalSoldier.date_of_discharge
        enlistmentDateLabel.text = MyVariables.globalSoldier.date_of_enlistment
        diedAtLabel.text = MyVariables.globalSoldier.died_at
        killedInActionLabel.text = MyVariables.globalSoldier.kia
        locationOfDeathLabel.text = MyVariables.globalSoldier.location_of_death
        militaryForceLabel.text = MyVariables.globalSoldier.military_force
        forceParticularsLabel.text = MyVariables.globalSoldier.military_force_particulars
        nameOnGraveLabel.text = MyVariables.globalSoldier.name_on_grave
        officerRank.text = MyVariables.globalSoldier.officer_rank
        pOWLabel.text = MyVariables.globalSoldier.prisoner_of_war
        qualificationLabel.text = MyVariables.globalSoldier.qualification
        highestRankLabel.text = MyVariables.globalSoldier.rank_highest_achieved
        initialRankLabel.text = MyVariables.globalSoldier.rank_upon_enlistment
        regimentAtDeathLabel.text = MyVariables.globalSoldier.regiment_at_death
        initialRegimentLabel.text = MyVariables.globalSoldier.regiment_upon_enlistment
        remainsCemetaryLabel.text = MyVariables.globalSoldier.remains_buried_in_cemetery
        remainsSettlementLabel.text = MyVariables.globalSoldier.remains_buried_in_city_village
        remainsCountryLabel.text = MyVariables.globalSoldier.remains_buried_in_country
        remainsGrave.text = MyVariables.globalSoldier.remains_buried_in_grave
        remainsPlotLabel.text = MyVariables.globalSoldier.remains_buried_in_plot
        remainsRowLabel.text = MyVariables.globalSoldier.remains_buried_in_row
        sawServiceInLabel.text = MyVariables.globalSoldier.saw_service_in
        servedInForce.text = MyVariables.globalSoldier.served_in_military_force
        reburiedLabel.text = MyVariables.globalSoldier.soldier_reburied
        unitAtDischargeLabel.text = MyVariables.globalSoldier.unit_at_discharge
        unitShipSquadronLabel.text = MyVariables.globalSoldier.unit_ship_squadron
        
        let modelName = UIDevice.current.modelName
        if modelName == "Simulator" {
            for nextLabel in labelArray {
                nextLabel?.font = UIFont(name: "Chapter11W00-Regular", size:24)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

