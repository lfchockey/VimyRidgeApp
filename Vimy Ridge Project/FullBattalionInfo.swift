
//  FullBattalionInfo.swift
//  SingleBatt.ViewUI-DRAFT
//
//  Created by Student on 2016-06-07.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation


class FullBattalionInfo: NSObject {
    
    //---Battalion Information Variables-----//
    
    var battalion_name: String
    var strength: String
    var disembarkation:String
    var perpetuated_by:String
    var war_diary:String
    var commanded_by: String
    var location: String
    var canadian_arrival:String
    var date_created:String
    var embarkation: String
    var battalion_id: String
    var france_arrival: String
    var interesting_facts: String
    var reinforced_by: String
    
    
    override init () {
        self.battalion_name = ""
        self.strength = ""
        self.disembarkation = ""
        self.perpetuated_by = ""
        self.war_diary = ""
        self.commanded_by = ""
        self.location = ""
        self.canadian_arrival = ""
        self.date_created = ""
        self.embarkation = ""
        self.battalion_id = ""
        self.france_arrival = ""
        self.interesting_facts = ""
        self.reinforced_by = ""
    }
}
