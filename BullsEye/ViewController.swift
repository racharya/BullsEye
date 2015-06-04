//
//  ViewController.swift
//  BullsEye
//
//  Created by Rachana Acharya on 5/16/15.
//  Copyright (c) 2015 Rachana Acharya. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var currentValue: Int = 0 //currentValue is "Instance Variable"
    var targetValue: Int = 0
    var score = 0 //another way to define and assign Int variable,
    // this time type inference is utilized
    var roundNumber = 0
    
    @IBOutlet weak var slider: UISlider! //instance variable too, outlets
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {// this method happens when the app starts up
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
        //        currentValue = lroundf(slider.value)
        //        targetValue = 1 + Int(arc4random_uniform(100))//arc4random_uniform generates 0 to 99 so 1 is added to make it 1 to 100
        //        // Do any additional setup after loading the view, typically from a nib.
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal,forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft"){
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        
        //option 1
        // var difference: Int
        //        if currentValue > targetValue{
        //            difference = currentValue - targetValue
        //        }else if targetValue > currentValue {
        //            difference = targetValue - currentValue
        //        }else {
        //            difference = 0
        //        }
        
        //Option 2
        //        var difference = currentValue - targetValue // dont need to define and then assign
        //        if(difference < 0){
        //            difference *= -1
        //        }
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        var title = " "
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5 {
            title = "You almost had it!"
            if difference == 1{
                points += 50
            }
        }else if difference < 10{
            title = "Pretty good!"
        }else {
            title = "Not even close"
        }
        
        score += points
        let message = "You scored \(points) points"
        //        let message = "The value of the slider is: \(currentValue)" + "\n The target value is:\(targetValue)" +
        //        "\nThe difference is \(difference)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // handler tells the alert how to dismiss or it is the alert dismissed event
        // if handler is nil meaning nothing happens
        // currently handler has a "closure"= method without a name
        let action = UIAlertAction(title: "OK", style: .Default, handler:
            {
                action in
                self.startNewRound()
                self.updateLabels()
            }
        )
        
        alert.addAction(action)
        
        //making alert visible
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)//lroundf= rounds decimal number to the nearest whole number
    }
    /* Calculates a new random number and then resets the position of the slider */
    func startNewRound(){
        roundNumber++
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func startNewGame(){
        score = 0
        roundNumber = 0
        startNewRound()
    }
    @IBAction func startOver(){
        startNewGame()
        updateLabels()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        //above line can be written as: targetLabel.text = "\(targetValue)"
        roundLabel.text = String(roundNumber)
    }
    
}
