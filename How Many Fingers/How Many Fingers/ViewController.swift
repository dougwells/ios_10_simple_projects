//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Doug Wells on 11/13/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numFingers: UITextField!
    @IBOutlet weak var responseToGuess: UILabel!
    var fingers = Int(arc4random_uniform(6))
    let sillyReplies = [
        "Not even close",
        "Nope.  I am so good at this",
        "Close but no cigar",
        "Not yet.  Siri rules!",
        "You are getting warmer",
        "Psyche!  Try again",
        "Getting tired?"
    ]
    

    @IBAction func submitGuessTapped(_ sender: Any) {
        if let guess = Int(numFingers.text!) {
            if guess != fingers {
                let i = Int(arc4random_uniform(7))
                responseToGuess.text = sillyReplies[i]
                numFingers.text = ""
            } else {
                responseToGuess.text = "Booy-Yah! You win!!"
            }
        }
    }
    
    @IBAction func newGameBtnTapped(_ sender: Any) {
        fingers = Int(arc4random_uniform(6))
        numFingers.text = ""
        responseToGuess.text = ""
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

