//
//  ViewController.swift
//  dogYears
//
//  Created by Doug Wells on 11/12/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterAge: UITextField!
    @IBOutlet weak var ansPrefixLabel: UILabel!
    @IBOutlet weak var ansPostLabel: UILabel!

    @IBAction func calcAgeBtnTapped(_ sender: Any) {
        if (enterAge.text != "") {
            let age = Int(enterAge.text!)! * 7
            ansPrefixLabel.text = "In dog years, your dog is: "
            ansPostLabel.text = String(age)
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

