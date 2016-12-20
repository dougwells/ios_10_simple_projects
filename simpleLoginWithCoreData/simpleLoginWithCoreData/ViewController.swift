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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isUserLoggedIn = false
        
        //Set up storage context
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //create object "newUser" that lets us save new data
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

