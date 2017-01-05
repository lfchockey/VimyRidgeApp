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
    @IBOutlet weak var headstoneImage: UIImageView!
    
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
        let viewControllerIdentifiers = ["NonMilitaryProfile", "MilitaryProfile", "Friends", "Timeline", "Medals", "StudentBio"]
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
            
            
            var data: NSData?
            
            let url: NSURL = NSURL(string: "http://lest-we-forget.ca/apis/get_soldier_headstone.php?soldier_id=\(MyVariables.facebookSoldierID)&access_code=\(MyVariables.access_code)")!
            //let url = NSURL(string:"http://cdn.businessoffashion.com/site/uploads/2014/09/Karl-Lagerfeld-Self-Portrait-Courtesy.jpg")
            data = NSData(contentsOf:url as URL)
            if data != nil {
                // resize image to correct proportions
                headstoneImage?.image = UIImage(data:data! as Data)
            }
            else {
                // **** load alternate image
            }

        }
        else {
            // Error message stating that you need an internet connection to view this section of the app
            print("(Facebook Main) No soldier ID set")
            
            let alertController = UIAlertController(title: "No soldier indicated", message: "Unfortunately the soldier's ID was not properly passed. Please try again.", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // When OK is pressed, segue back to the previous ViewController (Main Screen)
                _ = self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                // ...
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

