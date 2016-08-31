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
        let url = NSURL (string: "https://en.wikipedia.org/wiki/Battle_of_Vimy_Ridge_order_of_battle");
        //This section generates a website to displayed in the WebViewMore.
        let requestObj = NSURLRequest(URL: url!);
        WebViewMore.loadRequest(requestObj);
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}