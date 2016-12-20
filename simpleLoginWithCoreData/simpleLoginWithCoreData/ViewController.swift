//
//  ViewController.swift
//  simpleLoginWithCoreData
//
//  Created by Doug Wells on 12/20/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let isUserLoggedIn = false
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var inputUserName: UITextField!
    
    @IBAction func login(_ sender: Any) {
        if let newUsername = inputUserName.text as String? {
            self.welcomeLabel.text = "Welcome: \(newUsername)"
        }
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        //Set up storage context
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //create object "newUser" that lets us save new data
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        if !self.isUserLoggedIn {
            
        }
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

