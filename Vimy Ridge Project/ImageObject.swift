//
//  ImageObject.swift
//  RecoveryAttempt
//
//  Created by Student on 2016-12-19.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import Foundation

class imageObject {
    
    var name: String
    var date: String
    var author: String
    var type: String
    var text: String
    
    init(name: String, date: String, author: String, type: String, text: String) {
        
        self.name = name
        self.date = date
        self.author = author
        self.type = type
        self.text = text
        
    }
    
}
