//
//  SoldierOfHourNavController.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-12-06.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit
import AVFoundation

class SoldierOfHourNavController: UINavigationController
{
    var segueName: String = "SoldierOfHourSegue"
    override func viewDidLoad()
    {
        if MyVariables.allSoldiersDownloaded {
            MyVariables.facebookSoldierID = MyVariables.soldierOfTheHour
            self.performSegue(withIdentifier: self.segueName, sender: nil)
        }
        else {
            //***need to do show the activity indicator (running soldier) 
        }
    }
    
}
