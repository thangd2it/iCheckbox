//
//  iCheckboxPool.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/2/16.
//  Copyright © 2016 Demo. All rights reserved.
//

@objc
public enum iCheckboxSelection: Int {
    case Single, Multiple
}

@objc
public enum iCheckboxPoolStyle: Int {
    case OneColumn, TwoColumns
}

@objc
public enum iCheckboxPoolBorderStyle: Int {
    case None, Solid, SolidWithRoundedCorners
}

final class iCheckboxPool {
    
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
    
    func addCheckbox(checkbox: iCheckbox) {
        assignTag(forCheckbox: checkbox)
        checkboxes.append(checkbox)
    }
    
    func deselectAllCheckboxes(except checkbox: iCheckbox?) {
        
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
    
    private func assignTag(forCheckbox checkbox: iCheckbox) {
        checkbox.tag = index
        index += 1
    }
    
}
