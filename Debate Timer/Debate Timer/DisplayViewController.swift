//
//  timeDisplayViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 10/17/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import UIKit

class timeDisplayViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var timeDisplay: UILabel!
    
    @IBOutlet weak var stateDisplay: UILabel!
    
    stateDisplay.text = "stateDisplay"
    
    @IBAction func pauseresetButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var pauseresumeButtonOutlet: UIButton!
    
    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    //Functions
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
//
  
//Rebuttal
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
    
//Crossfire
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

//Summery
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

//Final Focus
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
    
//Pause
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

//Reset
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
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
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
