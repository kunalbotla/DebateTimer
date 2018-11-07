//
//  ViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 9/26/18.
//  Copyright © 2018 Kunal Botla. All rights reserved.
//

import UIKit

var speech = "nil"

class ViewController: UIViewController {
    
    @IBOutlet weak var navbarHome: UINavigationBar!
    
    @IBAction func buttonReset(_ sender: Any) {
    }
    
    @IBAction func buttonCase(_ sender: Any) {
        speech = "Case"
    }
    
    @IBAction func buttonRebuttal(_ sender: Any) {
        speech = "Rebuttal"
    }
    
    @IBAction func buttonCrossFire(_ sender: Any) {
        speech = "Cross Fire"
    }
    
    @IBAction func buttonSummary(_ sender: Any) {
        speech = "Summary"
    }
    
    @IBAction func buttonFinalFocus(_ sender: Any) {
        speech = "Final Focus"
    }
    
    @IBAction func buttonProPrep(_ sender: Any) {
        speech = "Pro Prep"
    }
    
    @IBOutlet weak var labelProPrep: UILabel!
    
    @IBAction func buttonConPrep(_ sender: Any) {
        speech "Con Prep"
    }
    
    @IBOutlet weak var labelConPrep: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

