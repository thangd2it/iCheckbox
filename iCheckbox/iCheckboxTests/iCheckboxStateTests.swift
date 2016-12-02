//
//  iCheckboxStateTests.swift
//  iCheckbox
//
//  Created by Stefan Godoroja on 10/23/16.
//  Copyright © 2016 Godoroja Stefan. All rights reserved.
//

import XCTest
@testable import iCheckbox

class iCheckboxStateTests: XCTestCase {
    
    func testInitWithoutParameters() {
        let checkboxState = iCheckboxState()
        XCTAssertEqual(checkboxState.title, "No title")
        XCTAssertEqual(checkboxState.selected, false)
    }
}
