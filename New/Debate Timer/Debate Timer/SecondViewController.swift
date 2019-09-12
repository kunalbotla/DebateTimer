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
    
    
    
    //State conversion
    //if speech = "Case" {
    //    startingTime = caseAndRebuttalTime
    //} if speech = "Rebuttal" {
    //    startingTime = caseAndRebuttalTime
    //} if speech = "Cross Fire" {
    //    startingTime = crossFireTime
    //} if speech = "Summary" {
    //    startingTime = summaryAndFinalFocusTime
    //} if speech = "Final Focus" {
    //    startingTime = summaryAndFinalFocusTime
    //}
    
    var seconds = 60 //Timer starting amount
    var timer = Timer()
    var timerIsRunning = false
    var resumeState = false
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SecondViewController.updateTimer)), userInfo: nil, repeats: true)
        
        timerIsRunning = true
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
    
    @IBAction func buttonFullReset(_ sender: Any) {
    }
    
    @IBOutlet weak var labelSpeech: UILabel!
    
    @IBOutlet weak var labelTimer: UILabel!
    
    @IBAction func buttonPauseResume(_ sender: Any) {
        if self.resumeState == false {
            timer.invalidate()
            self.resumeState = true
            self.buttonPauseResume.setTitle("Resume", for: .normal)
        } else {
            runTimer()
            self.resumeState = false
            self.buttonPauseResume.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func buttonReset(_ sender: Any) {
        timer.invalidate()
        
        seconds = startingTime //Reset to original time
        labelTimer.text =  timeString(time: TimeInterval(seconds))
        
        timerIsRunning = false
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        if timerIsRunning == false {
            runTimer()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//Added By Kunal Botla - Start
        labelSpeech.text = speech
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
