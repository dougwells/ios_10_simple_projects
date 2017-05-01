//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Doug Wells on 5/1/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//
//  Scroll View practice

import UIKit

class ViewController: UIViewController {
    
    var images = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x)")
            images.append(UIImageView(image: image))
        }
        print("Count: \(images.count)")

    }



}

