//  ViewController.swift
//  SingleBatt.ViewUI-DRAFT
//
//  Created by Student on 2016-05-10.
//  Copyright © 2016 Student. All rights reserved.
//
import Foundation
import UIKit

class BattalionMoreContainer: UIViewController {
    
    
    @IBOutlet var WebViewMore: UIWebView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "http://www.bac-lac.gc.ca/eng/discover/military-heritage/first-world-war/Documents/infantry%20battalions.pdf");
        //This section generates a website to displayed in the WebViewMore.
        let requestObj = NSURLRequest(url: url! as URL);
        WebViewMore.loadRequest(requestObj as URLRequest);
        

        // *** Attempting to store pdf for use later on
//        if let pdfData = NSData(contentsOfURL: url) {
//            let resourceDocPath = NSHomeDirectory().stringByAppendingString("/Documents/yourPDF.pdf")
//            unlink(resourceDocPath)
//            pdfData.writeToFile(resourceDocPath, atomically: true)
//        }
    }
    
    func webViewDidStartLoad(_ :UIWebView){
    
        //activity.startAnimating()
        print("Webview load has started")
    
    }
    
    func webViewDidFinishLoad(_ :UIWebView){
    
        //CGFloat pageHeight = self.WebViewMore.scrollView.contentSize.height;
        
        
        
        let selectedPag: CGFloat = 5; // i.e. Go to page 5
        
        let pageHeight: CGFloat = 792.0; // i.e. Height of PDF page = 1000 px;
        
        let y: CGFloat = pageHeight * selectedPag;
        
        let pageOffset = CGPoint(x: 0, y: y)
        WebViewMore.scrollView.setContentOffset(pageOffset, animated: true)
       // activity.stopAnimating()
        print("Webview load had finished")
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
