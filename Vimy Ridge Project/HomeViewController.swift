//
//  ViewController.swift
//  VimyRidgeMaster
//
//  Created by Mason Black on 2015-07-09.
//  Copyright (c) 2015 Mason Black. All rights reserved.
//
// Culminating Assignment Student Branches
// Seward
// Wright
// Wang
// Bland
// Mitchell
// Hogan
// Allan
// Nichols
// Maloney
// Little
// Hicks
// Dexter
// Keates
// Eric
// Bogora
// Tripp
// Bennett
// Gordon



import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    // The timer is used to check when the download is complete and will only allow segues when it is
    var timer = Timer()
    var segueName: String = ""

    @IBOutlet weak var soldierOfHourButton: UIButton!
    @IBOutlet weak var SearchOutlet: UIButton!
    @IBOutlet weak var loadingImageView: UIImageView!
    
    @IBOutlet weak var musicButton: UIButton!
    @IBAction func musicButtonPress(_ sender: AnyObject) {
        // Toggle mute via function in Util.swift
        toggleMute(button: musicButton)
    }
    
//    @IBAction func TestFacebook(_ sender: AnyObject) {
//        MyVariables.facebookSoldierID = "55"
//        segueName = "FacebookSegue"
//        if !MyVariables.allSoldiersDownloaded {
//            loadAnimation()
//            scheduledTimerWithTimeInterval()
//        }
//        else {
//            self.performSegue(withIdentifier: self.segueName, sender: nil)
//        }
//    }
    
    @IBAction func About_Click(_ sender: Any) {
        segueName = "AboutSegue"
        self.performSegue(withIdentifier: self.segueName, sender: nil)
    }
    
    @IBAction func soldierOfHourClick(_ sender: AnyObject) {
        MyVariables.facebookSoldierID = MyVariables.soldierOfTheHour
        segueName = "FacebookSegue"
        if !MyVariables.allSoldiersDownloaded {
            loadAnimation()
            scheduledTimerWithTimeInterval()
        }
        else {
            self.performSegue(withIdentifier: self.segueName, sender: nil)
        }
        
    }
    
    @IBAction func SearchClick(_ sender: AnyObject) {
        segueName = "SearchSegue"
        if !MyVariables.allSoldiersDownloaded {
            loadAnimation()
            scheduledTimerWithTimeInterval()
        }
        else {
            self.performSegue(withIdentifier: self.segueName, sender: nil)
        }
    }
    
    @IBAction func MapClick(_ sender: AnyObject) {
        segueName = "MapSegue"
        self.performSegue(withIdentifier: self.segueName, sender: nil)
    }
    
    @IBAction func WeaponsClick(_ sender: AnyObject) {

        self.navigationController?.pushViewController(WeaponSelectVC(), animated: true)

    }
    
    @IBAction func BattalionsClick(_ sender: AnyObject) {
        self.navigationController?.pushViewController(BattalionCollapsibleTableVC(), animated: true)

    }
    
    @IBAction func HistoryClick(_ sender: AnyObject) {
        segueName = "HistorySegue"
        self.performSegue(withIdentifier: self.segueName, sender: nil)
    }
    
    @IBAction func KitClick(_ sender: AnyObject) {
        segueName = "KitSegue"
        self.performSegue(withIdentifier: self.segueName, sender: nil)
    }
    
    @IBAction func VirtualTourClick(_ sender: AnyObject) {
        segueName = "VirtualMemorialSegue"
        if !MyVariables.allSoldiersDownloaded {
            loadAnimation()
            scheduledTimerWithTimeInterval()
        }
        else {
            self.performSegue(withIdentifier: self.segueName, sender: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !MyVariables.allSoldiersDownloaded {
            MyVariables().downloadAllVimySoldiers()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set up the Music Button
        if let image = UIImage(named: "sound.png") {
            musicButton.setImage(image, for: .normal)
        }
        
        // Start the playing of the song once home view loads
        // Using function in Util.swift
        playMusic(filename: "AppIntro.m4a")
        
        //Change mute button color to blue to show that the music is on
        musicButton.tintColor = UIColor.blue
        toggleMute(button: musicButton)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function **Countdown** with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(HomeViewController.updateCounting), userInfo: nil, repeats: true)
    }
    
    
    func updateCounting(){
        if MyVariables.allSoldiersDownloaded {
            loadingImageView.stopAnimating()
            loadingImageView.isHidden = true
            self.performSegue(withIdentifier: self.segueName, sender: nil)
            timer.invalidate()
            MyVariables().setGlobalSoldier(id: MyVariables.facebookSoldierID)
            //soldierOfHourButton.titleLabel?.text = "Soldier of the Hour: \(MyVariables.globalSoldier.christian_names) \(MyVariables.globalSoldier.surname)"
            soldierOfHourButton.setTitle("Soldier of the Hour: \(MyVariables.globalSoldier.christian_names) \(MyVariables.globalSoldier.surname)", for: UIControlState.normal)
            soldierOfHourButton.sizeToFit()
            
        }
        else {
            //print("Not downloaded yet")
        }
    }
    

    
    func loadAnimation() {
        //creates and stores all the names for the images used in an array
        var imagesNames = ["run1-1.jpg", "run2-1.jpg", "run3-1.jpg", "run4-1.jpg", "run5-1.jpg", "run6-1.jpg", "run7-1.jpg", "run8-1.jpg", "run9-1.jpg", "run10-1.jpg", "run11-1.jpg"]
        
        //create new uiimage array
        var images = [UIImage]()
        
        //loop through all the photos in the imagesNames array and add them to the images array
        for i in 0..<imagesNames.count{
            images.append(UIImage(named: imagesNames[i])!)
        }
        
        //tell testview what images to use for the animation
        loadingImageView.animationImages = images
        
        //tell testview how long to show a single image for
        loadingImageView.animationDuration = 0.9
        
        
        //start the animation in the image view called test view
        loadingImageView.startAnimating()
        loadingImageView.isHidden = false

    }

}

