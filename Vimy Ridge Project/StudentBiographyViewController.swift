//
//  StudentBiographyViewController.swift
//  Vimy Ridge Project
//
//  Created by Mason Black on 2016-08-28.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit
import WebKit

class StudentBiographyViewController: UIViewController {

    @IBOutlet weak var containerView: UIView! //The UIView in which the webView will be loaded
    @IBOutlet weak var loadingImageView: UIImageView!
    
    //Objects needed for the studentBio portion
    //These are created programmatically rather than within the storyboard due to formatting problems
    var webView: WKWebView? //The webView in which the PDF will be displayed
    var downloadToolbar: UIToolbar? //The toolbar at the bottom of the webView
    var downloadButton: UIBarButtonItem? //The button used to download the PDF
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimation()

        //Setup the webView so it can be loaded in the containerView object
        self.webView = WKWebView()
        self.webView?.frame = self.containerView.frame
        self.webView?.sizeToFit()
        
        //Load the webView in the containerView and hide it for now
        self.containerView = self.webView!
        self.containerView!.isHidden = true
        
        //Setup the toolbar and add it to the containerView with the appropriate dimensions and position
        self.downloadToolbar = UIToolbar()
        self.containerView!.addSubview(self.downloadToolbar!)
        //image.draw(in: CGRectMake(0, 0, newWidth, newHeight))
        //image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        self.downloadToolbar!.frame = CGRect(x: 0, y: self.containerView!.frame.maxY - self.containerView!.frame.minY - 44, width: self.containerView!.frame.width, height: 44)
        self.downloadToolbar!.sizeToFit()
        
        
//        let downloadButton2 = UIBarButtonItem(
//            title: "Download To Device",
//            style: .plain,
//            target: self,
//            action: #selector(StudentBiographyViewController.downloadButtonPressed(sender:))
//        )
        
        //Setup the download button inside the toolbar
        self.downloadButton = UIBarButtonItem()
        self.downloadButton?.title = "Download To Device"
        self.downloadButton?.target = self
        //self.downloadButton?.action = #selector(StudentBiographyViewController.downloadButtonPressed(_:)) //This will call the downloadButtonPressed function when the button is pressed
        self.downloadButton?.action = #selector(StudentBiographyViewController.downloadButtonPressed(sender:))
        //self.downloadButton?.action(self, action: #selector(StudentBiographyViewController.downloadButtonPressed(_:)), forControlEvents: .TouchDown)
        self.downloadToolbar!.items = [self.downloadButton!]
        
        //Add the finalized containerView to the main view
        self.view.addSubview(self.containerView!)
        
        
        //Displays a student made bio in a webView
        
        //Display the containerView containing the webView and toolbar
        self.containerView!.isHidden = false
        containerView.bringSubview(toFront: loadingImageView)
        
        //Create the URL
        let url: NSURL = NSURL(string: "http://lest-we-forget.ca/apis/get_soldier_bio.php?soldier_id=\(MyVariables.facebookSoldierID)&access_code=\(MyVariables.access_code)")!
        
        //Load the URL
        if let _: NSURL = self.webView?.url as NSURL? {
            //The webpage was already loaded, so it doesn't need to be loaded again.
        } else {
            let fileData = NSData(contentsOf: url as URL)
            if let dataString = String(data: fileData as! Data, encoding: String.Encoding.utf8)
            {
                if dataString == "{\"result\":\"No Soldier Bio Found\"}" {
                    let alert = UIAlertController(title: "Sorry!", message: "No soldier biography has been submitted for this soldier yet.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    self.webView!.load(NSURLRequest(url: url as URL) as URLRequest)
                }
            }
            else {
                self.webView!.load(NSURLRequest(url: url as URL) as URLRequest)
            }
            loadingImageView.stopAnimating()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This function is called once the downloadButton is pressed
    func downloadButtonPressed(sender: UIBarButtonItem) {
        //
        //
        //TODO: Detect the file type, considering not all of the files on the database are PDFs
        //
        //This will probably require a new function within the API that returns what the file extension is
        //
        //
        
        print("Biography downloading...")
        
        //Used to read and write files and directories
        let fileManager = FileManager.default
        
        //Designate the URL
        let url: NSURL = NSURL(string: "http://lest-we-forget.ca/apis/get_soldier_bio.php?soldier_id=\(MyVariables.facebookSoldierID)&access_code=\(MyVariables.access_code)")!
        
        //Finds the documents directory on the device
        let documents: NSString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        
        //Try to create the directory 'Documents/LWF'
        var filePath = documents.appendingPathComponent("LWF")
        do {
            try fileManager.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Couldn't create directory \(filePath).")
            return
        }
        
        //Designates the name and location of the file
        //NOTE: At this point it will be saved ONLY as a PDF, creating problems if the file is a DOCX or other; see TODO above.
        //Example: '/Documents/LWF/Mason_Black_55.pdf'
        filePath = documents.appendingPathComponent("LWF/\(MyVariables.globalSoldier.christian_names)_\(MyVariables.globalSoldier.surname)_\(MyVariables.facebookSoldierID).pdf")
        
        //Load the data of the file
        let fileData = NSData(contentsOf: url as URL)
        
        //Try to create the file with the data and test to see if it exists
        fileManager.createFile(atPath: filePath, contents: fileData as Data?, attributes: nil)
        if(fileManager.fileExists(atPath: filePath)) {
            let alert = UIAlertController(title: "Success", message: "Biography successfully downloaded to \(filePath)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Oops!", message: "There was an error in downloading the biography. Please try again later.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
