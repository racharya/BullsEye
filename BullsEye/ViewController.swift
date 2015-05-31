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
    @IBOutlet weak var slider: UISlider! //instance variable too, outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentValue)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    
    alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoved(slider: UISlider){
       currentValue = lroundf(slider.value)//lroundf= rounds decimal number to the nearest whole number
    }
    
    }
