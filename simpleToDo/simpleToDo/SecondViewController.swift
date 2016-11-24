//
//  SecondViewController.swift
//  simpleToDo
//
//  Created by Doug Wells on 11/23/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newToDo: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addNewToDoTapped(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items: [String]     //need, else get "unresolved var" error
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(newToDo.text!)
            
        } else {
             items = [newToDo.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        newToDo.text = ""
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

