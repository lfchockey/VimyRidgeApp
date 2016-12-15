//
//  ViewController.swift
//  Vimy
//
//  Created by Student on 2016-04-26.
//  Copyright © 2016 Student. All rights reserved.
//



/////light images to 40

import UIKit

class VimyVirtualMemorialVC: UIViewController {

    var testAnimation = 1
    var count = 0
    var buttions = [String]()
    
    var totalSoldiersAtTime = 0
    
    var allSoldiersAtTime = [JSON]()
    
    var pageNumber = 0
    
    let numberOfSoldiersPerPage = 12
    
    var numOfPages: Int = 0
    
    var leftOver = 0
    
    var finalSoldierArray: [SoldierInfo] = []
    
    var yourArray = [String]()
    var imagesSWipe = ["image"]
    
    var stopAnimation = false
    
    @IBOutlet weak var ClickAnimation: UIImageView!
    @IBOutlet weak var swipeAnimation: UIImageView!
    
    @IBOutlet weak var PageNumLabel: UILabel!
    var emptySoldier = "Known Unto God"
    
    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var btn3: UIButton!
   
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var label: UILabel!
   
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var btn5: UIButton!
    
    
    @IBOutlet weak var btn6: UIButton!
    
    @IBOutlet weak var btn7: UIButton!
    
    @IBOutlet weak var btn8: UIButton!
    
    @IBOutlet weak var btn9: UIButton!
    
    @IBOutlet weak var btn10: UIButton!
    
    @IBOutlet weak var btn11: UIButton!
    
    @IBOutlet weak var btn12: UIButton!
    
    
    
    
// the code for if the button is pressed first it checks if the text of the button is nil or if it takes the spaces out of the button text 
//and the button text is = to "" don't do anything this soldier is empty if it 
//is not empty it then performes the segue to the soldiers facebook page
    
    @IBAction func btnAction(_ sender: UIButton)
    {
   
        if(btn.currentTitle == emptySoldier || btn.currentTitle == nil){
       // print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].soldier_id)")
        }
        else
        {
        MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage].soldier_id)
            
        self.performSegue(withIdentifier: "FacebookSegue", sender: self)
       //    print(btn.currentTitle)
            
        
        }
    }
    
    
    
    @IBAction func btn2Action(_ sender: UIButton)
    {
        
        if(btn2.currentTitle == emptySoldier || btn2.currentTitle == nil){
            //print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
           // print(btn2.currentTitle)
            
            
        }
    
    
    
    
    }
    
    
    
    
    @IBAction func btn3Action(_ sender: UIButton)
    {
    
        
        if(btn3.currentTitle == emptySoldier || btn3.currentTitle == nil){
            
       // print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].soldier_id)")
        
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
           // print(btn3.currentTitle)
            
            
        }
    
    
    
    }
    
    
    @IBAction func btn4Action(_ sender: UIButton)
    {
    
        
        if(btn4.currentTitle == emptySoldier || btn4.currentTitle == nil){
            //print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
           // print(btn4.currentTitle)
            
            
        }
    
    
    
    }
    
    
    
    
    @IBAction func btn5Action(_ sender: UIButton)
    {
    
        
        if(btn5.currentTitle == emptySoldier || btn5.currentTitle == nil){
            
       //print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
           // print(btn5.currentTitle)
            
            
        }
    
    
    
    }
    
    
    
    
    @IBAction func btn6Action(_ sender: UIButton)
    {
    
     
        if(btn6.currentTitle == emptySoldier || btn6.currentTitle == nil){
           // print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
           // print(btn6.currentTitle)
           
            
            
        }
    
    
    
    }
    
    
    
    @IBAction func btn7Action(_ sender: UIButton)
    {
    
        
        if(btn7.currentTitle == emptySoldier || btn7.currentTitle == nil){
          // print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
            //print(btn7.currentTitle)
            
            
        }
    
    
    }
    
    
    @IBAction func btn8Action(_ sender: UIButton)
    {
   
        
        if(btn8.currentTitle == emptySoldier ||   btn8.currentTitle == nil){
        //print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].soldier_id)
           
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
           // print(btn8.currentTitle)
            
            
        }
    
    }
    
    
    
    @IBAction func btn9Action(_ sender: UIButton)
    {
        
        if(btn9.currentTitle == emptySoldier || btn9.currentTitle == nil){
           //print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
            //print(btn9.currentTitle)
            
            
        }
    
    
    
    
    }
    
    
    
    
    
    @IBAction func btn10Action(_ sender: UIButton)
    {
        
        if(btn10.currentTitle == emptySoldier || btn10.currentTitle == nil){
           // print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
            //print(btn10.currentTitle)
            
            
        }
    
    
    
    
    }
    
    
    @IBAction func btn11Action(_ sender: UIButton)
    {
    
        
        if(btn11.currentTitle == emptySoldier || btn11.currentTitle == nil){
            //print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
           // print(btn11.currentTitle)
            
            
        }
    
    
    }
    
    
    
    @IBAction func btn12Action(_ sender: UIButton)
    {
    
        
        if(btn12.currentTitle == emptySoldier || btn12.currentTitle == nil){
            //print("soldier number = \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].soldier_id)")
        }
        else
        {
            MyVariables.facebookSoldierID = String(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 11].soldier_id)
            
            self.performSegue(withIdentifier: "FacebookSegue", sender: self)
          //  print(btn12.currentTitle)
            
            
        }
    
    
    
    }
    
    @IBAction func info(_ sender: UIButton)
    {
        swipeAnimation.isHidden = false
        //ClickAnimation.isHidden = false
        loadSwipeAnimation()
        //loadClickAnimation()
    
    }
    
   
    
    func loadClickAnimation()
    {
        
        
        //creates and stores all the names for the images used in an array
        var ClickimagesNames = ["buttonClick1.png", "buttonClick2.png", "buttonClick3.png", "buttonClick4.png", "buttonClick5.png", "buttonClick6.png", "buttonClick7.png", "buttonClick8.png", "buttonClick9.png"]
        
        //create new uiimage array
        var Clickimages = [UIImage]()
        
        //loop through all the photos in the imagesNames array and add them to the images array
        for i in 0..<ClickimagesNames.count
        {
            Clickimages.append(UIImage(named: ClickimagesNames[i])!)
        }
        
        
        //tell testview what images to use for the animation
            ClickAnimation.animationImages = Clickimages
        
        //tell testview how long to show a single image for
            ClickAnimation.animationDuration = 0.7
        
            ClickAnimation.animationRepeatCount = 2
        //start the animation in the image view called test view
            ClickAnimation.startAnimating()
        
            scheduledTimerWithTimeInterval2()
        
        
    }

        var timer2 = Timer()
    
   
    func scheduledTimerWithTimeInterval2()
    {
        // Scheduling timer to Call the function **Countdown** with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(VimyVirtualMemorialVC.updateCounting2), userInfo: nil, repeats: false)
    }
    
    
    func updateCounting2()
    {
    ClickAnimation.isHidden = true
    }
    
    
    
 
    func loadSwipeAnimation()
    {
        
        //creates and stores all the names for the images used in an array
        var SwipeimagesNames = ["animationSwipe1Good.png", "animationSwipe2Good.png", "animationSwipe3Good.png", "animationSwipe4Good.png", "animationSwipe5Good.png", "animationSwipe6Good.png", "animationSwipe7Good.png", "animationSwipe8Good.png", "animationSwipe9Good.png", "animationSwipe10Good.png", "animationSwipe11Good.jpg","animationSwipe12Good.jpg"]
        
        //create new uiimage array
        var Swipeimages = [UIImage]()
        
        //loop through all the photos in the imagesNames array and add them to the images array
        for i in 0..<SwipeimagesNames.count
        {
            Swipeimages.append(UIImage(named: SwipeimagesNames[i])!)
        }
        
        
        //tell testview what images to use for the animation
            swipeAnimation.animationImages = Swipeimages
        
        //tell testview how long to show a single image for
            swipeAnimation.animationDuration = 1.2
        
            swipeAnimation.animationRepeatCount = 2
        //start the animation in the image view called test view
            swipeAnimation.startAnimating()
        
            scheduledTimerWithTimeInterval()
      
        
    }

   
    var timer = Timer()
    
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function **Countdown** with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 2.8, target: self, selector: #selector(VimyVirtualMemorialVC.updateCounting), userInfo: nil, repeats: false)
    }
   
    
    func updateCounting()
    {
    
        swipeAnimation.isHidden = true
        ClickAnimation.isHidden = false
        loadClickAnimation()
    }
    
    func  printSoldiersOnButtons()
    {
        
        let btnArray = [btn, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, btn10, btn11, btn12]
      // var info = "\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + count].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + count].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + count].surname)"

        
        for button in btnArray
        {
            let info = "\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + count].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + count].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + count].surname)"
            
            //print(count)
            button?.setTitle(info, for: UIControlState.normal)
            //print(info)
            if(button?.currentTitle?.trimmingCharacters(in: CharacterSet.whitespaces) == "")
            {
            
                button?.setTitle(emptySoldier, for: UIControlState.normal)
            
            }
            count += 1
            //  print(count)
              if(count == 12)
               {
            
                  count = 0
            
               }
        
        }
    
    
    }
    
  

    

    
    
    override func viewDidLoad()
{
        
        super.viewDidLoad()
        
        
        totalSoldiersAtTime = MyVariables.allVimySoldiers.count
        
        print("total = \(totalSoldiersAtTime)")
        
        // this sets the number of pages
        
        numOfPages = Int(ceil(Float(MyVariables.allVimySoldiers.count) / Float(numberOfSoldiersPerPage)))
        
        print(" number of pages \(numOfPages)")
        
        for soldier in MyVariables.allVimySoldiers
        {
            
            let s = SoldierInfo(newSoldier_id: soldier.soldier_id, newSurname: soldier.surname, newChristian_names: soldier.christian_names, newRank_highest_achieved: soldier.rank_highest_achieved, newDate_of_birth: soldier.date_of_birth, newDate_of_death: soldier.date_of_death  )
            
            
            finalSoldierArray.append(s)
            
        }
        
         printSoldiersOnButtons()
       
       // loadSwipeAnimation()
   
        
        
        // this checks to see if you have opend the app befor and based on that it will do different things when you run the app
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    
        if launchedBefore
        {
            print("Not first launch.")
            swipeAnimation.isHidden = true
            ClickAnimation.isHidden = true
        }
        
        else
        {
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
             loadSwipeAnimation()
            //loadClickAnimation()
            ClickAnimation.isHidden = true
            
        }
        
    
        
        
        //this code sets up your swipe gestures
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:#selector(VimyVirtualMemorialVC.swiped(gesture:)))
        
        swipeRight.direction = .right
        
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:#selector(VimyVirtualMemorialVC.swiped(gesture:)))
        
        swipeLeft.direction = .left
        
        self.view.addGestureRecognizer(swipeLeft)
        
        // this sets the name of your buttons baced on the page number and soldiers per page
        
        leftOver = MyVariables.allVimySoldiers.count % numberOfSoldiersPerPage;
        
        print("left over \(leftOver)")
        
       
        
        print(MyVariables.globalSoldier.christian_names)
        
        
        print("left over \(leftOver)")
        
      
        
        print("\(finalSoldierArray[1 * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[1 * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[1 * numberOfSoldiersPerPage + 7].surname)")
    
        print(finalSoldierArray[1 * numberOfSoldiersPerPage + 7].soldier_id)

        self.PageNumLabel.text = String(pageNumber + 1)
        
}
    
    override func didReceiveMemoryWarning()
    {
        
        // super.didReceiveMemoryWarning()
        
    }
    
    func swiped(gesture: UISwipeGestureRecognizer)
{
        
        //this is just making sure the user swipes
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            
            //dependent on the direction of the swipe the soldiers names will change
            
            switch swipeGesture.direction
            {
                
                case UISwipeGestureRecognizerDirection.right:
                
                // this subtracts one from the page number variable
                
                pageNumber -= 1
                
                //print(pageNumber)
                
                //if the page number gets less than 0 it resets it to the last "page" of names baced on the aray from the databace
                
                if(pageNumber <= -1)
                {
                    
                    pageNumber = numOfPages - 1
                    
                    print("i reset to last page")
                    
                }
                
                self.PageNumLabel.text = String(pageNumber + 1)
                
                
                
                if(pageNumber == numOfPages - 1)
                {
                    switch leftOver
                 {
                    
                    case 1:
                    
                        btn.setTitle("\(finalSoldierArray[numOfPages * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[numOfPages * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[numOfPages * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle(nil, for: UIControlState.normal)
                    
                        btn3.setTitle(nil, for: UIControlState.normal)
                    
                        btn4.setTitle(nil, for: UIControlState.normal)
                    
                        btn5.setTitle(nil, for: UIControlState.normal)
                    
                        btn6.setTitle(nil, for: UIControlState.normal)
                        
                        btn7.setTitle(nil, for: UIControlState.normal)
                    
                        btn8.setTitle(nil, for: UIControlState.normal)
                    
                        btn9.setTitle(nil, for: UIControlState.normal)
                    
                        btn10.setTitle(nil, for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 2:
                    
                        btn.setTitle( "\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber  * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle(nil, for: UIControlState.normal)
                    
                        btn4.setTitle(nil, for: UIControlState.normal)
                    
                        btn5.setTitle(nil, for: UIControlState.normal)
                        
                        btn6.setTitle(nil, for: UIControlState.normal)
                    
                        btn7.setTitle(nil, for: UIControlState.normal)
                    
                        btn8.setTitle(nil, for: UIControlState.normal)
                    
                        btn9.setTitle(nil, for: UIControlState.normal)
                    
                        btn10.setTitle(nil, for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 3:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                        btn4.setTitle(nil, for: UIControlState.normal)
                        
                        btn5.setTitle(nil, for: UIControlState.normal)
                    
                        btn6.setTitle(nil, for: UIControlState.normal)
                    
                        btn7.setTitle(nil, for: UIControlState.normal)
                    
                        btn8.setTitle(nil, for: UIControlState.normal)
                    
                        btn9.setTitle(nil, for: UIControlState.normal)
                    
                        btn10.setTitle(nil, for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 4:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                        btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                        btn5.setTitle(nil, for: UIControlState.normal)
                    
                        btn6.setTitle(nil, for: UIControlState.normal)
                    
                        btn7.setTitle(nil, for: UIControlState.normal)
                    
                        btn8.setTitle(nil, for: UIControlState.normal)
                    
                        btn9.setTitle(nil, for: UIControlState.normal)
                    
                        btn10.setTitle(nil, for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 5:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                        btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                        btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                        btn6.setTitle(nil, for: UIControlState.normal)
                    
                        btn7.setTitle(nil, for: UIControlState.normal)
                    
                        btn8.setTitle(nil, for: UIControlState.normal)
                    
                        btn9.setTitle(nil, for: UIControlState.normal)
                        
                        btn10.setTitle(nil, for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 6:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                        btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                        btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                        btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                        btn7.setTitle(nil, for: UIControlState.normal)
                    
                        btn8.setTitle(nil, for: UIControlState.normal)
                    
                        btn9.setTitle(nil, for: UIControlState.normal)
                    
                        btn10.setTitle(nil, for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 7:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                        btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                        btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                        btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                        btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                        btn8.setTitle(nil, for: UIControlState.normal)
                    
                        btn9.setTitle(nil, for: UIControlState.normal)
                    
                        btn10.setTitle(nil, for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 8:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                        btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                        btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                        
                        btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                        btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                        btn8.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname)", for: UIControlState.normal)
                    
                        btn9.setTitle(nil, for: UIControlState.normal)
                        
                        btn10.setTitle(nil, for: UIControlState.normal)
                        
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 9:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                        btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                        btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                        btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                        btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                        btn8.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname)", for: UIControlState.normal)
                    
                        btn9.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname)", for: UIControlState.normal)
                
                        btn10.setTitle(nil, for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 10:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                        btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                        btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                        btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                        btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                        btn8.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname)", for: UIControlState.normal)
                    
                        btn9.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname)", for: UIControlState.normal)
                    
                    
                        btn10.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname)", for: UIControlState.normal)
                    
                        btn11.setTitle(nil, for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 11:
                    
                        btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                        btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                        btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                        
                        btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                        btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                        btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                        btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                        btn8.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname)", for: UIControlState.normal)
                    
                        btn9.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname)", for: UIControlState.normal)
                    
                    
                        btn10.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname)", for: UIControlState.normal)
                    
                        btn11.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].surname)", for: UIControlState.normal)
                    
                        btn12.setTitle(nil, for: UIControlState.normal)
                    
                    case 0:
                    
                        printSoldiersOnButtons()
                    
                    default:
                    
                        printSoldiersOnButtons()
                    
                }
            }
                
                else{
                
                printSoldiersOnButtons()
                }
                
            case UISwipeGestureRecognizerDirection.left:
                
                // this adds one to the page number variable
                
                pageNumber += 1
                
                //print(pageNumber)
                
                //if the page number gets to the last page it resets it to 0
                
                if(pageNumber > numOfPages - 1){
                    
                    pageNumber = 0
                    
                    print("i reset to 0")
                    
                }
                
                self.PageNumLabel.text = String(pageNumber + 1)
                
                //this sets the lable to the current page number
                
                //    self.label.text = String(pageNumber)
                if (pageNumber == numOfPages - 1){
                switch leftOver {
                    
                case 1:
                    
                    btn.setTitle("\(finalSoldierArray[numOfPages * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[numOfPages * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[numOfPages * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle(nil, for: UIControlState.normal)
                    
                    btn3.setTitle(nil, for: UIControlState.normal)
                    
                    btn4.setTitle(nil, for: UIControlState.normal)
                    
                    btn5.setTitle(nil, for: UIControlState.normal)
                    
                    btn6.setTitle(nil, for: UIControlState.normal)
                    
                    btn7.setTitle(nil, for: UIControlState.normal)
                    
                    btn8.setTitle(nil, for: UIControlState.normal)
                    
                    btn9.setTitle(nil, for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 2:
                    
                    btn.setTitle( "\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber  * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle(nil, for: UIControlState.normal)
                    
                    btn4.setTitle(nil, for: UIControlState.normal)
                    
                    btn5.setTitle(nil, for: UIControlState.normal)
                    
                    btn6.setTitle(nil, for: UIControlState.normal)
                    
                    btn7.setTitle(nil, for: UIControlState.normal)
                    
                    btn8.setTitle(nil, for: UIControlState.normal)
                    
                    btn9.setTitle(nil, for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 3:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle(nil, for: UIControlState.normal)
                    
                    btn5.setTitle(nil, for: UIControlState.normal)
                    
                    btn6.setTitle(nil, for: UIControlState.normal)
                    
                    btn7.setTitle(nil, for: UIControlState.normal)
                    
                    btn8.setTitle(nil, for: UIControlState.normal)
                    
                    btn9.setTitle(nil, for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 4:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                    btn5.setTitle(nil, for: UIControlState.normal)
                    
                    btn6.setTitle(nil, for: UIControlState.normal)
                    
                    btn7.setTitle(nil, for: UIControlState.normal)
                    
                    btn8.setTitle(nil, for: UIControlState.normal)
                    
                    btn9.setTitle(nil, for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 5:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                    btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                    btn6.setTitle(nil, for: UIControlState.normal)
                    
                    btn7.setTitle(nil, for: UIControlState.normal)
                    
                    btn8.setTitle(nil, for: UIControlState.normal)
                    
                    btn9.setTitle(nil, for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 6:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                    btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                    btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                    btn7.setTitle(nil, for: UIControlState.normal)
                    
                    btn8.setTitle(nil, for: UIControlState.normal)
                    
                    btn9.setTitle(nil, for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 7:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                    btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                    btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                    btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                    btn8.setTitle(nil, for: UIControlState.normal)
                    
                    btn9.setTitle(nil, for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 8:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                    btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                    btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                    btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                    btn8.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname)", for: UIControlState.normal)
                    
                    btn9.setTitle(nil, for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 9:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                    btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                    btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                    btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                    btn8.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname)", for: UIControlState.normal)
                    
                    btn9.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname)", for: UIControlState.normal)
                    
                    btn10.setTitle(nil, for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 10:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                    btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                    btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                    btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                    btn8.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname)", for: UIControlState.normal)
                    
                    btn9.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname)", for: UIControlState.normal)
                    
                    
                    btn10.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname)", for: UIControlState.normal)
                    
                    btn11.setTitle(nil, for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                    
                case 11:
                    
                    btn.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 0].surname)", for: UIControlState.normal)
                    
                    btn2.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 1].surname)", for: UIControlState.normal)
                    
                    btn3.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 2].surname)", for: UIControlState.normal)
                    
                    btn4.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 3].surname)", for: UIControlState.normal)
                    
                    btn5.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 4].surname)", for: UIControlState.normal)
                    
                    btn6.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 5].surname)", for: UIControlState.normal)
                    
                    btn7.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 6].surname)", for: UIControlState.normal)
                    
                    btn8.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 7].surname)", for: UIControlState.normal)
                    
                    btn9.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].surname)", for: UIControlState.normal)
                    
                    
                    btn10.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 8].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 9].surname)", for: UIControlState.normal)
                    
                    btn11.setTitle("\(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].rank_highest_achieved) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].christian_names) \(finalSoldierArray[pageNumber * numberOfSoldiersPerPage + 10].surname)", for: UIControlState.normal)
                    
                    btn12.setTitle(nil, for: UIControlState.normal)
                case 0:
                    
                    printSoldiersOnButtons()
                    
                default:
                    
                    printSoldiersOnButtons()
                    
                }
            }
                else{
                
                    
                    printSoldiersOnButtons()
                    
                }
                
            default:
                
                print("not working")
                
            }
            
        } //if buttton is clicked it finds the soldier ID of the soldier's name that was presses and then changes the facebookSoldierID to the ID while moving to the facebook view controler witch will then show the soldiers info
        
        // the if statment just says if there is no string value of the button if it is clicked do not move view controlers. if the if statment was not there end the empty button was pressed it would crash the program
        
}
    
    
    
    
    
    
    // this sets up an object to hold the parts of the soldiers info from the json array that is to be displayed on there button along with there soldier id number
    
    
    class SoldierInfo {
        
        // These are the class properties used to define unique objects
        
        var soldier_id: String
        
        var surname: String
        
        var christian_names: String
        
        var rank_highest_achieved: String
        
        var date_of_birth: String
        
        var date_of_death: String
        
        init(newSoldier_id: String, newSurname: String, newChristian_names: String, newRank_highest_achieved: String, newDate_of_birth: String, newDate_of_death: String){
            
            self.soldier_id = newSoldier_id
            
            self.surname = newSurname
            
            self.christian_names = newChristian_names
            
            self.rank_highest_achieved = newRank_highest_achieved
            
            self.date_of_birth = newDate_of_birth
            
            self.date_of_death = newDate_of_death

            
        }
        
    }
    
    
}
            
            
            
            
            
            
            
            
            
            


