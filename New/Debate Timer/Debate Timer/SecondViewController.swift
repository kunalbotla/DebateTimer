//
//  SecondViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 10/24/18.
//  Copyright © 2018 Kunal Botla. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var startingTime = 0
    var caseAndRebuttalTime = 180
    var crossFireTime = 240
    var summaryAndFinalFocusTime = 120
    var localSpeech = "Blank"
    
    
    var seconds = 0 //Timer starting amount
    var timer = Timer()
    var timerIsRunning = false
    var resumeState = false
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SecondViewController.updateTimer)), userInfo: nil, repeats: true)
        timerIsRunning = true
        buttonPauseResumeOutlet.isEnabled = true
        labelTimer.text =  timeString(time: TimeInterval(seconds))
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
        } else {
            seconds = seconds-1 //Count down in seconds
            labelTimer.text =  timeString(time: TimeInterval(seconds)) //Label update
        }
        
    }
    
    func timeString(time:TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @IBOutlet weak var navbarTimer: UINavigationBar!
    
    @IBAction func buttonFullReset(_ sender: UIButton) {
    }
    
    @IBOutlet weak var labelSpeech: UILabel!
    
    @IBOutlet weak var labelTimer: UILabel!
    
    @IBOutlet weak var buttonPauseResumeOutlet: UIButton!
    
    @IBOutlet weak var buttonResetOutlet: UIButton!
    
    @IBOutlet weak var buttonStartOutlet: UIButton!
    
    
    @IBAction func buttonPauseResume(_ sender: UIButton) {
        if self.resumeState == false {
            timer.invalidate()
            self.resumeState = true
            self.buttonPauseResumeOutlet.setTitle("Resume", for: .normal)
        } else {
            runTimer()
            self.resumeState = false
            self.buttonPauseResumeOutlet.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func buttonReset(_ sender: UIButton) {
        timer.invalidate()
        
        seconds = startingTime //Reset to original time
        labelTimer.text =  timeString(time: TimeInterval(seconds))
        
        timerIsRunning = false
        
        buttonPauseResumeOutlet.isEnabled = false
    }
    
    @IBAction func buttonStart(_ sender: UIButton) {
        if timerIsRunning == false {
            runTimer()
            self.buttonStartOutlet.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//Added By Kunal Botla - Start
        labelSpeech.text = speech
        if speech == "Case" {
            startingTime = caseAndRebuttalTime
        } else if speech == "Rebuttal" {
            startingTime = caseAndRebuttalTime
        } else if speech == "Cross Fire" {
            startingTime = crossFireTime
        } else if speech == "Summary" {
            startingTime = summaryAndFinalFocusTime
        } else if speech == "Final Focus" {
            startingTime = summaryAndFinalFocusTime
        }
        seconds = startingTime
        labelTimer.text =  timeString(time: TimeInterval(seconds))
//Added for Timer
        buttonPauseResumeOutlet.isEnabled = false
//Added By Kunal Botla - End
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
