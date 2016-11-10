//
//  ViewController.swift
//  Calc Jr
//
//  Created by Doug Wells on 11/10/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //button Actions
    @IBAction func numberClicked (_ sender: UIButton) {

    }
    
    @IBAction func operatorClicked (_ sender: UIButton) {
        switch sender.tag {
        case 10:
            print("plus")
        case 11:
            print("minus")
        case 12:
            print ("times")
        case 13:
            print("divide")
        default:
            return
        }
    }
    
    @IBAction func equalsClicked (_ sender: UIButton) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

