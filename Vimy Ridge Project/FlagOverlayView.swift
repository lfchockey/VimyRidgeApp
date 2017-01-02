//
//  CustomOverlayView.swift
//  ScaleImageTest
//
//  Created by SFDCI on 11/29/16.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import UIKit
import MapKit

// This adds an image to the overlay so that uses the size of the screen to draw it
class FlagOverlayView: MKOverlayRenderer {
    var overlayImage: UIImage
    
    init(overlay:MKOverlay, overlayImage:UIImage) {
        self.overlayImage = overlayImage
        super.init(overlay: overlay)
    }
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        let imageReference = overlayImage.cgImage
        
        let theMapRect = overlay.boundingMapRect
        let theRect = rect(for: theMapRect)
        
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -theRect.size.height)
        context.draw(imageReference!, in: theRect)
    }
}

