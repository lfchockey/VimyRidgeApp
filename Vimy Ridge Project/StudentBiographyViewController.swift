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
    
    //Objects needed for the studentBio portion
    //These are created programmatically rather than within the storyboard due to formatting problems
    var webView: WKWebView? //The webView in which the PDF will be displayed
    var downloadToolbar: UIToolbar? //The toolbar at the bottom of the webView
    var downloadButton: UIBarButtonItem? //The button used to download the PDF
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        //Setup the download button inside the toolbar
        self.downloadButton = UIBarButtonItem()
        self.downloadButton?.title = "Download To Device"
        self.downloadButton?.target = self
        //self.downloadButton?.action = #selector(StudentBiographyViewController.downloadButtonPressed(_:)) //This will call the downloadButtonPressed function when the button is pressed
        self.downloadButton?.action(self, action: #selector(StudentBiographyViewController.downloadButtonPressed(_:)), forControlEvents: .TouchDown)
        self.downloadToolbar!.items = [self.downloadButton!]
        
        //Add the finalized containerView to the main view
        self.view.addSubview(self.containerView!)
        
        
        //Displays a student made bio in a webView
        
        //Display the containerView containing the webView and toolbar
        self.containerView!.isHidden = false
        
        //Create the URL
        let url: NSURL = NSURL(string: "http://lest-we-forget.ca/apis/get_soldier_bio.php?soldier_id=\(MyVariables.facebookSoldierID)&access_code=\(MyVariables.access_code)")!
        
        //Load the URL
        if let _: NSURL = self.webView?.url as NSURL? {
            //The webpage was already loaded, so it doesn't need to be loaded again.
        } else {
            self.webView!.load(NSURLRequest(url: url as URL) as URLRequest)
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
            print("Biography download succeeded! Saved to \(filePath)")
        } else {
            print("Biography download failed")
        }
    }



}
