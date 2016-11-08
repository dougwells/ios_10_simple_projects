//
//  ViewController.swift
//  Color Flashlight
//
//  Created by Doug Wells on 11/8/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func MyButtonClicked(_ sender: UIButton) {
            if self.view.backgroundColor == UIColor.red {
                self.view.backgroundColor = UIColor.blue
            } else {
                self.view.backgroundColor = UIColor.red
            }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

