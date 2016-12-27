//
//  HistoryViewController.swift
//  VimyRidgeMaster
//
//  Created by Mason Black on 2016-03-18.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBAction func SwitchPages(_ sender: AnyObject) {
        moveViews(sender: sender.selectedSegmentIndex)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        moveViews(sender: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func moveViews(sender:Int)
    {
        // if the segue needs to go to the Histoyr => Stats
        if sender == 2 {
            let navController = UINavigationController(rootViewController: StatsTableViewController())

            self.present(navController, animated: true, completion: nil)
            
        }
        else {
            let viewControllerIdentifiers = ["Artwork","Background","Stats","VimyMyth"]
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
    }
    
    
    // This function is not set up to display a random fact yet
    func randomFactsLoader() {
        let randomNumber = Int(arc4random_uniform(6)) + 1
        //generates a random number between 0-6 every time the variable is  used
        
        let Facts: Array = ["The assault on Vimy Ridge, the northern part of the wider area of Arras, began at 5:30am on Easter Monday, April 9th, 1917",
                            
                            "It was the first occasion where all four divisions of the Canadian Coprs attacked as a composite formation",
                            
                            "There were 3,958 out of 10,602 Canadian casualties",
                            
                            "The Canadians had demontrated they were one of the outstanding formations on the Western Front and masters of offensive warefare",
                            
                            "Vimy Ridge was one of the most important battles of WW1",
                            
                            "Inscribed on the ramparts of the memorial are the names of 11,285 Canadian soldiers who were posted 'missing, presumed dead' in France",
                            
                            "The Canadian National Vimy Memorial stands on Hill 145, overlooking the Canadian battlefield of 1917, at one of the fiercest points of fighting" ]
        //this holds all 7 facts in an array, easier than making each one a variable, can be called anytime by using "[facts]"
        
        
        let randomFact = Facts[Int(randomNumber)]
        print(randomFact)
        //this allows for random facts to be displayed when the user taps the FactButton
        
        //self.FactLabel.text = randomFact
        //displays the text of the randomly selected text in the label

    }

}
