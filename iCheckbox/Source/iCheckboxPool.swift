//
//  iCheckboxPool.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/2/16.
//  Copyright © 2016 Demo. All rights reserved.
//

import UIKit

public enum iCheckboxSelection {
    case Single, Multiple
}

public enum iCheckboxPoolStyle {
    case OneColumn, TwoColumns
}

public enum iCheckboxPoolBorderStyle {
    case None, Solid, SolidWithRoundedCorners
}

struct iCheckboxPool {
    
    var selectionType: iCheckboxSelection
    var style: iCheckboxPoolStyle
    var borderStyle: iCheckboxPoolBorderStyle
    
    private var index = 0
    private var checkboxes: [iCheckbox]
    
    // MARK: - Initializers
    
    init() {
        checkboxes = []
        selectionType = .Single
        style = .OneColumn
        borderStyle = .None
    }
    
    // MARK: - Checkbox manipulation
    
    mutating func addCheckbox(checkbox: iCheckbox) {
        assignTag(forCheckbox: checkbox)
        checkboxes.append(checkbox)
    }
    
    mutating func deselectAllCheckboxes(except checkbox: iCheckbox?) {
        
        for aCheckbox in checkboxes {
            
            if aCheckbox.isEqual(checkbox) == false {
                aCheckbox.isSelected = false
            }
        }
    }
    
    // MARK: - Getters
    
    func numberOfColumns() -> Int {
        
        if style == .OneColumn {
            return 1
        } else {
            return 2
        }
    }
    
    func bordered() -> Bool {
        
        if borderStyle == .Solid || borderStyle == .SolidWithRoundedCorners {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Private
    
    private mutating func assignTag(forCheckbox checkbox: iCheckbox) {
        checkbox.tag = index
        index += 1
    }
    
}
