//
//  VimyMythsScreenViewController.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-12-14.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit

class VimyMythsScreenViewController: UIViewController {

   
    @IBOutlet weak var mythName: UILabel!
    
    
    @IBOutlet weak var mythExplanation: UILabel!
    
    override func viewDidLoad () {
    
        super.viewDidLoad()
        
        if (mythVariables.infoShown == 1) {
            self.mythName.text = "Vimy monument is just for the battle of Vimy Ridge."
            self.mythExplanation.text = "The monument is actually for all the soldiers who were missing."
        }
        
        else if (mythVariables.infoShown == 2) {
            self.mythName.text = "Canada wasn't actually the first country to capture Vimy Ridge."
            self.mythExplanation.text = "Although the Canadian were the first to successfuly hold the ridge the French had already secured Vimy Ridge earlier. However the Germans had got a hold of it again."
        }
    
        else if (mythVariables.infoShown == 3) {
            self.mythName.text = "Canada wasn't actually under the command of a Canadian."
            self.mythExplanation.text = "The divisions were under the command of British Julian Bying."
        }
        
        else if (mythVariables.infoShown == 4) {
            self.mythName.text = "Vimy Ridge wasn't actually the first time all active divisions fought together ???"
            self.mythExplanation.text = "Mount Sorrel was the first time all divisions fought together ???"
        }
        
        else {
            self.mythName.text = "Vimy monument is just for the battle of Vimy Ridge."
            self.mythExplanation.text = "The monument is actually for all the soldiers who were missing."
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
