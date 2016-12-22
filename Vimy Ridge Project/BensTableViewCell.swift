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
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let gap : CGFloat = 10
        let labelHeight: CGFloat = 30
        let labelWidth: CGFloat = 150
        let lineGap : CGFloat = 5
        let label2Y : CGFloat = gap + labelHeight + lineGap
        let imageSize : CGFloat = 30
        
        
        myImage = UIImageView()
        myImage.frame = CGRect (x: 0, y: 0, width: bounds.width + 110, height: bounds.height + 10)
        //myImage.image = UIImage(contentsOfFile: "old paper.jpg")
        contentView.addSubview(myImage)
        
        
        myLabel1 = UILabel()
        myLabel1.frame = CGRect (x: 5, y: 10, width: 150, height: 30)
        myLabel1.textColor = UIColor.black
        contentView.addSubview(myLabel1)
        

        
        myLabel2 = UILabel()
        myLabel2.frame = CGRect (x: 5, y: 10, width: 150, height: 30)
        myLabel2.textColor = UIColor.black
        contentView.addSubview(myLabel2)
        
//        myButton1 = UIButton()
//        myButton1.frame = CGRect(x: 5, y: 10, width: 150, height: 30)
//        //myButton1.setImage(UIImage(named: "old paper.jpg"), for: UIControlState.normal)
//        contentView.addSubview(myButton1)
//        
//        myButton2 = UIButton()
//        myButton2.frame = CGRect(x: 5, y: 10, width: 150, height: 30)
//        //myButton2.setImage(UIImage(named: "old paper.jpg"), for: UIControlState.normal)
//        contentView.addSubview(myButton2)
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
