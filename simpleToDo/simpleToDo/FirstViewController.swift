//
//  FirstViewController.swift
//  simpleToDo
//
//  Created by Doug Wells on 11/23/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var arr = ["Github push of day", "Buy Groceries", "Work Out"]

    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String] {
            arr = tempItems
        }
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func loadToDos (initArr: Array<String>) -> Array<String> {
//        UserDefaults.standard.set(initArr, forKey:"todos")
//        let arrObject = UserDefaults.standard.object(forKey: "todos")
//        if let todoArr = arrObject as? Array<String> {
//            print(todoArr)
//        }
//        return []
//    }


}

