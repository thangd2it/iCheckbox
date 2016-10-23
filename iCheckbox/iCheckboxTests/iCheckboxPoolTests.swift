//
//  iCheckboxPoolTests.swift
//  iCheckbox
//
//  Created by Stefan Godoroja on 10/23/16.
//  Copyright © 2016 Godoroja Stefan. All rights reserved.
//

import XCTest
@testable import iCheckbox

class iCheckboxPoolTests: XCTestCase {
    
    func testInitWithoutParameters() {
        let checkboxPool = iCheckboxPool()
        XCTAssertEqual(checkboxPool.selectionType, .Single)
        XCTAssertEqual(checkboxPool.style, .OneColumn)
        XCTAssertEqual(checkboxPool.borderStyle, .None)
    }
    
    func testAddingCheckboxes() {
        let checkboxPool = iCheckboxPool()
        let checkbox = iCheckbox(frame: CGRect(x: 0, y: 0, width: 0, height: 0),
                                 title: "Checkbox",
                                 selected: false)
        
        checkboxPool.addCheckbox(checkbox: checkbox)
        
        XCTAssertEqual(checkboxPool.numberOfCheckboxes(), 1)
    }
    
    func testDeselectAllCheckboxes() {
        let checkboxPool = iCheckboxPool()
        let firstSelectedCheckbox = iCheckbox(frame: CGRect(x: 0, y: 0, width: 0, height: 0),
                                 title: "Checkbox",
                                 selected: true)
        checkboxPool.addCheckbox(checkbox: firstSelectedCheckbox)
        let secondSelectedCheckbox = iCheckbox(frame: CGRect(x: 0, y: 0, width: 0, height: 0),
                                         title: "Checkbox",
                                         selected: true)
        checkboxPool.addCheckbox(checkbox: secondSelectedCheckbox)
        
        checkboxPool.deselectAllCheckboxes(except: firstSelectedCheckbox)
        
        XCTAssertEqual(firstSelectedCheckbox.isSelected, true)
        XCTAssertEqual(secondSelectedCheckbox.isSelected, false)
    }
    
    func testNumberOfColumns() {
        let checkboxPool = iCheckboxPool()
        checkboxPool.style = .OneColumn
        XCTAssertEqual(checkboxPool.numberOfColumns(), 1)
        checkboxPool.style = .TwoColumns
        XCTAssertEqual(checkboxPool.numberOfColumns(), 2)
    }
    
    func testBorderStyle_isBordered() {
        let checkboxPool = iCheckboxPool()
        checkboxPool.borderStyle = .Solid
        XCTAssertEqual(checkboxPool.bordered(), true)
        checkboxPool.borderStyle = .SolidWithRoundedCorners
        XCTAssertEqual(checkboxPool.bordered(), true)
        checkboxPool.borderStyle = .None
        XCTAssertEqual(checkboxPool.bordered(), false)
    }
}
