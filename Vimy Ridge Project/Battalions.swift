//
//  Battalions.swift
//  JacobCulminating
//
//  Created by Student on 2016-06-06.
//  Copyright © 2016 Jacob Bland. All rights reserved.
//

import Foundation

class Battalions {
    var id : Int
    var name : String
    var brigade : String
    var division : String
    
    init(id: Int, name: String, brigade: String, division: String) {
        self.id = id
        self.name = name
        self.brigade = brigade
        self.division = division
    }
}