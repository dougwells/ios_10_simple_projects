//
//  InterfaceController.swift
//  noteDictate WatchKit Extension
//
//  Created by Doug Wells on 5/29/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var table: WKInterfaceTable!
    var notes = [String]()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        table.setNumberOfRows(notes.count, withRowType: "Row")
        
        for rowIndex in 0..<notes.count {
            set(row: rowIndex, to: notes[rowIndex])
        }
    }
    
    func set (row rowIndex: Int, to text: String) {
        
        guard let row = table.rowController(at: rowIndex) as? NoteSelectRow else { return }
        row.textLabel.setText(text)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func addNewNote() {
        
        //request user input
        presentTextInputController(withSuggestions: nil, allowedInputMode: .plain) { [unowned: self] result in
            
        }
        
        
    }
}
