//
//  DetailInterfaceController.swift
//  noteDictate
//
//  Created by Doug Wells on 6/8/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {
    
    @IBOutlet var textLabel: WKInterfaceLabel!
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
