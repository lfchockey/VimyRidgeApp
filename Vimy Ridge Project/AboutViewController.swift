//
//  AboutViewController.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-12-16.
//  Copyright © 2016 Mason Black. All rights reserved.
//
// maloney

import UIKit

class AboutViewController: UITableViewController {
    
    @IBAction func developersClick(_ sender: AnyObject) {
//        let navController = UINavigationController(rootViewController: Developers())
//        
//        self.present(navController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(Developers(), animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let window = UIWindow(frame:UIScreen.main.bounds)
//        window.makeKeyAndVisible()
//        window.rootViewController = UINavigationController(rootViewController: Developers())
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
