//
//  iCheckboxBuilderConfig.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/3/16.
//  Copyright © 2016 Demo. All rights reserved.
//

import UIKit

struct iCheckboxBuilderConfig {
    
    var startPosition = CGPoint(x: 20, y: 100)
    var checkboxSize = CGSize(width: 150, height: 44)
    
    var titleColorForSelectedState = UIColor.black
    var titleColorForNormalState = UIColor.black
    
    var imageNameForSelectedState = "checkbox_checked"
    var imageNameForNormalState = "checkbox_unchecked"
    
    var selection: iCheckboxSelection = .Single
    var style: iCheckboxPoolStyle = .OneColumn
    var borderStyle: iCheckboxPoolBorderStyle = .None
    
    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.black
    var borderCornerRadius: CGFloat = 10.0
    var headerTitleColor = UIColor.black
    var headerTitle: String?
}
