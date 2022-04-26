//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 60
    var counterBarra = 0
    var counterFix = 0
    let eggTimes = ["Soft": 300, "Medium": 420,"Hard":720]
    var timer = Timer()
    
    @IBOutlet weak var textoMain: UILabel!
    
    @IBOutlet weak var barraProgress: UIProgressView!
    
    @IBAction func eggType(_ sender: UIButton) {
        timer.invalidate()
        counterBarra = 0
        barraProgress.progress = 0
        let hardness = sender.currentTitle!
        textoMain.text = hardness
        counter = eggTimes[hardness]!
        counterFix = counter
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        barraProgress.progress = Float(counterBarra)/Float(counterFix)
            counterBarra+=1
        if counter > 0 {
            print("\(counter) seconds.")
            counter -= 1
        }
        else{
            timer.invalidate()
            textoMain.text = "DONE!"
        }
    }
}
