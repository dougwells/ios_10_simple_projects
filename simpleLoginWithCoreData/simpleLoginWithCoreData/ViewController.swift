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

    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var inputUserName: UITextField!
    @IBOutlet weak var loginLabel: UIButton!

    
    var isUserLoggedIn = false
    var username = ""
    
    @IBAction func logout(_ sender: Any) {
        welcomeLabel.text = "Please Login"
        inputUserName.alpha = 1
        loginLabel.setTitle("Login", for: .normal)
        isUserLoggedIn = false
    }
    
    /*
        Could also modify existing username instead of simply adding new one.
    */
    
    
    @IBAction func login(_ sender: Any) {
        var existingUser = false
        inputUserName.alpha = 0
        
        if isUserLoggedIn {
            welcomeLabel.text = "Enter new username"
            inputUserName.alpha = 1
            loginLabel.setTitle("Login", for: .normal)
            isUserLoggedIn = false
            return
            
        } else {
            loginLabel.setTitle("Change name", for: .normal)
            isUserLoggedIn = true
        }
        if let newUsername = inputUserName.text {
            username = newUsername
            inputUserName.text = ""
            print("username: ", username)
        }
        
        //Set up storage context
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //create object "newUser" that lets us save new data
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        //Check to see if this user already exists
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            print("Existing DB objects = ", results.count)
            
            if (results.count > 0) {
                
                //loop thru array of result objects to see if username exists already
                for result in results as! [NSManagedObject] {
                    if let existingUsername = result.value(forKey: "username") as? String {
                        print("is \(username) = \(existingUsername)?")
                        if username == existingUsername {
                            existingUser = true
                        }
                    }
                }
            }
        } catch {
            print("Error retrieving user data")
        } //End check to see if existing user
        

        
        
        //save username
        if !existingUser {
            newUser.setValue(username, forKey: "username")
            do {
                try context.save()
                print("New user, \(username), saved.")
                self.welcomeLabel.text = "Welcome New User: \(username)"
            } catch {
                print("Error saving new username in do try")
            }
        } else {
            self.welcomeLabel.text = "Welcome Back, \(username) !"
        }
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        

        

        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkIfExistingUser(context: NSManagedObjectContext){
        
    }


}

