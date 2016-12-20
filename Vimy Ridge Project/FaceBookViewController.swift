//
//  ViewController.swift
//  VimyRidgeApp
//
//  Created by MacBook on 2015-06-13.
//  Copyright (c) 2015 Matt Falkner. All rights reserved.
//

import UIKit

class FaceBookViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func SwapViews(_ sender: AnyObject) {
        moveViews(sender: sender.selectedSegmentIndex)
    }
   
    func grabDataOnSoldier() {

        //self.moveViews(0)
        self.indicator.isHidden = true

        var name = ""
        if MyVariables.globalSoldier.rank_highest_achieved != ""
        {
            name = "\(MyVariables.globalSoldier.rank_highest_achieved) \(MyVariables.globalSoldier.christian_names) \(MyVariables.globalSoldier.surname)"
        }
        else if MyVariables.globalSoldier.officer_rank != "" {
            name = "\(MyVariables.globalSoldier.officer_rank) \(MyVariables.globalSoldier.christian_names) \(MyVariables.globalSoldier.surname)"
        }
        else if MyVariables.globalSoldier.rank_upon_enlistment != "" {
            name = "\(MyVariables.globalSoldier.rank_highest_achieved) \(MyVariables.globalSoldier.christian_names) \(MyVariables.globalSoldier.surname)"
        }
        else {
            name = "\(MyVariables.globalSoldier.christian_names) \(MyVariables.globalSoldier.surname)"
        }
        self.nameLabel.text = name

    }
    
    
    func moveViews(sender:Int) {
        let viewControllerIdentifiers = ["Profile", "Biography", "Friends", "Timeline", "Photos", "Medals", "StudentBio"]
        let newController = (storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifiers[sender]))! as UIViewController
        let oldController = childViewControllers.last! as UIViewController
        
        oldController.willMove(toParentViewController: nil)
        addChildViewController(newController)
        newController.view.frame = oldController.view.frame
        transition(from: oldController, to: newController, duration: 0.25, options: .transitionCrossDissolve, animations:{ () -> Void in
            }, completion: { (finished) -> Void in
                oldController.removeFromParentViewController()
                newController.didMove(toParentViewController: self)
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("(FBVC) Current soldier's ID is: \(MyVariables.facebookSoldierID)")
        grabDataOnSoldier()
        
        if MyVariables.facebookSoldierID != "" {
            MyVariables().setGlobalSoldier(id: MyVariables.facebookSoldierID)
            moveViews(sender: 0)
            indicator.isHidden = false
            grabDataOnSoldier()
            FriendsMatcher().matchSoldiers()

        }
        else {
            // *** come up with error message if no soldier id was passed
        }
        
        print("Hello Matcher")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

