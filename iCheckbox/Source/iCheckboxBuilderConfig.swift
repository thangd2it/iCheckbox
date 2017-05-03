//
//  iCheckboxBuilderConfig.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/3/16.
//  Copyright © 2016 Demo. All rights reserved.
//


@objc
public final class iCheckboxBuilderConfig: NSObject {
    
    public var startPosition = CGPoint(x: 20, y: 100)
    public var checkboxSize = CGSize(width: 150, height: 44)
    
    public var titleColorForHighlightedState = UIColor.black
    public var titleColorForSelectedState = UIColor.black
    public var titleColorForNormalState = UIColor.black
    public var titleColorForRightState = UIColor.green
    public var titleColorForWrongState = UIColor.gray
    public var lineBreakMode: NSLineBreakMode = .byTruncatingMiddle
    public var font: UIFont = UIFont.systemFont(ofSize: 17)
    
    public var imageNameForSelectedState = "checkbox_checked"
    public var imageNameForNormalState = "checkbox_unchecked"
    public var imageNameForRightState = "checkbox_checked"
    public var imageNameForWrongState = "checkbox_checked"
    
    public var selection: iCheckboxSelection = .Single
    public var style: iCheckboxPoolStyle = .OneColumn
    public var borderStyle: iCheckboxPoolBorderStyle = .SolidWithRoundedCorners
    
    public var borderWidth: CGFloat = 2.0
    public var borderColor = UIColor.black
    public var borderCornerRadius: CGFloat = 5.0
    public var headerTitleColor = UIColor.black
    public var headerTitle: String?
}
