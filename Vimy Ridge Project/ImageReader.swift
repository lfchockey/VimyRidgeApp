//
//  ImageReader.swift
//  RecoveryAttempt
//
//  Created by Student on 2016-12-19.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import Foundation

class ImageReader {
    
    var allImages = [imageObject]()
    
    var warImages = [imageObject]()
    var postWarImages = [imageObject]()
    var recentImages = [imageObject]()
    var propagandaImages = [imageObject]()
    
    init() {
        
        //Establish pathway to plist and grab info
        let filePath = Bundle.main.path(forResource: "Images", ofType: "plist")
        let properties = NSDictionary(contentsOfFile: filePath!)
        
        
        //print(properties!)
        let allImages = properties!["Images"] as! NSArray
        
        //Create imageObjects and populate arrays
        for i in 0..<allImages.count {
            let imageValues = allImages[i] as! NSDictionary
            //print(imageValues["author"] as! String)
            let io = imageObject(name: imageValues["name"] as! String, date: imageValues["date"] as! String, author: imageValues["author"] as! String, type: imageValues["type"] as! String)
            
            if io.type == "war" {
                warImages.append(io)
            } else if io.type == "postWar" {
                postWarImages.append(io)
            } else if io.type == "recent" {
                recentImages.append(io)
            } else {
                propagandaImages.append(io)
            }
        }
        
        //        print(warImages[0].name)
        //        print(recentImages[0].name)
        //        print("Stop")
        
    }
    
}
