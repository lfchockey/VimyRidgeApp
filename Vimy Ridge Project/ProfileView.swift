//
//  ProfileView.swift
//  VimyRidgeApp
//
//  Created by MacBook on 2015-06-13.
//  Copyright (c) 2015 Matt Falkner. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}



class ProfileView:UIViewController {

    @IBOutlet var lblDOB: UILabel!
    @IBOutlet var lblHome: UILabel!
    @IBOutlet var lblDOD: UILabel!
    @IBOutlet var lblPOB: UILabel!
    @IBOutlet var lblRel: UILabel!
    @IBOutlet var lblAD: UILabel!
    @IBOutlet var lblReg: UILabel!
    @IBOutlet var lblRank: UILabel!
    @IBOutlet var lblDOE: UILabel!
    @IBOutlet var lblTC: UILabel!
    
    override func viewDidLoad() {
       
            lblDOB.text = MyVariables.globalSoldier.date_of_birth
            lblHome.text = "\(MyVariables.globalSoldier.present_address_town) \(MyVariables.globalSoldier.present_address_province)"
            lblDOD.text = MyVariables.globalSoldier.date_of_death
            lblPOB.text = MyVariables.globalSoldier.remains_buried_in_cemetery
            lblRel.text = MyVariables.globalSoldier.religion
            lblAD.text = MyVariables.globalSoldier.age_at_death
            //let battalionArr = MyVariables.globalSoldier.regiment_at_death.characters.split {$0 == "-"}.map { String($0) }
            lblReg.text = MyVariables.globalSoldier.regiment_at_death
            lblRank.text = MyVariables.globalSoldier.rank_highest_achieved
            lblDOE.text = MyVariables.globalSoldier.date_of_enlistment
            lblTC.text = MyVariables.globalSoldier.trade_or_calling
        
        
    }
}
