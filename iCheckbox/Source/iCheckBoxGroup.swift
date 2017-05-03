//
//  iCheckBoxGroup.swift
//  iCheckbox
//
//  Created by mango(Đào Đức Thắng).
//  Copyright © 2017 Godoroja Stefan. All rights reserved.
//

@objc
public class iCheckboxGroup: NSObject {
    private var checkboxes: [iCheckbox] = []
    private var containerView: UIView!
    
    public var isEnabled: Bool = true {
        didSet {
            for cb in checkboxes {
                cb.isEnabled = isEnabled
            }
        }
    }
    
    public init(view: UIView) {
        super.init()
        containerView = view
    }
    
    public func add(checkbox: iCheckbox) {
        checkboxes.append(checkbox)
        checkbox.isEnabled = isEnabled
    }
    
    public func changeTitleColor(forCheckbox tag: Int, color: UIColor) {
        for cb in checkboxes {
            if cb.tag == tag {
                cb.setTitleColorForNormalState(color: color)
                break
            }
        }
    }
}



