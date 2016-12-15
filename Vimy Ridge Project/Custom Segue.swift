//
//  Custom Segue.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-10-27.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit

class Custom_Segue: UIStoryboardSegue {

    override func perform() {
        let sourceVC = self.source
        let destinationVC = self.destination
        
        sourceVC.view.addSubview(destinationVC.view)
        
        destinationVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        
        destinationVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: { () -> Void in
            
            destinationVC.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        }) { (finished) -> Void in
            
            
            
            destinationVC.view.removeFromSuperview()
            
            DispatchQueue.main.async {
                sourceVC.present(destinationVC, animated: false, completion: nil)
            }
        }
    }
    
    
    
}


