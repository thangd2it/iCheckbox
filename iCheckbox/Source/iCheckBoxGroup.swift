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
                cb.isUserInteractionEnabled = isEnabled
            }
        }
    }
    
    public init(view: UIView) {
        super.init()
        containerView = view
    }
    
    public func add(checkbox: iCheckbox) {
        checkboxes.append(checkbox)
        checkbox.isUserInteractionEnabled = isEnabled
    }
    
    public func changeAnswerState(ofCheckbox tag: Int, state: UIControlState) {
        let subviews = containerView.subviews
        for sv in subviews {
            if let cb = sv as? iCheckbox,  sv.tag == tag {
                cb.answerState = state
                break
            }
        }
    }
}



