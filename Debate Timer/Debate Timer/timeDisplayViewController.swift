//
//  timeDisplayViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 10/17/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import UIKit

//Global Variables
var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
var timer = Timer()
var timerIsRunning = false
var resumeTapped = false
var resetDisplay = "00:00:00"
var state = "Waiting"
var stateName = "Waiting"

class timeDisplayViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var timeDisplay: UILabel!
    
    @IBOutlet weak var stateDisplay: UILabel!
   
    @IBAction func pauseresetButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var pauseresumeButtonOutlet: UIButton!
    
    @IBAction func resetButton(_ sender: UIButton) {
        
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        runTimer()
    }
    
    //Setup
    stateDisplay.text
    
    //Functions
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(timeDisplayViewController.updateTimer)), userInfo: nil, repeats: true)
        
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
        state = "Waiting"
        stateDisplay.text = state
    }
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    func pauseresetTimer() {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            self.pauseresumeButtonOutlet.setTitle("Resume", for: .normal)
        }
        else {
            runTimer()
            self.resumeTapped = false
            self.pauseresumeButtonOutlet.setTitle("Pause", for: .normal)
        }
    }
    //<-
    
    //New Code
    if stateName = "Case" {
        stateDisplay.text = state
        seconds = 240
    }
    //<-
    
    //Case
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
    //Buttons
    
    //Pause/Resume
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
