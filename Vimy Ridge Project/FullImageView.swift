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
    var selectedName: String = ""
    var selectedDate: String = ""
    var selectedArtist: String = ""
    
    //Register GUI components
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageDate: UILabel!
    @IBOutlet weak var imageArtist: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "old paper")!)
        fullImageView.image = UIImage(named: selectedName) //Grab from indexPath
        fullImageView.contentMode = .scaleAspectFit
        
        imageTitle.text = selectedName
        imageDate.text = selectedDate
        imageArtist.text = selectedArtist
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
