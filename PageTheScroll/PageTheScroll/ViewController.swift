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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var images = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        print("Scrollview width = \(scrollView.frame.size.width)")
        
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x)")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat
            newX = scrollView.frame.size.width * (0.5 + CGFloat(x))
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: scrollView.frame.midY - 75, width: 150, height: 150)
        }
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        // sscrollView.backgroundColor = UIColor.purple
        scrollView.clipsToBounds = false
        
    }



}

