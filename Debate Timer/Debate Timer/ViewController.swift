//
//  ViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 9/30/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import UIKit

//Variables
var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
var timer = Timer()
var timerIsRunning = false
var resumeTapped = false
var resetDisplay = "00:00:00"
var state = "Waiting"
var stateDisplay = "Waiting"

class ViewController: UIViewController {


    //Buttons
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

