//
//  ViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 9/30/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Functions
    
    //Buttons
    @IBAction func caseButton(_ sender: UIButton) {
        state = "Case"
        seconds = 240
    }
   
    @IBAction func rebuttalButton(_ sender: UIButton) {
        state = "Rebuttal"
        seconds = 240
    }
  
    @IBAction func crossfireButton(_ sender: UIButton) {
        state = "CrossFire"
        seconds = 180
    }
    
    @IBAction func summaryButton(_ sender: UIButton) {
        state = "Summary"
        seconds = 120
    }
    
    @IBAction func finalfocusButton(_ sender: UIButton) {
        state = "Final Focus"
        seconds = 120
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

