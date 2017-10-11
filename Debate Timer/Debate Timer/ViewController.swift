//
//  ViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 9/30/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var timerIsRunning = false
    var resumeTapped = false
    var resetDisplay = "00:00:00"
    
    @IBOutlet weak var timeDisplay: UILabel!
   
    @IBAction func caseButton(_ sender: Any) {
        if timerIsRunning == false {
            seconds = 240
            runTimer()
        }
        else {
            //reset timer set time then run
            resetTimer()
            seconds = 240
            runTimer()
        }
    }
    
    @IBAction func rebutalButton(_ sender: Any) {
        if timerIsRunning == false {
            seconds = 240
            runTimer()
        }
        else {
            //reset timer set time then run
            resetTimer()
            seconds = 240
            runTimer()
        }
    }
    
    @IBAction func crossfireButton(_ sender: Any) {
        if timerIsRunning == false {
            seconds = 180
            runTimer()
        }
        else {
            //reset timer set time then run
            resetTimer()
            seconds = 180
            runTimer()
        }
    }
    
    @IBAction func summaryButton(_ sender: Any) {
        if timerIsRunning == false {
            seconds = 120
            runTimer()
        }
        else {
            //reset timer set time then run
            resetTimer()
            seconds = 120
            runTimer()
        }
    }
    
    @IBAction func finalfocusButton(_ sender: Any) {
        if timerIsRunning == false {
            seconds = 120
            runTimer()
        }
        else {
            //reset timer set time then run
            resetTimer()
            seconds = 120
            runTimer()
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            self.pauseButtonOutlet.setTitle("Resume", for: .normal)
        }
        else {
            runTimer()
            self.resumeTapped = false
            self.pauseButtonOutlet.setTitle("Pause", for: .normal)
        }
    }
    
    @IBOutlet weak var pauseButtonOutlet: UIButton!
    
    @IBAction func resetButton(_ sender: Any) {
        resetTimer()
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        
        timerIsRunning = true
    }
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //send alert to inicate timer is up
        }
        else {
            seconds -= 1 //This will count down seconds.
            timeDisplay.text = timeString(time: TimeInterval(seconds)) //This will update the label.
        }
    }
    func resetTimer() {
        timer.invalidate()
        //Reset all variables.
        
        timerIsRunning = false
        resumeTapped = false
        resetDisplay = "00:00:00"
        timeDisplay.text = resetDisplay
    }
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    //This will set the Navagation Bar to the new type in iOS 11.
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

