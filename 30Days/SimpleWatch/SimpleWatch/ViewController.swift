//
//  ViewController.swift
//  SimpleWatch
//
//  Created by Paul Wen on 2016/10/14.
//  Copyright © 2016年 Paul Wen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnReset: UIButton!
    
    @IBOutlet weak var lblCount: UILabel!
    
    @IBOutlet weak var btnStart: UIButton!
    
    @IBOutlet weak var btnPause: UIButton!
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblCount.text = String(counter)
    }

    @IBAction func timerStart(_ sender: UIButton) {
        if(isPlaying){
            return
        }
        btnStart.isEnabled = false
        btnPause.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }

    @IBAction func timerReset(_ sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        lblCount.text = String(format: "%.1f", counter)
        btnPause.isEnabled = true
        btnStart.isEnabled = true
    }
    
    @IBAction func timerPause(_ sender: UIButton) {
        btnStart.isEnabled = true
        btnPause.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    

    func updateTimer(){
        counter = counter + 0.1
        lblCount.text = String(format:"%.1f",counter)
    }

}

