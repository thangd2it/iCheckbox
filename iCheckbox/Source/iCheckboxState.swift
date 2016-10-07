//
//  iCheckboxState.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/2/16.
//  Copyright © 2016 Demo. All rights reserved.
//

@objc
public final class iCheckboxState: NSObject {
    
    public var title: String
    public var selected: Bool
    
    public init(title: String = "No title", selected: Bool = false) {
        self.title = title
        self.selected = selected
    }
}
