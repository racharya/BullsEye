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
    @IBOutlet weak var slider: UISlider! //instance variable too, outlets
    
    override func viewDidLoad() {// this method happens when the app starts up
        super.viewDidLoad()
        startNewRound()
        
//        currentValue = lroundf(slider.value)
//        targetValue = 1 + Int(arc4random_uniform(100))//arc4random_uniform generates 0 to 99 so 1 is added to make it 1 to 100
//        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentValue)" + "\n The target value is:\(targetValue)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    
    alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(slider: UISlider){
       currentValue = lroundf(slider.value)//lroundf= rounds decimal number to the nearest whole number
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    }
