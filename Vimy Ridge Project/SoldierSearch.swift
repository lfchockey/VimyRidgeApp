//
//  Soldier_Search.swift
//  CandySearch
//
//  Created by Mason Black on 2016-08-06.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//
import Foundation

class Soldier_Search {
    var id : String
    var name : String
    var category: String = "Soldier Name"
    var subcategory: String = "Name"
    var value: String = ""
    var locations : [[String:String]]
    var battalions: [[String:String]]
    
    init(id: String, name: String, locations: [[String:String]], battalions: [[String:String]]) {
        self.id = id
        self.name = name
        self.locations = locations
        self.battalions = battalions
    }
}