//
//  FullImageView.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-12-23.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit

class FullImageView: UIViewController {
    
    //Reveive information
    var selectedImage: imageObject!
    
    //Register GUI components
    
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "old paper")!)
        imageText.backgroundColor = UIColor.clear
        fullImageView.image = UIImage(named: selectedImage.name)
        fullImageView.contentMode = .scaleAspectFit

        imageTitle.text = selectedImage.name
        imageText.text = selectedImage.text
        imageText.isEditable = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
