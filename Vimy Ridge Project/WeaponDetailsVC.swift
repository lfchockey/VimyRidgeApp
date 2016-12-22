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
    @IBOutlet weak var infoOutputTextView: UITextView!
    @IBOutlet weak var weaponTitle: UILabel!
    
    
    // THE FOLLOWING IS NOT NEEDED ANYMORE BASED ON THE INFORMATION BEING READ FROM THE WeaponInfo.plist file
    //array containing all the information of the
    let weaponInfo = ["Country of Origin: Canada\nIn service: 1905\nOverall length: 1320mm (51.97in)\nBarrel length: 711.00mm (27.99in)\nWeight (empty): 8.82lb (4.00kg)\n\nCalibre: 0.303 British\nAction (reload): Manual pull, bolt-Action system\n\nMagazine size: 5-round magazine\nMuzzle velocity: 2,000 ft./sec (610m/sec)\nRate-of-fire: 20 rounds per minute\nSight: iron sight front and rear", "Country of origin: United Kingdom\nFirst made in: 1895\nOverall length: 1130mm (44.49)\nBarrel length: 635mm (25.00in)\nWeight (empty): 8.82lb (4.00kg)\n\nCalibre: .303 Mk VII SAA ball\nAction (reload): bolt-Action\n\nMagazine size: 10 round magazine size (detachable box)\nMuzzle velocity: 2,441 ft./sec (744m/sec)\nRate of fire: 20 rounds per minute\nSights: sliding ramp rear, fixed front; telescopic sights (optional)", "Country of origin: Germany\nFirst made in: 1935\nOverall length: 1110mm (43.70in)\nBarrel length: 610mm (24.02in)\nWeight (empty): 8.60lb (3.90kg)\n\nCalibre: 7.92x57mm Mauser\nAction (reload): bolt action\n\nMagazine size: 5 round internal box magazine size\nMuzzle velocity: 2,822 ft./sec (860m/sec)\nRange: 1969 ft. (600m)\nSight: iron sight front and rear; optional optics", "Country of origin: Germany\nInitial year of service: 1898\nOverall Length: 1250mm(49.21in)\nBarrel Length: 740mm(29.13in)\nWeight (empty): 9.02lb(4.09kg)\n\nCalibre: 7.92x57mm Mauser\nAction (reload): manually operated bolt action\n\nMagazine size: 5-round clip, internal magazine\nMuzzle velocity: 2881 ft./sec (878m/sec)\nRate of fire: 12 rounds per minute\nRange: 1640 ft.(500m;574yds)\nSight: iron sights; optional optics", "Country of origin: British Empire\nFirst made in: 1887\nOverall length: 286mm(11.25in)\nBarrel length: 106mm(4.17in)\nWeight (empty): 2.4lb(1.1kg)\n\nCalibre: .455(11.6mm)\nAction (reload): Double action revolver\n\nMagazine size: 6-round cylinder\nMuzzle velocity: 620 ft./sec (190m/sec)\nRate of fire: 20-30 rounds/minute\nrange: 50 yd.\nSight: fixed front and rear notch", "Country of origin: Germany\nInitial year of service: 1904\nOverall length: 223mm (8.78in)\nBarrel length: 98mm (3.86in)\nWeight (empty): 1.92lb(0.87kg)\n\nCalibre: 7.65x22mm parabellum: 1908 (p08) 9x19mm parbellum\nAction (reload): semi-automatic; short recoil; toggle-locked\n\nMagazine size: 8-round detachable box magazine: 32-round detachable drum\nMuzzle velocity: 375 ft./sec (114m/sec)\nRange: 164 ft. (50m; 55yds)\nSights: iron front and rear", "First made in: 1895\nOverall length: 1016mm(40in)\nBarrel length: 711mm(27.99in)\nWeight (empty): 22.49lb (10.20kg)\n\nCalibre: .30-06 Springfield; 6mm; 30-40 Krag; 7x57mm; 6.5x52mm\nAction (reload): gas-operated, lever-Action\n\nMuzzle Velocity: 2,800 ft./sec (853m/sec)\nRate of fire: 600 rounds per minute\nSight: iron sights", "Country of origin: United States\nFirst year of service: 1914\nOverall length: 1280mm(50.39in)\nBarrel length: 670mm (26.38)\nWeight (empty): 28.66lb (13kg)\n\nCalibre: .303 British; 30-06 Springfield; 7.92x57mm Mauser\nAction (reload): gas-operated\n\nMuzzle velocity: 2,440 ft./sec (744m/sec)\nRate of fire: 550 rounds per minute\nRange: 2,624 ft. (800m)\nSights: iron blade and tangent leaf", "Country of origin: United Kingdom\nInitial year of service: 1915\nOverall length: 95mmv (3.74)\nWeight: 1.69lb(0.77kg)\nAction: manually actuated; thrown\nRange: 115 ft. (35m; 38yds)", "Country of origin: Germany\nInitial year of service: 1915\nOverall length: 365mm (14.37in)\nWeight: 1.31lb (0.6kg)\nAction: manually actuated, time fuse explosive: thrown\nRange: 105 ft. (32m/35yds)"]
    
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
            
        case "Ross Rifle MK III (Canada)":
            // The following line now reads the weapon info from a plist (instead of the array above)
            //      This allows us to grab individual pieces of information to make it easier to display
            
            let weapon = WeaponsInfo(weaponName: weaponName)
            print(weapon.country)
            infoOutputTextView.text = weapon.overallLength
            let scene = SCNScene(named: "WeaponAssets.scnassets/WW1 Ross Rifle MKIII (Complete).dae")!
            weaponView.scene = scene
            
        //case "Lee Enfield (Canadian)":
            
            //let scene = SCNScene(named: "art.scnassets/Lee Enfield (Canadian).dae")!
            //weaponView.scene = scene
            
        //case "KAR-98K (German)":
            
            //let scene = SCNScene(named: "art.scnassets/Lee Enfield (Canadian).dae")!
            //weaponView.scene = scene
            
        //case "Mauser Gewehr 98 (German)":
           
            //let scene = SCNScene(named: "art.scnassets/Mauser Gewehr 98 (German).dae")!
            //weaponView.scene = scene
            
        case "Webley revolver (Canadian)":
             _ = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WWI Canadian Webley (Complete)")!
            weaponView.scene = scene
           
        case "Luger (German)":
            infoOutputTextView.text = weaponInfo[5]
            //let scene = SCNScene(named: "art.scnassets/Luger (German).dae")!
            //weaponView.scene = scene
            
        //case "Colt-browning machine gun M1895/14 (Canadian)":
            
            //let scene = SCNScene(named: "art.scnassets/Colt-browning machine gun M1895/14 (Canadian).dae")!
            //weaponView.scene = scene
            
        case "Lewis (Canadian)":
             _ = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WW1 Male Tank (Complete)).dae")!
            weaponView.scene = scene
            
        case "Mills bomb (Canadian)":
 
            _ = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WW1 mills bomb N0 5 (Complete).dae")!
            weaponView.scene = scene
            
        case "Stick grenade (German)":
            
            _ = WeaponsInfo(weaponName: weaponName)
            let scene = SCNScene(named: "WeaponAssets.scnassets/WWI Potato Masher (Complete).dae")!
            weaponView.scene = scene
        
        
        default:
            infoOutputTextView.text = "PotatOS Lament"  //portal 2 reference lol
        }
        
        //lets the user move the camera around the view
        weaponView.allowsCameraControl = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}




// Important note: if you want the weapon to auto rotate in place, YOU MUST MAKE SURE THAT THE 3D WEAPON IS PERFETLY CENTERED WHEN BUILDING IT. That means that when you're looking at the model in the 3D editing program, the axis guides (typically red, blue, and green lines that mark the origin point (0,0)) are in the very center of the model. That origin point is the point that the model will auto rotate on. (I presume, tho I don't have a model to test on)
// Oh, and you also want ot mae sure that the gun is pointing towards the +X axis. his is super important, because right now you can only see the rifle from the back, and people won't aren't likely to instantly think of a rifle when they see a brown box looking at them.
//
// Once you've got that, just paste the following code above every "weaponView.scene = scene" statement in the master switch statement
//
// let weapon = scene.rootNode
// weapon.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y:1, z: 0, duration: 1)))
