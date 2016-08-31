//
//  Util.swift
//  VimyRidgeMaster
//
//  Created by Tyler McHugh on 2016-06-21.
//  Copyright © 2016 Mason Black. All rights reserved.







//  ** So far the button is only on the home view but it can easily be added to others if         **  \\
//  ** desired by creating a toolbar, item with an image of (sound-on.png) and connecting         **  \\
//  ** an outlet, action after doing so simply call the toggleMute function with the              **  \\
//  ** parameter of thename of the outlet you created inside of the action like in the home view. **  \\

import UIKit
import AVFoundation

// Initialize audio player
var MusicPlayer = AVAudioPlayer()

// Function that sets up the music player with the song and plays it
func playMusic(filename: String) {
    let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
    guard let newURL = url else {
        print("Could not find file: \(filename)")
        return
    }
    do {
        MusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
        MusicPlayer.numberOfLoops = -1
        MusicPlayer.prepareToPlay()
        MusicPlayer.play()
    } catch let error as NSError {
        print(error.description)
    }
}

// Function that toggles the volume of the music
// func toggleMute(button: UIBarButtonItem) {  // Can create a UIBarButtonItem instead of a regular Button to incorporate on the Tab Bar
func toggleMute(button: UIButton) {
    // If the volume is on turn off, vice versa
    if MusicPlayer.volume == 1 {
        MusicPlayer.volume = 0
        // Set button color to grey when muted
        button.tintColor = UIColor.lightGrayColor()
    }
    else {
        MusicPlayer.volume = 1
        // Set button color to blue when on
        button.tintColor = UIColor.blueColor()
    }
}
