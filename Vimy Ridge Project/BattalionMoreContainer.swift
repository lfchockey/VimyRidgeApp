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

        if let pdfURL = Bundle.main.url(forResource: "InfantryBattalions", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                
                WebViewMore.load(data, mimeType: "application/pdf", textEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                
            }
            catch {
                // catch errors here
            }
            
        }

    }
    

    
    func webViewDidFinishLoad(_ :UIWebView){
    
        let documentHeight = self.WebViewMore.scrollView.contentSize.height;
        
        let selectedPag: CGFloat = 50 // i.e. Go to page 5
        
        let pageHeight: CGFloat = documentHeight / 737 // i.e. Height of PDF page = 1000 px;
        
        let y: CGFloat = pageHeight * (selectedPag - 1)
        
        let pageOffset = CGPoint(x: 0, y: y)
        WebViewMore.scrollView.setContentOffset(pageOffset, animated: true)

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}
