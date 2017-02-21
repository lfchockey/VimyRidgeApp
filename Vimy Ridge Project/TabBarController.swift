//
//  TabBarController.swift
//  Vimy Ridge Project
//
//  Created by Student on 2017-01-13.
//  Copyright © 2017 Mason Black. All rights reserved.
//

import UIKit
import AVFoundation

class TabBarController: UITabBarController, UITabBarControllerDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizableViewControllers = nil // this line needed in order to take the edit option out of the View Controllers
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(tabBarController.selectedIndex)
        if (tabBarController.selectedIndex == 0) {
            print("first one")
        } else if (tabBarController.selectedIndex == 1) {
            
        } else if (tabBarController.selectedIndex == 2) {
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if !MyVariables.allSoldiersDownloaded
        {
            return false
            
        }
        else
        {
            return true
        }
    }

}
