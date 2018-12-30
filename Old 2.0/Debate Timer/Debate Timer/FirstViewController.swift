//
//  FirstViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 11/10/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
 var state = "Waiting"

    let SecondViewContoller = SecondViewController()
    

    @IBAction func caseButton(_ sender: UIButton) {
        state = "Case"
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "displayVC")
        self.present(vc, animated:true)
    }
    
    @IBAction func rebuttalButton(_ sender: UIButton) {
        state = "Rebuttal"
    }
    
    @IBAction func crossfireButton(_ sender: UIButton) {
        state = "CrossFire"
    }
    
    @IBAction func summaryButton(_ sender: UIButton) {
        state = "Summary"
    }
    
    @IBAction func finalfocusButton(_ sender: UIButton) {
        state = "Final Focus"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

