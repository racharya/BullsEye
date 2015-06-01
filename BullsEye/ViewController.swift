//
//  ViewController.swift
//  BullsEye
//
//  Created by Rachana Acharya on 5/16/15.
//  Copyright (c) 2015 Rachana Acharya. All rights reserved.
//

import UIKit

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
        startNewRound()
        updateLabels()
        
        //        currentValue = lroundf(slider.value)
        //        targetValue = 1 + Int(arc4random_uniform(100))//arc4random_uniform generates 0 to 99 so 1 is added to make it 1 to 100
        //        // Do any additional setup after loading the view, typically from a nib.
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
        let points = 100 - difference
        score += points
        let message = "You scored \(points) points"
        //        let message = "The value of the slider is: \(currentValue)" + "\n The target value is:\(targetValue)" +
        //        "\nThe difference is \(difference)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)//lroundf= rounds decimal number to the nearest whole number
    }
    /* Calculates a new random number and then resets the position of the slider */
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber++
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        //above line can be written as: targetLabel.text = "\(targetValue)"
        roundLabel.text = String(roundNumber)
    }
}
