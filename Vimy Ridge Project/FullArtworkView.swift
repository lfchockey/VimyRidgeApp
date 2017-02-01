//
//  FullArtworkView.swift
//  Vimy Ridge Project
//
//  Created by Student on 2017-01-25.
//  Copyright © 2017 Mason Black. All rights reserved.
//

import UIKit

class FullArtworkView: UIViewController {
    
    //Reveive information
    var selectedImage: imageObject!
    
    //Register GUI components
    
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageDate: UILabel!
    @IBOutlet weak var imageArtist: UILabel!
    @IBOutlet weak var imageText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageText.backgroundColor = UIColor.clear
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "old paper")!)
        fullImageView.image = UIImage(named: selectedImage.name)
        fullImageView.contentMode = .scaleAspectFit
        
        imageTitle.text = selectedImage.name
        imageDate.text = selectedImage.date
        imageArtist.text = selectedImage.author
        imageText.text = selectedImage.text
        
        imageText.isEditable = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
