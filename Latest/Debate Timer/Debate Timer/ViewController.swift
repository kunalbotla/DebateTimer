//
//  ViewController.swift
//  Debate Timer
//
//  Created by Kunal Botla on 9/26/18.
//  Copyright © 2018 Kunal Botla. All rights reserved.
//

import UIKit
import GoogleMobileAds

var speech = "nil"
var proPrepTime = 120
var conPrepTime = 120
var prepRefresh = false


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
    
    //if prepRefresh = true {
    //    updatePrep()
    //    prepRefresh = false
    //}
    
    @IBOutlet weak var navbarHome: UINavigationBar!
    
    @IBAction func buttonReset(_ sender: Any) {
        speech = "nil"
        proPrepTime = 120
        conPrepTime = 120
        updatePrep()
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
    
    @IBOutlet weak var adBannerView: GADBannerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Added By Kunal Botla - Start
        updatePrep()
        print("ViewDidLoad Running")
        
        //adBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        //adBannerView.rootViewController = self
        //adBannerView.load(GADRequest())
        
        //Added By Kunal Botla - End
    }


}

