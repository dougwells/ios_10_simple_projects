//
//  ViewController.swift
//  Temperature Converter
//
//  Created by Doug Wells on 11/8/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempEntry: UITextField!

    @IBOutlet weak var tempFLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func convTempClicked(_ sender: Any) {
        if let result = tempEntry.text {
            if (tempEntry.text == "") {
                return
            } else {
                if let num = Double(result) {
                    let farh = num * (9/5) + 32
                    tempFLabel.text = String(farh)
                }
            }
        }
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

