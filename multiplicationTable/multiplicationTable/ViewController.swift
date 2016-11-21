//
//  ViewController.swift
//  multiplicationTable
//
//  Created by Doug Wells on 11/21/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var slider: UISlider!
    var number = 3
    var maxRows = 51
    
    

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return maxRows
    }
    
 
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        

        cell.textLabel?.text = "\(String(number)) x \(String(indexPath.row)) = \(number * indexPath.row)"
        
        
        return cell
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        number = Int(slider.value)
        table.reloadData()
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

