//
//  FullSoldier.swift
//  VimySoldierEntry
//
//  Created by Mason Black on 2015-01-12.
//  Copyright (c) 2015 Mason Black. All rights reserved.
//

import Foundation

class FullSoldier: NSObject{
    // Location Variables
    var location_array: [[String:String]]
    var battalion_array: [[String:String]] = []
    var friends_array: [[String:String]] = []
    
    // Attestation Variables
    var additional_info: String
    var address_next_of_kin: String
    var attestation_willingness: String
    var christian_names: String
    var citizenship: String
    var date_of_birth: String
    var date_of_enlistment: String
    var initials: String
    var lac: String
    var lac_reference: String
    var marital_status: String
    var name_next_of_kin: String
    var number_of_dependants: String
    var officer_id: String
    var place_of_birth: String
    var place_of_birth_country: String
    var place_of_birth_province: String
    var place_of_birth_town: String
    var place_of_enlistment: String
    var present_address: String
    var present_address_country: String
    var present_address_province: String
    var present_address_street: String
    var present_address_town: String
    var relationship_to_next_of_kin: String
    var religion: String
    var soldier_id: String
    var surname: String
    var trade_or_calling: String
    var virtual_war_memorial: String
    var war_graves_commission: String
    // Medical History Variables
    var age_months_medical: String
    var age_years_medical: String
    var apparent_age_months_att: String
    var apparent_age_years_att: String
    var chest_full_expansion_att: String
    var chest_maximum_expansion: String
    var chest_minimum: String
    var chest_range_of_expansion_att: String
    var complexion_att: String
    var date_examined: String
    var ethnic_origin_att: String
    var examined_or_discharged: String
    var eye_colour_att: String
    var gender: String
    var hair_colour_att: String
    var height_feet: String
    var height_feet_att: String
    var height_inches: String
    var height_inches_att: String
    var identifying_marks: String
    var physical_development: String
    var place_examined: String
    var previous_disease_marks: String
    var slight_defects: String
    //var soldier_id: String
    var trade_or_occupation: String
    var vaccination_marks_left_arm: String
    var vaccination_marks_number: String
    var vaccination_marks_right_arm: String
    var vaccination_willingness: String
    var weight: String
    var weight_att: String
    // Regimental Variables
    var active_militia: String
    var age_at_death: String
    var battalion: String
    var cause_of_death: String
    var commemorated: String
    var company: String
    var conscription: String
    var date_of_death: String
    var date_of_discharge: String
    var date_of_enlistment_conscription: String
    var died_at: String
    var engagement_understanding: String
    var interned: String
    var kia: String
    var location_of_death: String
    var military_force: String
    var military_force_particulars: String
    var name_on_grave: String
    var officer_rank: String
    var prisoner_of_war: String
    var qualification: String
    var rank_highest_achieved: String
    var rank_upon_enlistment: String
    var regiment_at_death: String
    var regiment_upon_enlistment: String
    var remains_buried_in_cemetery: String
    var remains_buried_in_city_village: String
    var remains_buried_in_country: String
    var remains_buried_in_grave: String
    var remains_buried_in_plot: String
    var remains_buried_in_row: String
    var saw_service_in: String
    var served_in_military_force: String
    //var soldier_id: String
    var soldier_reburied: String
    var survived_war: String
    var unit_at_discharge: String
    var unit_ship_squadron: String
    var vimy_casualty: String
    
    // Default constructor
    override init (){
        self.location_array = []
        self.battalion_array = []
        self.friends_array = []
        self.additional_info = ""
        self.address_next_of_kin = ""
        self.attestation_willingness = ""
        self.christian_names = ""
        self.citizenship = ""
        self.date_of_birth = ""
        self.date_of_enlistment = ""
        self.initials = ""
        self.lac = ""
        self.lac_reference = ""
        self.marital_status = ""
        self.name_next_of_kin = ""
        self.number_of_dependants = ""
        self.officer_id = ""
        self.place_of_birth = ""
        self.place_of_birth_country = ""
        self.place_of_birth_province = ""
        self.place_of_birth_town = ""
        self.place_of_enlistment = ""
        self.present_address = ""
        self.present_address_country = ""
        self.present_address_province = ""
        self.present_address_street = ""
        self.present_address_town = ""
        self.relationship_to_next_of_kin = ""
        self.religion = ""
        self.soldier_id = ""
        self.surname = ""
        self.trade_or_calling = ""
        self.virtual_war_memorial = ""
        self.war_graves_commission = ""
        
        self.age_months_medical = ""
        self.age_years_medical = ""
        self.apparent_age_months_att = ""
        self.apparent_age_years_att = ""
        self.chest_full_expansion_att = ""
        self.chest_maximum_expansion = ""
        self.chest_minimum = ""
        self.chest_range_of_expansion_att = ""
        self.complexion_att = ""
        self.date_examined = ""
        self.ethnic_origin_att = ""
        self.examined_or_discharged = ""
        self.eye_colour_att = ""
        self.gender = ""
        self.hair_colour_att = ""
        self.height_feet = ""
        self.height_feet_att = ""
        self.height_inches = ""
        self.height_inches_att = ""
        self.identifying_marks = ""
        self.physical_development = ""
        self.place_examined = ""
        self.previous_disease_marks = ""
        self.slight_defects = ""
        //self.soldier_id = ""
        self.trade_or_occupation = ""
        self.vaccination_marks_left_arm = ""
        self.vaccination_marks_number = ""
        self.vaccination_marks_right_arm = ""
        self.vaccination_willingness = ""
        self.weight = ""
        self.weight_att = ""
        
        self.active_militia = ""
        self.age_at_death = ""
        self.battalion = ""
        self.cause_of_death = ""
        self.commemorated = ""
        self.company = ""
        self.conscription = ""
        self.date_of_death = ""
        self.date_of_discharge = ""
        self.date_of_enlistment_conscription = ""
        self.died_at = ""
        self.engagement_understanding = ""
        self.interned = ""
        self.kia = ""
        self.location_of_death = ""
        self.military_force = ""
        self.military_force_particulars = ""
        self.name_on_grave = ""
        self.officer_rank = ""
        self.prisoner_of_war = ""
        self.qualification = ""
        self.rank_highest_achieved = ""
        self.rank_upon_enlistment = ""
        self.regiment_at_death = ""
        self.regiment_upon_enlistment = ""
        self.remains_buried_in_cemetery = ""
        self.remains_buried_in_city_village = ""
        self.remains_buried_in_country = ""
        self.remains_buried_in_grave = ""
        self.remains_buried_in_plot = ""
        self.remains_buried_in_row = ""
        self.saw_service_in = ""
        self.served_in_military_force = ""
        //self.soldier_id = ""
        self.soldier_reburied = ""
        self.survived_war = ""
        self.unit_at_discharge = ""
        self.unit_ship_squadron = ""
        self.vimy_casualty = ""
    }
    
    // Constructor
    init (
        additional_info: String,
        address_next_of_kin: String,
        attestation_willingness: String,
        christian_names: String,
        citizenship: String,
        date_of_birth: String,
        date_of_enlistment: String,
        initials: String,
        lac: String,
        lac_reference: String,
        marital_status: String,
        name_next_of_kin: String,
        number_of_dependants: String,
        officer_id: String,
        place_of_birth: String,
        place_of_birth_country: String,
        place_of_birth_province: String,
        place_of_birth_town: String,
        place_of_enlistment: String,
        present_address: String,
        present_address_country: String,
        present_address_province: String,
        present_address_street: String,
        present_address_town: String,
        relationship_to_next_of_kin: String,
        religion: String,
        soldier_id: String,
        surname: String,
        trade_or_calling: String,
        virtual_war_memorial: String,
        war_graves_commission: String,
        age_months_medical: String,
        age_years_medical: String,
        apparent_age_months_att: String,
        apparent_age_years_att: String,
        chest_full_expansion_att: String,
        chest_maximum_expansion: String,
        chest_minimum: String,
        chest_range_of_expansion_att: String,
        complexion_att: String,
        date_examined: String,
        ethnic_origin_att: String,
        examined_or_discharged: String,
        eye_colour_att: String,
        gender: String,
        hair_colour_att: String,
        height_feet: String,
        height_feet_att: String,
        height_inches: String,
        height_inches_att: String,
        identifying_marks: String,
        physical_development: String,
        place_examined: String,
        previous_disease_marks: String,
        slight_defects: String,
        trade_or_occupation: String,
        vaccination_marks_left_arm: String,
        vaccination_marks_number: String,
        vaccination_marks_right_arm: String,
        vaccination_willingness: String,
        weight: String,
        weight_att: String,
        active_militia: String,
        age_at_death: String,
        battalion: String,
        cause_of_death: String,
        commemorated: String,
        company: String,
        conscription: String,
        date_of_death: String,
        date_of_discharge: String,
        date_of_enlistment_conscription: String,
        died_at: String,
        engagement_understanding: String,
        interned: String,
        kia: String,
        location_of_death: String,
        military_force: String,
        military_force_particulars: String,
        name_on_grave: String,
        officer_rank: String,
        prisoner_of_war: String,
        qualification: String,
        rank_highest_achieved: String,
        rank_upon_enlistment: String,
        regiment_at_death: String,
        regiment_upon_enlistment: String,
        remains_buried_in_cemetery: String,
        remains_buried_in_city_village: String,
        remains_buried_in_country: String,
        remains_buried_in_grave: String,
        remains_buried_in_plot: String,
        remains_buried_in_row: String,
        saw_service_in: String,
        served_in_military_force: String,
        soldier_reburied: String,
        survived_war: String,
        unit_at_discharge: String,
        unit_ship_squadron: String,
        vimy_casualty: String
        ){
        self.location_array = []
        self.battalion_array = []
        self.friends_array = []
        self.additional_info = additional_info
        self.address_next_of_kin = address_next_of_kin
        self.attestation_willingness = attestation_willingness
        self.christian_names = christian_names
        self.citizenship = citizenship
        self.date_of_birth = date_of_birth
        self.date_of_enlistment = date_of_enlistment
        self.initials = initials
        self.lac = lac
        self.lac_reference = lac_reference
        self.marital_status = marital_status
        self.name_next_of_kin = name_next_of_kin
        self.number_of_dependants = number_of_dependants
        self.officer_id = officer_id
        self.place_of_birth = place_of_birth
        self.place_of_birth_country = place_of_birth_country
        self.place_of_birth_province = place_of_birth_province
        self.place_of_birth_town = place_of_birth_town
        self.place_of_enlistment = place_of_enlistment
        self.present_address = present_address
        self.present_address_country = present_address_country
        self.present_address_province = present_address_province
        self.present_address_street = present_address_street
        self.present_address_town = present_address_town
        self.relationship_to_next_of_kin = relationship_to_next_of_kin
        self.religion = religion
        self.soldier_id = soldier_id
        self.surname = surname
        self.trade_or_calling = trade_or_calling
        self.virtual_war_memorial = virtual_war_memorial
        self.war_graves_commission = war_graves_commission
        self.age_months_medical = age_months_medical
        self.age_years_medical = age_years_medical
        self.apparent_age_months_att = apparent_age_months_att
        self.apparent_age_years_att = apparent_age_years_att
        self.chest_full_expansion_att = chest_full_expansion_att
        self.chest_maximum_expansion = chest_maximum_expansion
        self.chest_minimum = chest_minimum
        self.chest_range_of_expansion_att = chest_range_of_expansion_att
        self.complexion_att = complexion_att
        self.date_examined = date_examined
        self.ethnic_origin_att = ethnic_origin_att
        self.examined_or_discharged = examined_or_discharged
        self.eye_colour_att = eye_colour_att
        self.gender = gender
        self.hair_colour_att = hair_colour_att
        self.height_feet = height_feet
        self.height_feet_att = height_feet_att
        self.height_inches = height_inches
        self.height_inches_att = height_inches_att
        self.identifying_marks = identifying_marks
        self.physical_development = physical_development
        self.place_examined = place_examined
        self.previous_disease_marks = previous_disease_marks
        self.slight_defects = slight_defects
        //self.soldier_id = soldier_id
        self.trade_or_occupation = trade_or_occupation
        self.vaccination_marks_left_arm = vaccination_marks_left_arm
        self.vaccination_marks_number = vaccination_marks_number
        self.vaccination_marks_right_arm = vaccination_marks_right_arm
        self.vaccination_willingness = vaccination_willingness
        self.weight = weight
        self.weight_att = weight_att
        self.active_militia = active_militia
        self.age_at_death = age_at_death
        self.battalion = cause_of_death
        self.cause_of_death = cause_of_death
        self.commemorated = commemorated
        self.company = company
        self.conscription = conscription
        self.date_of_death = date_of_death
        self.date_of_discharge = date_of_discharge
        self.date_of_enlistment_conscription = date_of_enlistment_conscription
        self.died_at = died_at
        self.engagement_understanding = engagement_understanding
        self.interned = interned
        self.kia = kia
        self.location_of_death = location_of_death
        self.military_force = military_force
        self.military_force_particulars = military_force_particulars
        self.name_on_grave = name_on_grave
        self.officer_rank = officer_rank
        self.prisoner_of_war = prisoner_of_war
        self.qualification = qualification
        self.rank_highest_achieved = rank_highest_achieved
        self.rank_upon_enlistment = rank_upon_enlistment
        self.regiment_at_death = regiment_at_death
        self.regiment_upon_enlistment = regiment_upon_enlistment
        self.remains_buried_in_cemetery = remains_buried_in_cemetery
        self.remains_buried_in_city_village = remains_buried_in_city_village
        self.remains_buried_in_country = remains_buried_in_country
        self.remains_buried_in_grave = remains_buried_in_grave
        self.remains_buried_in_plot = remains_buried_in_plot
        self.remains_buried_in_row = remains_buried_in_row
        self.saw_service_in = saw_service_in
        self.served_in_military_force = served_in_military_force
        //self.soldier_id = soldier_id
        self.soldier_reburied = soldier_reburied
        self.survived_war = survived_war
        self.unit_at_discharge = unit_at_discharge
        self.unit_ship_squadron = unit_ship_squadron
        self.vimy_casualty = vimy_casualty
    }
    
    func makeJSON () -> NSObject {
        let json = [
            "additional_info": self.additional_info,
            "address_next_of_kin": self.address_next_of_kin,
            "attestation_willingness": self.attestation_willingness,
            "christian_names": self.christian_names,
            "citizenship": self.citizenship,
            "date_of_birth": self.date_of_birth,
            "date_of_enlistment": self.date_of_enlistment,
            "initials": self.initials,
            "lac": self.lac,
            "ac_reference": self.lac_reference,
            "marital_status": self.marital_status,
            "name_next_of_kin": self.name_next_of_kin,
            "number_of_dependants": self.number_of_dependants,
            "officer_id": self.officer_id,
            "place_of_birth": self.place_of_birth,
            "place_of_birth_country": self.place_of_birth_country,
            "place_of_birth_province": self.place_of_birth_province,
            "place_of_birth_town": self.place_of_birth_town,
            "place_of_enlistment": self.place_of_enlistment,
            "present_address": self.present_address,
            "present_address_country": self.present_address_country,
            "present_address_province": self.present_address_province,
            "present_address_street": self.present_address_street,
            "present_address_town": self.present_address_town,
            "relationship_to_next_of_kin": self.relationship_to_next_of_kin,
            "religion": self.religion,
            "soldier_id": self.soldier_id,
            "surname": self.surname,
            "trade_or_calling": self.trade_or_calling,
            "virtual_war_memorial": self.virtual_war_memorial,
            "war_graves_commission": self.war_graves_commission,
            
            "age_months_medical": self.age_months_medical,
            "age_years_medical": self.age_years_medical,
            "apparent_age_months_att": self.apparent_age_months_att,
            "apparent_age_years_att": self.apparent_age_years_att,
            "chest_full_expansion_att": self.chest_full_expansion_att,
            "chest_maximum_expansion": self.chest_maximum_expansion,
            "chest_minimum": self.chest_minimum,
            "chest_range_of_expansion_att": self.chest_range_of_expansion_att,
            "complexion_att": self.complexion_att,
            "date_examined": self.date_examined,
            "ethnic_origin_att": self.ethnic_origin_att,
            "examined_or_discharged": self.examined_or_discharged,
            "eye_colour_att": self.eye_colour_att,
            "gender": self.gender,
            "hair_colour_att": self.hair_colour_att,
            "height_feet": self.height_feet,
            "height_feet_att": self.height_feet_att,
            "height_inches": self.height_inches,
            "height_inches_att": self.height_inches_att,
            "identifying_marks": self.identifying_marks,
            "physical_development": self.physical_development,
            "place_examined": self.place_examined,
            "previous_disease_marks": self.previous_disease_marks,
            "slight_defects": self.slight_defects,
            //"": self.soldier_id,
            "trade_or_occupation": self.trade_or_occupation,
            "vaccination_marks_left_arm": self.vaccination_marks_left_arm,
            "vaccination_marks_number": self.vaccination_marks_number,
            "vaccination_marks_right_arm": self.vaccination_marks_right_arm,
            "vaccination_willingness": self.vaccination_willingness,
            "weight": self.weight,
            "weight_att": self.weight_att,
            
            "active_militia": self.active_militia,
            "age_at_death": self.age_at_death,
            "battalion": self.battalion,
            "cause_of_death": self.cause_of_death,
            "commemorated": self.commemorated,
            "company": self.company,
            "conscription": self.conscription,
            "date_of_death": self.date_of_death,
            "date_of_discharge": self.date_of_discharge,
            "date_of_enlistment_conscription": self.date_of_enlistment_conscription,
            "died_at": self.died_at,
            "engagement_understanding": self.engagement_understanding,
            "interned": self.interned,
            "kia": self.kia,
            "location_of_death": self.location_of_death,
            "military_force": self.military_force,
            "military_force_particulars": self.military_force_particulars,
            "name_on_grave": self.name_on_grave,
            "officer_rank": self.officer_rank,
            "prisoner_of_war": self.prisoner_of_war,
            "qualification": self.qualification,
            "rank_highest_achieved": self.rank_highest_achieved,
            "rank_upon_enlistment": self.rank_upon_enlistment,
            "regiment_at_death": self.regiment_at_death,
            "regiment_upon_enlistment": self.regiment_upon_enlistment,
            "remains_buried_in_cemetery": self.remains_buried_in_cemetery,
            "remains_buried_in_city_village": self.remains_buried_in_city_village,
            "remains_buried_in_country": self.remains_buried_in_country,
            "remains_buried_in_grave": self.remains_buried_in_grave,
            "remains_buried_in_plot": self.remains_buried_in_plot,
            "remains_buried_in_row": self.remains_buried_in_row,
            "saw_service_in": self.saw_service_in,
            "served_in_military_force": self.served_in_military_force,
            //"": self.soldier_id,
            "soldier_reburied": self.soldier_reburied,
            "survived_war": self.survived_war,
            "unit_at_discharge": self.unit_at_discharge,
            "unit_ship_squadron": self.unit_ship_squadron,
            "vimy_casualty": self.vimy_casualty
        ]
        
        return json as NSObject
    }
    
    func assignSoldier(soldierDict: NSDictionary!) -> FullSoldier {
        let fullSol:FullSoldier = FullSoldier()
        
        // Check each piece of information that was passed in the JSON to see whether it contains a value or is NULL
        //      If it contains a value, place it inside the soldier
        
        if let latestValue = soldierDict.object(forKey: "locations") as? NSArray{
            for locations in latestValue {

                let loc = locations as! NSDictionary

                for (key, value) in loc {

                    let k = key as! String
                    let v = value as! String
                    fullSol.location_array.append([k:v])
                    
                }

            }
        }
        
        if let latestValue = soldierDict.object(forKey: "friends") as? NSArray{
            for friends in latestValue {
                
                let friend = friends as! NSDictionary
                
                for (key, value) in friend {
                    
                    let k = key as! String
                    let v = value as! String
                    fullSol.friends_array.append([k:v])
                    
                }
                
            }

        }

        if let latestValue = soldierDict.object(forKey: "additional_info") as? String {
            fullSol.additional_info = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "address_next_of_kin") as? String {
            fullSol.address_next_of_kin = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "attestation_willingness") as? String {
            fullSol.attestation_willingness = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "christian_names") as? String {
            fullSol.christian_names = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "citizenship") as? String {
            fullSol.citizenship = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "date_of_birth") as? String {
            fullSol.date_of_birth = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "date_of_enlistment") as? String {
            fullSol.date_of_enlistment = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "initials") as? String {
            fullSol.initials = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "lac") as? String {
            fullSol.lac = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "lac_reference") as? String {
            fullSol.lac_reference = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "marital_status") as? String {
            fullSol.marital_status = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "name_next_of_kin") as? String {
            fullSol.name_next_of_kin = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "number_of_dependants") as? String {
            fullSol.number_of_dependants = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "officer_id") as? String {
            fullSol.officer_id = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "place_of_birth") as? String {
            fullSol.place_of_birth = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "place_of_birth_country") as? String {
            fullSol.place_of_birth_country = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "place_of_birth_province") as? String {
            fullSol.place_of_birth_province = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "place_of_birth_town") as? String {
            fullSol.place_of_birth_town = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "place_of_enlistment") as? String {
            fullSol.place_of_enlistment = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "present_address") as? String {
            fullSol.present_address = latestValue
            if latestValue != "" {
                let address = latestValue.replacingOccurrences(of: "~~~", with: "") //latestValue.stringByReplacingOccurrencesOfString("~~~,", withString: "")
                fullSol.location_array.append(["address":address])
            }
        }
        if let latestValue = soldierDict.object(forKey: "present_address_country") as? String {
            fullSol.present_address_country = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "present_address_province") as? String {
            fullSol.present_address_province = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "present_address_street") as? String {
            fullSol.present_address_street = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "present_address_town") as? String {
            fullSol.present_address_town = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "relationship_to_next_of_kin") as? String {
            fullSol.relationship_to_next_of_kin = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "religion") as? String {
            fullSol.religion = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "soldier_id") as? String {
            fullSol.soldier_id = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "surname") as? String {
            fullSol.surname = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "trade_or_calling") as? String {
            fullSol.trade_or_calling = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "virtual_war_memorial") as? String {
            fullSol.virtual_war_memorial = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "war_graves_commission") as? String {
            fullSol.war_graves_commission = latestValue
        }
        
        //----------Medical History Properties------------
        if let latestValue = soldierDict.object(forKey: "age_months_medical") as? String {
            fullSol.age_months_medical = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "age_years_medical") as? String {
            fullSol.age_years_medical = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "apparent_age_months_att") as? String {
            fullSol.apparent_age_months_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "apparent_age_years_att") as? String {
            fullSol.apparent_age_years_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "chest_full_expansion_att") as? String {
            fullSol.chest_full_expansion_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "chest_maximum_expansion") as? String {
            fullSol.chest_maximum_expansion = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "chest_minimum") as? String {
            fullSol.chest_minimum = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "chest_range_of_expansion_att") as? String {
            fullSol.chest_range_of_expansion_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "complexion_att") as? String {
            fullSol.complexion_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "date_examined") as? String {
            fullSol.date_examined = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "ethnic_origin_att") as? String {
            fullSol.ethnic_origin_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "examined_or_discharged") as? String {
            fullSol.examined_or_discharged = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "eye_colour_att") as? String {
            fullSol.eye_colour_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "gender") as? String {
            fullSol.gender = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "hair_colour_att") as? String {
            fullSol.hair_colour_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "height_feet") as? String {
            fullSol.height_feet = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "height_feet_att") as? String {
            fullSol.height_feet_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "height_inches") as? String {
            fullSol.height_inches = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "height_inches_att") as? String {
            fullSol.height_inches_att = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "identifying_marks") as? String {
            fullSol.identifying_marks = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "physical_development") as? String {
            fullSol.physical_development = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "place_examined") as? String {
            fullSol.place_examined = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "previous_disease_marks") as? String {
            fullSol.previous_disease_marks = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "slight_defects") as? String {
            fullSol.slight_defects = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "trade_or_occupation") as? String {
            fullSol.trade_or_occupation = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "vaccination_marks_left_arm") as? String {
            fullSol.vaccination_marks_left_arm = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "vaccination_marks_number") as? String {
            fullSol.vaccination_marks_number = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "vaccination_marks_right_arm") as? String {
            fullSol.vaccination_marks_right_arm = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "vaccination_willingness") as? String {
            fullSol.vaccination_willingness = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "weight") as? String {
            fullSol.weight = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "weight_att") as? String {
            fullSol.weight_att = latestValue
        }
        
        //----------Regimental Properties------------
        if let latestValue = soldierDict.object(forKey: "active_militia") as? String {
            fullSol.active_militia = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "age_at_death") as? String {
            fullSol.age_at_death = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "battalion") as? String {
            fullSol.battalion = latestValue
            battalion_array.append(["battalion":latestValue])
        }
        if let latestValue = soldierDict.object(forKey: "cause_of_death") as? String {
            fullSol.cause_of_death = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "commemorated") as? String {
            fullSol.commemorated = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "company") as? String {
            fullSol.company = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "conscription") as? String {
            fullSol.conscription = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "date_of_death") as? String {
            fullSol.date_of_death = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "date_of_discharge") as? String {
            fullSol.date_of_discharge = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "date_of_enlistment_conscription") as? String {
            fullSol.date_of_enlistment_conscription = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "died_at") as? String {
            fullSol.died_at = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "engagement_understanding") as? String {
            fullSol.engagement_understanding = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "interned") as? String {
            fullSol.interned = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "kia") as? String {
            fullSol.kia = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "location_of_death") as? String {
            fullSol.location_of_death = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "military_force") as? String {
            fullSol.military_force = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "military_force_particulars") as? String {
            fullSol.military_force_particulars = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "name_on_grave") as? String {
            fullSol.name_on_grave = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "officer_rank") as? String {
            fullSol.officer_rank = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "prisoner_of_war") as? String {
            fullSol.prisoner_of_war = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "qualification") as? String {
            fullSol.qualification = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "rank_highest_achieved") as? String {
            fullSol.rank_highest_achieved = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "rank_upon_enlistment") as? String {
            fullSol.rank_upon_enlistment = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "regiment_at_death") as? String {
            fullSol.regiment_at_death = latestValue
            fullSol.battalion_array.append(["regiment_at_death":latestValue])
        }
        if let latestValue = soldierDict.object(forKey: "regiment_upon_enlistment") as? String {
            fullSol.regiment_upon_enlistment = latestValue
            fullSol.battalion_array.append(["regiment_upon_enlistment":latestValue])
        }
        if let latestValue = soldierDict.object(forKey: "remains_buried_in_cemetery") as? String {
            fullSol.remains_buried_in_cemetery = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "remains_buried_in_city_village") as? String {
            fullSol.remains_buried_in_city_village = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "remains_buried_in_country") as? String {
            fullSol.remains_buried_in_country = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "remains_buried_in_grave") as? String {
            fullSol.remains_buried_in_grave = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "remains_buried_in_plot") as? String {
            fullSol.remains_buried_in_plot = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "remains_buried_in_row") as? String {
            fullSol.remains_buried_in_row = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "saw_service_in") as? String {
            fullSol.saw_service_in = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "served_in_military_force") as? String {
            fullSol.served_in_military_force = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "soldier_reburied") as? String {
            fullSol.soldier_reburied = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "survived_war") as? String {
            fullSol.survived_war = latestValue
        }
        if let latestValue = soldierDict.object(forKey: "unit_at_discharge") as? String {
            fullSol.unit_at_discharge = latestValue
            fullSol.battalion_array.append(["unit_at_discharge":latestValue])
        }
        if let latestValue = soldierDict.object(forKey: "unit_ship_squadron") as? String {
            fullSol.unit_ship_squadron = latestValue
            fullSol.battalion_array.append(["unit_ship_squadron":latestValue])
        }
        if let latestValue = soldierDict.object(forKey: "vimy_casualty") as? String {
            fullSol.vimy_casualty = latestValue
        }
        
        return fullSol
    }
    
}
