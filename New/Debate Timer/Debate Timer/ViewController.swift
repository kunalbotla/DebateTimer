//
//  ViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 9/26/18.
//  Copyright © 2018 Kunal Botla. All rights reserved.
//

import UIKit

var speech = "nil"
var proPrepTime = 120
var conPrepTime = 120
var prepRefresh = false
var nsdaNewTime = false



class ViewController: UIViewController {
    
    
    func timeString(time:TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func updatePrep() {
        labelProPrep.text =  timeString(time: TimeInterval(proPrepTime)) //Label update
        labelConPrep.text =  timeString(time: TimeInterval(conPrepTime)) //Label update
    }
    
    func fullResetConfirm() {
        print("resetRequest")
        
        let alert = UIAlertController(title: "Do you want to reset prep time?", message: "This is not reverseable.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "Default action"), style: .destructive, handler: { _ in
            print("resetAccepted")
            self.fullReset()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: "Default action"), style: .cancel, handler: { _ in
            print("resetRejected")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func fullReset() {
        speech = "nil"
        nsdaTimeChange()
        updatePrep()
    }
    
    func nsdaTimeChange() {
        if nsdaNewTime == false {
            labelProPrep.text = "00:02:00"
            labelConPrep.text = "00:02:00"
            proPrepTime = 120
            conPrepTime = 120
        } else if nsdaNewTime == true {
            labelProPrep.text = "00:03:00"
            labelConPrep.text = "00:03:00"
            proPrepTime = 180
            conPrepTime = 180
        }
    }
    
    func segmentedControlTimeChange() {
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            nsdaNewTime = false
            nsdaTimeChange()
            
        case 1:
            nsdaNewTime = true
            nsdaTimeChange()
        
        default:
            break
        }
    }
    //if prepRefresh = true {
    //    updatePrep()
    //    prepRefresh = false
    //}
    
    @IBOutlet weak var navbarHome: UINavigationBar!
    
    @IBAction func buttonReset(_ sender: Any) {
        fullResetConfirm()
    }

    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        segmentedControlTimeChange()
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
        speech = "Con Prep"
    }
    
    @IBOutlet weak var labelConPrep: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//Added By Kunal Botla - Start
        updatePrep()
        print("ViewDidLoad Running")
//Added By Kunal Botla - End
        // Do any additional setup after loading the view, typically from a nib.
    }


}

