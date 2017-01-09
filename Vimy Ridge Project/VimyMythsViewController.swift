//
//  VimyMythsViewController.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-10-07.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit

struct mythVariables {
    
    static var infoShown = 1;
    
}

class VimyMythsViewController: UIViewController {
    
   
    
    @IBAction func mythOne(_ sender: Any) {
        mythVariables.infoShown = 1
    }
   
    @IBAction func mythTwo(_ sender: Any) {
        mythVariables.infoShown = 2
    }
    
    @IBAction func mythThree(_ sender: Any) {
        mythVariables.infoShown = 3
    }
    
    @IBAction func mythFour(_ sender: Any) {
        mythVariables.infoShown = 4
    }
    
    /*func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        if (segue.identifier == "MythOneSegue") {
            
        }
        
        else if (segue.identifier == "MythTwoSegue"){
            
        }
        
        else if (segue.identifier == "MythThreeSegue"){
            
        }
        
        else if (segue.identifier == "MythFourSegue"){
            
        }
    }
    */

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    
}
