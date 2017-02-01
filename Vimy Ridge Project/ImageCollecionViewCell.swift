//
//  ImageCollecionViewCell.swift
//  RecoveryAttempt
//
//  Created by Student on 2016-12-20.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    //Add imageView
    var collectionImageView: UIImageView!
    
    override func awakeFromNib() {
        collectionImageView = UIImageView(frame: contentView.frame)
        collectionImageView.contentMode = .scaleAspectFit
        contentView.addSubview(collectionImageView)
        
        collectionImageView.backgroundColor = UIColor(red: 220, green: 191, blue: 154)
        
    }
    
}
