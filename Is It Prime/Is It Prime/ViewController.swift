//
//  ViewController.swift
//  Is It Prime
//
//  Created by Doug Wells on 11/13/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterNum: UITextField!
    @IBOutlet weak var primeMessage: UILabel!
    var prime = false
    
    @IBAction func primeButtonTapped(_ sender: Any)  {
        if let num = Int(enterNum.text!)
        {
            if (num != 0 && num != 1) {
                var divArr: [Int] = []
                for var i in 2..<num {
                    if(num % i == 0) {
                        divArr.append(i)
                    }
                }
                if divArr.isEmpty && num != 1 {
                    primeMessage.text = "Yes, \(num) is a prime number"
                } else {
                    primeMessage.text = "No, " + String(num) + " is NOT prime. \n It can be divided by " + String(divArr[0])
                }
            } else {
            primeMessage.text = "Please do not enter 0 or 1"
            }

        } else {
            primeMessage.text = "Please enter a whole non-negative number"
        }
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

