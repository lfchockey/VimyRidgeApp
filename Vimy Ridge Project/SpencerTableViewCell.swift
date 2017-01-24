//
//  SpencerTableViewCell.swift
//  Vimy Ridge Project
//
//  Created by Student on 2017-01-24.
//  Copyright © 2017 Mason Black. All rights reserved.
//

import UIKit

class SpencerTableViewCell: UITableViewCell {
    
     var myImage : UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        myImage = UIImageView()
        myImage.frame = CGRect (x: bounds.width - 50, y: 0, width: 85, height: bounds.height)
        //myImage.image = UIImage(contentsOfFile: "old paper.jpg")
        contentView.addSubview(myImage)
        
        
     
    func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        }
    
    }
}
