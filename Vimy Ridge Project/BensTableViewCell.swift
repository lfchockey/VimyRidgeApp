//
//  BensTableViewCell.swift
//  ios-swift-collapsible-table-section
//
//  Created by Student on 2016-12-07.
//  Copyright © 2016 Yong Su. All rights reserved.
//

import UIKit

class BensTableViewCell: UITableViewCell {
    
    var myLabel1: UILabel!
    var myLabel2: UILabel!
    var myButton1 : UIButton!
    var myButton2 : UIButton!
    var myImage : UIImageView!
    var myFont : UIImage!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        myImage = UIImageView()
        myImage.frame = CGRect (x: 0, y: 0, width: bounds.width , height: bounds.height)
        let image = UIImage(named: "cellBackground")
        myImage.image = image
        //contentView.addSubview(myImage)
        
        
        myLabel1 = UILabel()
        myLabel1.frame = CGRect (x: 5, y: 10, width: 150, height: 30)
        myLabel1.textColor = UIColor.black
        contentView.addSubview(myLabel1)
        
        myLabel2 = UILabel()
        myLabel2.frame = CGRect (x: 5, y: 10, width: 150, height: 30)
        myLabel2.textColor = UIColor.black
        contentView.addSubview(myLabel2)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
