//
//  FriendsMatcher.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-11-14.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import Foundation

class FriendsMatcher {
    
    static var finalSoldiers:[[String:String?]] = []

    func matchSoldiers () {
        let soldierArray = MyVariables.allVimySoldiers //[soldier2, soldier3, soldier4, soldier5]  // MyVariables.allVimySoldiers
        
        
        var allMatchingSoldiers:[[String:String?]] = []
        let categories = ["battalion", "regiment_at_death", "regiment_upon_enlistment", "unit_at_discharge", "unit_ship_squadron"]
        
//        for soldier1 in soldierArray
//        {
            var matchingSoldiersId = [String]()
            let soldier1 = MyVariables.globalSoldier
        
            let category_name = [soldier1.battalion, soldier1.regiment_at_death, soldier1.regiment_upon_enlistment, soldier1.unit_at_discharge, soldier1.unit_ship_squadron]
            print(category_name)
            for singleSoldier in soldierArray
            {
                print(singleSoldier.soldier_id)
                if(singleSoldier.soldier_id == "37609") {
                    print("I found Bisset")
                }
                // *** create an if statement that doesn't try to find a matching soldier with himself
                if soldier1.soldier_id == singleSoldier.soldier_id
                {
                    
                }
                else
                {
                    for category in category_name {
                        if category != ""
                        {
                            if category == singleSoldier.battalion
                            {
                                //print("\(soldier1.soldier_id)")
                                let index = matchingSoldiersId.count
                                var soldierFound = false
                                
                                // identify if soldier has already been matched
                                for num in 0..<index {
                                    if matchingSoldiersId[num] == singleSoldier.soldier_id
                                    {
                                        soldierFound = true
                                        break
                                    }
                                }
                                
                                if !soldierFound
                                {
                                    matchingSoldiersId.append(singleSoldier.soldier_id)
                                    let temporaryDict = ["soldier_id": singleSoldier.soldier_id, "name": "\(singleSoldier.surname), \(singleSoldier.christian_names)", "category": categories[0], "matching_name": singleSoldier.battalion]
                                    
                                    allMatchingSoldiers.append(temporaryDict)
                                }
                            }
                            else if category == singleSoldier.regiment_at_death
                            {
                                
                                let index = matchingSoldiersId.count
                                var soldierFound = false
                                
                                // identify if soldier has already been matched
                                for num in 0..<index {
                                    if matchingSoldiersId[num] == singleSoldier.soldier_id
                                    {
                                        soldierFound = true
                                        break
                                    }
                                }
                                
                                if !soldierFound
                                {
                                    matchingSoldiersId.append(singleSoldier.soldier_id)
                                    let temporaryDict = ["soldier_id": singleSoldier.soldier_id, "name": "\(singleSoldier.surname), \(singleSoldier.christian_names)", "category": categories[1], "matching_name": singleSoldier.regiment_at_death]
                                    allMatchingSoldiers.append(temporaryDict)
                                }
                            }
                            else if category == singleSoldier.regiment_upon_enlistment
                            {
                                let index = matchingSoldiersId.count
                                var soldierFound = false
                                
                                // identify if soldier has already been matched
                                for num in 0..<index {
                                    if matchingSoldiersId[num] == singleSoldier.soldier_id
                                    {
                                        soldierFound = true
                                        break
                                    }
                                }
                                
                                if !soldierFound
                                {
                                    matchingSoldiersId.append(singleSoldier.soldier_id)
                                    let temporaryDict = ["soldier_id": singleSoldier.soldier_id, "name": "\(singleSoldier.surname), \(singleSoldier.christian_names)", "category": categories[2], "matching_name": singleSoldier.regiment_upon_enlistment]
                                    allMatchingSoldiers.append(temporaryDict)
                                }
                            }
                            else if category == singleSoldier.unit_at_discharge
                            {
                                let index = matchingSoldiersId.count
                                var soldierFound = false
                                
                                // identify if soldier has already been matched
                                for num in 0..<index {
                                    if matchingSoldiersId[num] == singleSoldier.soldier_id
                                    {
                                        soldierFound = true
                                        break
                                    }
                                }
                                
                                if !soldierFound
                                {
                                    matchingSoldiersId.append(singleSoldier.soldier_id)
                                    let temporaryDict = ["soldier_id": singleSoldier.soldier_id, "name": "\(singleSoldier.surname), \(singleSoldier.christian_names)", "category": categories[3], "matching_name": singleSoldier.unit_at_discharge]
                                    allMatchingSoldiers.append(temporaryDict)
                                }
                            }
                            else if category == singleSoldier.unit_ship_squadron
                            {
                                let index = matchingSoldiersId.count
                                var soldierFound = false
                                
                                // identify if soldier has already been matched
                                for num in 0..<index {
                                    if matchingSoldiersId[num] == singleSoldier.soldier_id
                                    {
                                        soldierFound = true
                                        break
                                    }
                                }
                                
                                if !soldierFound
                                {
                                    matchingSoldiersId.append(singleSoldier.soldier_id)
                                    let temporaryDict = ["soldier_id": singleSoldier.soldier_id, "name": "\(singleSoldier.surname), \(singleSoldier.christian_names)", "category": categories[4], "matching_name": singleSoldier.unit_ship_squadron]
                                    allMatchingSoldiers.append(temporaryDict)
                                }
                            }
                        }
                    }
                }
            }
//        }
        
        print(allMatchingSoldiers)
        FriendsMatcher.finalSoldiers = allMatchingSoldiers
    }
}
