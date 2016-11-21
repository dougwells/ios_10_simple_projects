//
//  ViewController.swift
//  simpleEggTime
//
//  Created by Doug Wells on 11/20/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numSecRemaining: UILabel!
    
    var timer = Timer()
    var numSeconds:Int = 240
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func processTimer(){
        if numSeconds > 0 {
            numSeconds -= 1
            numSecRemaining.text = String(numSeconds)
        } else {
            timer.invalidate()
        }
    }
    
    @IBAction func playPressed(_ sender: Any) {
               timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    

    

    @IBAction func stopPressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func minus10Pressed(_ sender: Any) {
        if numSeconds >= 10 {
            numSeconds -= 10
            numSecRemaining.text = String(numSeconds)
        }
    }
    @IBAction func plus10Pressed(_ sender: Any) {
        numSeconds += 10
        numSecRemaining.text = String(numSeconds)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        numSeconds = 240
        numSecRemaining.text = String(numSeconds)
    }
    

}

