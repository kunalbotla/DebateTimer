//
//  SecondViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 11/10/17.
//  Copyright © 2017 Kunal Botla. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //Variables
    var seconds = 0
    
    var timer = Timer()
    
    var timerIsRunning = false
    
    var pauseresumeTapped = false
    
    @IBAction func backClicked(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    func caseFunc() {
        seconds = 240
    }
    
    func rebuttalFunc() {
        seconds = 240
    }
    
    func crossfireFunc() {
        seconds = 180
    }
    
    func summaryFunc() {
        seconds = 120
    }
    
    func finalfocusFunc() {
        seconds = 120
    }
    
    @IBAction func pauseresumeButton(_ sender: UIButton) {
        if self.pauseresumeTapped == false {
            timer.invalidate()
            self.pauseresumeTapped = true
            self.pauseresumeButtonOutlet.setTitle("Resume", for: .normal)
        }
        else {
            runTimer()
            self.pauseresumeTapped = false
            self.pauseresumeButtonOutlet.setTitle("Pause", for: .normal)
        }
    }
    
    @IBOutlet weak var pauseresumeButtonOutlet: UIButton!
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetTimer()
    }
    
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    @IBAction func startButton(_ sender: UIButton) {
        if timerIsRunning == false {
            runTimer()
            timerIsRunning = true
        }
    }
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SecondViewController.updateTimer)), userInfo: nil, repeats: true)
        timerIsRunning = true
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send notification/alert
        }
        else {
            seconds -= 1
            timeLabel.text = timeString(timer: TimeInterval(seconds))
        }
    }
    
    func timeString(timer:TimeInterval) -> String {
        
        let hours = Int(timer) / 3600
        let minutes = Int(timer) / 60 % 60
        let seconds = Int(timer) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func resetTimer() {
        seconds = 0
        timer = Timer()
        timerIsRunning = false
        pauseresumeTapped = false
        timer.invalidate()
        timeLabel.text = timeString(timer: TimeInterval(seconds))
        timerIsRunning = false
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

