//
//  ViewController.swift
//  retroCalculations
//
//  Created by Szi Gabor on 3/30/17.
//  Copyright © 2017 Szi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var buttonSound: AVAudioPlayer!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOf: soundURL)
        } catch let error as NSError {
            print( (error.debugDescription))
        }
    }
    
    @IBAction func numberPressed(sender: UIButton){
        
        playSound()
        
    }
    
    func playSound()
    {
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        
        buttonSound.play()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

