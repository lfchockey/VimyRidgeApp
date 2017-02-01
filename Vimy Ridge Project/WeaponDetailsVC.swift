//
//  weaponDetailsViewController.swift
//  VimmyWeapons
//
//  Created by Griffin on 2015-06-12.
//  Copyright (c) 2015 KatsuSoft. All rights reserved.
// Brynne Allan

import UIKit
import SceneKit

class WeaponDetailsVC: UIViewController {
    
    //declaration of the links for the items in the storyboard
    @IBOutlet weak var weaponView: SCNView!
    
    @IBOutlet weak var weaponTitle: UILabel!
    @IBOutlet weak var CoOAnswer: UILabel!
    
    @IBOutlet weak var YearAnswer: UILabel!
    @IBOutlet weak var weaponLength: UILabel!
    @IBOutlet weak var weaponWeight: UILabel!
    @IBOutlet weak var weaponCalibre: UILabel!
    @IBOutlet weak var weaponrateofFire: UILabel!
    @IBOutlet weak var weaponRange: UILabel!
    @IBOutlet weak var weaponSight: UILabel!
    @IBOutlet weak var weaponMagazineSize: UILabel!
    @IBOutlet weak var weaponMuzzleVelocity: UILabel!
    @IBOutlet weak var weaponBarrelLength: UILabel!
    @IBOutlet weak var weaponActionReload: UILabel!
    
    
    
    
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label6: UILabel!
    @IBOutlet weak var Label7: UILabel!
    @IBOutlet weak var Label8: UILabel!
    @IBOutlet weak var Label9: UILabel!
    @IBOutlet weak var Label10: UILabel!
    @IBOutlet weak var Label11: UILabel!
    @IBOutlet weak var Label12: UILabel!
    @IBOutlet weak var Label13: UILabel!
    
    
    
    
    
    
    // THE FOLLOWING IS NOT NEEDED ANYMORE BASED ON THE INFORMATION BEING READ FROM THE WeaponInfo.plist file
    //array containing all the information of the
    
    var weaponName = String() //a string to hold the name of the weapon the user wants to see
    
    override func viewWillAppear(_ animated: Bool) {
        weaponTitle.text = weaponName //set the title to the name of the weapon
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //swith statement that picks the right information from the weaponInfo array for the weapon selected
        
        //NOTE:
        //When you get the 3D models done for all the other weapons, you can import them and thier textures into the art.scnassets folder. MAKE SURE THEY ARE NAMED EXACTLY THE SAME AS WHAT THEY ARE REFERRED TO BELOW. After that, all ya have to do is uncomment the two lines of code under the corrosponding infoOutputTextView.text declaration statements :)
        print (weaponName)
        
        
        
        
        
        
        
        
        switch weaponName {
            
            
        case "Webley Revolver":
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/Webley revolver (Canadian).dae")!
            weaponView.scene = scene
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
            
            
            
        case "Lewis":
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/Lewis Gun #d.dae")!
            weaponView.scene = scene
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
        case "Mills bomb":
            
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/Mills bomb (Canadian).dae")!
            weaponView.scene = scene
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
        case "Stick grenade":
            
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WWI Potato Masher (Complete).dae")!
            weaponView.scene = scene
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
            
        case "Luger":
            
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WWI Potato Masher (Complete).dae")!
            weaponView.scene = scene
            
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
        case "Mark V Tank":
            
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WW1 Canadian Lewis (Complete).dae")!
            weaponView.scene = scene
            
            
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
        case "KAR-98K (German)":
            
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WWI 6 inch Artillery (Complete).dae")!
            weaponView.scene = scene
            
            
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
            
        case "Sopwith Camel":
            
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/Sopwith Camel.dae")!
            weaponView.scene = scene
            
            
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
            
        case "Ross Rifle MK III (Canada)":
            
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WW1 Ross Rifle MKIII (Complete).dae")!
            weaponView.scene = scene
            
            
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
            
        case "Livens Projector":
            let weapon = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/Livens Projector.dae")!
            weaponView.scene = scene
            
            
            CoOAnswer.text = Explode(weaponString: weapon.country)
            YearAnswer.text = Explode(weaponString: weapon.year)
            
            weaponTitle.text = Explode(weaponString: weaponName)
            weaponLength.text = Explode(weaponString: weapon.overallLength)
            weaponWeight.text = Explode(weaponString: weapon.weight)
            weaponCalibre.text = Explode(weaponString: weapon.calibre)
            weaponrateofFire.text = Explode(weaponString: weapon.rateOfFire)
            weaponSight.text = Explode(weaponString: weapon.sight)
            weaponMagazineSize.text = Explode(weaponString: weapon.magazineSize)
            weaponMuzzleVelocity.text = Explode(weaponString: weapon.muzzleVelocity)
            weaponBarrelLength.text = Explode(weaponString: weapon.barrelLength)
            weaponActionReload.text = Explode(weaponString: weapon.action)
            
            
            
            
            
            
        default:
            print("Unable to find weapon")
        }
        
        let modelName = UIDevice.current.modelName
        
        if modelName == "Simulator" {
            
            weaponTitle.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponLength.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponBarrelLength.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponWeight.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponCalibre.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponrateofFire.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponSight.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponMagazineSize.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponMuzzleVelocity.font = UIFont(name: "Chapter11W00-Regular", size:12)
            YearAnswer.font = UIFont(name: "Chapter11W00-Regular", size:12)
            CoOAnswer.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponRange.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponActionReload.font = UIFont(name: "Chapter11W00-Regular", size:12)
            
            Label1.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label2.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label3.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label4.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label5.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label6.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label7.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label8.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label9.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label10.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label11.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label12.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label13.font = UIFont(name: "Chapter11W00-Regular", size:10)
            
            
            
            
            
        }
        
        if modelName == "iPhone 7 Plus" ||  modelName == "iPhone 7"{
            
            weaponTitle.font = UIFont(name: "Chapter11W00-Regular", size:24)
            weaponLength.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponBarrelLength.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponWeight.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponCalibre.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponrateofFire.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponSight.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponMagazineSize.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponMuzzleVelocity.font = UIFont(name: "Chapter11W00-Regular", size:16)
            YearAnswer.font = UIFont(name: "Chapter11W00-Regular", size:16)
            CoOAnswer.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponRange.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponActionReload.font = UIFont(name: "Chapter11W00-Regular", size:12)
            
        }
        
        if modelName == "iPhone 4s"  || modelName == "iPhone 4" {
            
            weaponTitle.font = UIFont(name: "Chapter11W00-Regular", size:10)
            weaponLength.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponBarrelLength.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponWeight.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponCalibre.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponrateofFire.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponSight.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponMagazineSize.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponMuzzleVelocity.font = UIFont(name: "Chapter11W00-Regular", size:16)
            YearAnswer.font = UIFont(name: "Chapter11W00-Regular", size:16)
            CoOAnswer.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponRange.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponActionReload.font = UIFont(name: "Chapter11W00-Regular", size:12)
            
        }
        
        if modelName == "Iphone 6"  ||  modelName == "Iphone 6s" ||  modelName == "Iphone 6 Plus" || modelName == "Iphone 6s Plus "{
            
            weaponTitle.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponLength.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponBarrelLength.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponWeight.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponCalibre.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponrateofFire.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponSight.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponMagazineSize.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponMuzzleVelocity.font = UIFont(name: "Chapter11W00-Regular", size:16)
            YearAnswer.font = UIFont(name: "Chapter11W00-Regular", size:16)
            CoOAnswer.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponRange.font = UIFont(name: "Chapter11W00-Regular", size:16)
            weaponActionReload.font = UIFont(name: "Chapter11W00-Regular", size:12)
            
            
            
            Label1.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label2.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label3.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label4.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label5.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label6.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label7.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label8.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label9.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label10.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label11.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label12.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label13.font = UIFont(name: "Chapter11W00-Regular", size:10)
            
            
            
            
        }
        
        if modelName == "Ipad 2" || modelName == "Ipad 3"  || modelName == "Ipad 4"  || modelName == "Ipad Pro"  || modelName == "Ipad Air" || modelName == "Ipad Air 2" || modelName == "Ipad Mini"  || modelName == "Ipad Mini 2"  || modelName == "Ipad Mini 3" || modelName == "Ipad Mini 4" {
            
            weaponTitle.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponLength.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponBarrelLength.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponWeight.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponCalibre.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponrateofFire.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponSight.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponMagazineSize.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponMuzzleVelocity.font = UIFont(name: "Chapter11W00-Regular", size:30)
            YearAnswer.font = UIFont(name: "Chapter11W00-Regular", size:30)
            CoOAnswer.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponRange.font = UIFont(name: "Chapter11W00-Regular", size:30)
            weaponActionReload.font = UIFont(name: "Chapter11W00-Regular", size:12)
            
            Label1.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label2.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label3.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label4.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label5.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label6.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label7.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label8.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label9.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label10.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label11.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label12.font = UIFont(name: "Chapter11W00-Regular", size:20)
            Label13.font = UIFont(name: "Chapter11W00-Regular", size:10)
            
        }
        
        if modelName == " iPhone 5"  || modelName == "iPhone 5s"  || modelName == "iPhone 5c" || modelName == "iPhone SE"  {
            
            weaponTitle.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponLength.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponBarrelLength.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponWeight.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponCalibre.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponrateofFire.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponSight.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponMagazineSize.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponMuzzleVelocity.font = UIFont(name: "Chapter11W00-Regular", size:12)
            YearAnswer.font = UIFont(name: "Chapter11W00-Regular", size:12)
            CoOAnswer.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponRange.font = UIFont(name: "Chapter11W00-Regular", size:12)
            weaponActionReload.font = UIFont(name: "Chapter11W00-Regular", size:12)
            
            
            Label1.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label2.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label3.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label4.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label5.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label6.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label7.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label8.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label9.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label10.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label11.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label12.font = UIFont(name: "Chapter11W00-Regular", size:10)
            Label13.font = UIFont(name: "Chapter11W00-Regular", size:10)
            
        }
        
        
        
        
        
        
        
        
        
        //lets the user move the camera around the view
        weaponView.allowsCameraControl = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    
    
    
    
    
    
    
    
    func Explode (weaponString: String) -> String{
        let stringArray = weaponString.components(separatedBy: ":")
        
        if stringArray.count == 1{
            
            return stringArray [0]
        }
        else if stringArray.count == 2 {
            
            return stringArray [1]
        }
        else {
            
            return " N/A "
        }
    }
    
}



// Important note: if you want the weapon to auto rotate in place, YOU MUST MAKE SURE THAT THE 3D WEAPON IS PERFETLY CENTERED WHEN BUILDING IT. That means that when you're looking at the model in the 3D editing program, the axis guides (typically red, blue, and green lines that mark the origin point (0,0)) are in the very center of the model. That origin point is the point that the model will auto rotate on. (I presume, tho I don't have a model to test on)
// Oh, and you also want ot mae sure that the gun is pointing towards the +X axis. his is super important, because right now you can only see the rifle from the back, and people won't aren't likely to instantly think of a rifle when they see a brown box looking at them.
//
// Once you've got that, just paste the following code above every "weaponView.scene = scene" statement in the master switch statement
//
// let weapon = scene.rootNode
// weapon.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y:1, z: 0, duration: 1)))
