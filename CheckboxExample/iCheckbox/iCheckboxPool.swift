//
//  iCheckboxPool.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/2/16.
//  Copyright © 2016 Demo. All rights reserved.
//

import UIKit

enum iCheckboxSelection {
    case Single, Multiple
}

enum iCheckboxPoolStyle {
    case OneColumn, TwoColumns, OneColumnBordered, TwoColumnsBordered
}

struct iCheckboxPool {
    
    var selectionType: iCheckboxSelection
    var style: iCheckboxPoolStyle
    
    private var index = 0
    private var checkboxes: [iCheckbox]?
    
    // MARK: - Initializers
    
    init() {
        checkboxes = []
        selectionType = .Single
        style = .OneColumn
    }
    
    // MARK: - Checkbox manipulation
    
    mutating func addCheckbox(checkbox: iCheckbox) {
        assignTag(forCheckbox: checkbox)
        checkboxes?.append(checkbox)
    }
    
    mutating func deselectAllCheckboxes(except checkbox: iCheckbox?) {
        
        if let checkboxes = checkboxes {
            
            for aCheckbox in checkboxes {
                
                if aCheckbox.isEqual(checkbox) == false {
                    aCheckbox.isSelected = false
                }
            }
        }
    }
    
    // MARK: - Private
    
    private mutating func assignTag(forCheckbox checkbox: iCheckbox) {
        checkbox.tag = index
        index += 1
    }
    
}
