//
//  iCheckboxPool.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/2/16.
//  Copyright © 2016 Demo. All rights reserved.
//

import UIKit

enum iCheckboxSelectionType {
    case Single, Multiple
}

struct iCheckboxPool {
    
    var selectionType: iCheckboxSelectionType = .Single
    
    private var index = 0
    private var checkboxes: [iCheckbox]?
    
    // MARK: - Initializers
    
    init() {
        checkboxes = []
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
