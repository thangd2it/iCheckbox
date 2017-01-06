//
//  UIImageExtensionTests.swift
//  iCheckbox
//
//  Created by Stefan Godoroja on 1/6/17.
//  Copyright © 2017 Godoroja Stefan. All rights reserved.
//

import XCTest

@testable import iCheckbox

class UIImageExtensionTests: XCTestCase {
    
    func testInitWithNameAndBundleAssociatedClassForSuccess() {
        let validImageName = "checkbox_checked"
        let validImage = UIImage(named: validImageName,
                                 withBundleAssociatedClass: iCheckbox.self)
        XCTAssertNotNil(validImage, "Image is nil.")
    }
    
    func testInitWithNameAndBundleAssociatedClassForFail() {
        let invalidImageName = ""
        let invalidImage = UIImage(named: invalidImageName,
                                   withBundleAssociatedClass: iCheckbox.self)
        XCTAssertNil(invalidImage, "Image not nil. Seems it contains garbage data.")
    }
}
