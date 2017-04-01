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
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var result = ""
    
    enum Operation: String {
        
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
        
    }
    

    @IBOutlet weak var outPutLabel: UILabel!
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
        
        
        runningNumber += "\(sender.tag)"
        
        outPutLabel.text = runningNumber
        
    }
    
    @IBAction func dividePressed(sender: AnyObject){
        processOperation(operation: .Divide)
    }
    
    @IBAction func multiplyPressed(sender: AnyObject){
        processOperation(operation: .Multiply)
        
    }
    
    @IBAction func addPressed(sender: AnyObject){
        processOperation(operation: .Add)
        
    }
    
    @IBAction func subtractPressed(sender: AnyObject){
        processOperation(operation: .Subtract)
        
    }
    
    @IBAction func equalPressed(sender: AnyObject){
        processOperation(operation: currentOperation)
        
    }
    
    func playSound()
    {
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        
        buttonSound.play()
        
    }
    
    func processOperation(operation:Operation){
        
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                rightValueString = runningNumber
                 runningNumber = ""
                
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftValueString)! * Double(rightValueString)!)"
                } else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValueString)! / Double(rightValueString)!)"
                } else if currentOperation == Operation.Add{
                    result = "\(Double(leftValueString)! + Double(rightValueString)!)"
                }else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValueString)! - Double(rightValueString)!)"
                }
                
                leftValueString = result
                outPutLabel.text = result
            }
         
            currentOperation = operation
        } else {
            leftValueString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

