//
//  SoldierKit.swift
//  Vimy Ridge Project
//
//  Created by SFDCI Lab 1 on 2017-01-17.
//  Copyright © 2017 Noah Keates. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

class SoldierKitVC: UIViewController, UITabBarDelegate
{
    @IBOutlet weak var soldierScene: SCNView!
    @IBOutlet weak var modelBar: UITabBar!
    @IBOutlet weak var modelText: UITextView!
    
    override func viewDidLoad() {
        //Make the modelBar a delegate of the ViewController
        //so that we can tell when it changes
        modelBar.delegate = self
    }
    
    //viewDidAppear() seems to work better with the SceneKit scene
    //as opposed to viewDidLoad(), I have no idea why
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        //Set the TabBar to the first item (the soldier)
        modelBar.selectedItem = modelBar.items?[0]
        
        modelText.text = ""
        
        sceneSetup()
    }
    
    //This function is called whenever the user switches 
    //between items in the tabBar (modelBar)
    func tabBar(_ tabBar: UITabBar, didSelect: UITabBarItem){
        sceneSetup()
    }
    
    //This function reloads the SceneKit scene with the selected model
    func sceneSetup() {
        //Clear the scene
        soldierScene.scene = SCNScene()
        
        //Create an empty model
        var model: SCNScene
        
        //Detect what item is currently selected, then load the appopriate model then set the text
        //I couldn't get a switch statement to work properly with the TabBar class, thus an if statement was used instead
        if modelBar.selectedItem == modelBar.items?[0] {
            model = SCNScene(named: "models.scnassets/soldier.dae")!
            modelText.text = ""
        } else if modelBar.selectedItem == modelBar.items?[1] {
            model = SCNScene(named: "models.scnassets/canteen.scn")!
            modelText.text = "\tSoldiers would often spend long hours on the battlefield, and to stay hydrated all soldiers would carry a canteen full of water. There were many variations of canteen, some taking on a round, circular shape, and others a rectangular shape as shown in this 3D model. Generally, canteens would hold 1-2 litres of water, were capped with cork, and had a strap attaching the canteen to the soldier.\n\tClean drinking water was usually supplied to soldiers on a daily basis, however when in remote locations, soldiers would have to rely on sources such as lakes and rivers to fill their canteens. Potentially unsafe drinking water was to be boiled for at least 20 minutes before being rendered safe to drink."
        } else if modelBar.selectedItem == modelBar.items?[2] {
            model = SCNScene(named: "models.scnassets/entrenchingtool.dae")!
            modelText.text = "\tOne of the defining events of the First World War was the introduction of trench warfare – a military tactic wherein soldiers dig trenches in the ground to shield themselves from enemy fire, providing defense and fortification. It was important to build trenches as quickly as possible in a strategic location, so for convenience and portability soldiers were supplied with an entrenching tool or spade.\n\tEntrenching tools were simply shovels with the added advantage of having a detachable head, and with later versions, a collapsible spine. This meant that a soldier could easily store it with the rest of his equipment, thus having a shovel on him ready to use at all times.\n\tThis 3D model represents a multi-headed entrenching tool with a pick on one end and a spade on the other, a variety commonly found on British soldiers during the war."
        } else if modelBar.selectedItem == modelBar.items?[3] {
            model = SCNScene(named: "models.scnassets/holdall.dae")!
            modelText.text = "\tA soldier had many accessories and hygiene items to keep track of, and a convenient way to store these items was in a “holdall”: a simple pouch with an elastic strap to hold a soldier’s necessaries. These would include a toothbrush, a comb, a fork, spoon, and knife, a razor, a button-polisher, a facecloth, spare bootlaces, et cetera. This pouch would roll up and store easily with the rest of the soldier’s possessions."
        } else { //if modelBar.selectedItem == modelBar.items?[4] {
            model = SCNScene(named: "models.scnassets/gasmask.dae")!
            modelText.text = "\tWith the arrival of chemical warfare, the need for gas masks was very great. Made to be reliable yet cheap to produce, the M2 gas mask was made of a dense filtering material providing the ability to breathe in the midst of lethal gasses for up to 5 hours. This model also featured two circular pieces of glass to peer out of, a convenient carrying pouch, and straps to securely fit the mask to the soldier’s face. It is estimated that 30 million of these gas masks were produced during the war."
        }
        
        //Add all of the child nodes of the model into an array of nodes
        var nodeArray = model.rootNode.childNodes
        
        var i = 0
        for _ in nodeArray {
            //Individually add each node in the nodeArray to the scene
            soldierScene.scene?.rootNode.addChildNode(nodeArray[i])
            i += 1
        }
        
        //Enable environment lighting and camera control
        soldierScene.autoenablesDefaultLighting = true
        soldierScene.allowsCameraControl = true
    }
}
