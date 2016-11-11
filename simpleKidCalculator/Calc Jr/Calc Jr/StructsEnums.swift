//
//  StructsEnums.swift
//  Calc Jr
//
//  Created by Doug Wells on 11/10/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"              //could make equal to "plus"
    case subtract = "-"         //any string (since typed as such)
    case times = "*"            //is fine.
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
