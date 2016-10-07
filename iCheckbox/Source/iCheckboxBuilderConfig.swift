//
//  iCheckboxBuilderConfig.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/3/16.
//  Copyright © 2016 Demo. All rights reserved.
//


public struct iCheckboxBuilderConfig {
    
    public var startPosition = CGPoint(x: 20, y: 100)
    public var checkboxSize = CGSize(width: 150, height: 44)
    
    public var titleColorForSelectedState = UIColor.black
    public var titleColorForNormalState = UIColor.black
    
    public var imageNameForSelectedState = "checkbox_checked"
    public var imageNameForNormalState = "checkbox_unchecked"
    
    public var selection: iCheckboxSelection = .Single
    public var style: iCheckboxPoolStyle = .OneColumn
    public var borderStyle: iCheckboxPoolBorderStyle = .SolidWithRoundedCorners
    
    public var borderWidth: CGFloat = 2.0
    public var borderColor = UIColor.black
    public var borderCornerRadius: CGFloat = 5.0
    public var headerTitleColor = UIColor.black
    public var headerTitle: String?
    
    public init() { }
}
