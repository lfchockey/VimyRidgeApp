//
//  BattalionSearchNavController.swift
//  Vimy Ridge Project
//
//  Created by Mason Black on 2017-02-20.
//  Copyright © 2017 Mason Black. All rights reserved.
//
import UIKit
import AVFoundation

class BattalionSearchNavController: UINavigationController
{

    override func viewDidLoad()
    {
       self.navigationController?.pushViewController(BattalionCollapsibleTableVC(), animated: true)
    }
    
}
