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
        MyVariables.facebookSoldierID = MyVariables.soldierOfTheHour
        self.performSegue(withIdentifier: self.segueName, sender: nil)
    }
    
}
