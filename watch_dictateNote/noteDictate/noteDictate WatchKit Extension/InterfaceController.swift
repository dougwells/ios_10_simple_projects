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
    var savePath = InterfaceController.getDocumentsDirectory().appendingPathComponent("notes").path

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        notes = NSKeyedUnarchiver.unarchiveObject(withFile: savePath) as? [String] ?? [String]()
        
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
        presentTextInputController(withSuggestions: nil, allowedInputMode: .plain) { [unowned self] result in
            
            //convert to string if possible, else return out of function
            guard let result = result?.first as? String else {return}
            
            //insert new row at end of table
            self.table.insertRows(at: IndexSet(integer: self.notes.count), withRowType: "Row")
            
            //feed new row the new text
            self.set(row: self.notes.count, to: result)
            
            //append new note to the notes array
            self.notes.append(result)
            
            NSKeyedArchiver.archiveRootObject(self.notes, toFile: self.savePath)
            
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        
        return ["index" : String(rowIndex+1), "note" : notes[rowIndex]]
        
    }
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]     //WatchOS only has 1 documents directory
    }
    
}
