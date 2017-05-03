//
//  iCheckbox.swift
//  iCheckboxDemo
//
//  Created by Ștefan Godoroja on 8/9/14..
//  Copyright (c) 2014 Ștefan Godoroja. All rights reserved.
//

@objc
public protocol iCheckboxDelegate {
    func didSelectCheckbox(withState state: Bool, identifier: Int, andTitle title: String)
}

extension UIControlState {
    public static var right: UIControlState {
        return UIControlState.init(rawValue: 10000)
    }
    
    public static var wrong: UIControlState {
        return UIControlState(rawValue: 20000)
    }
}

final public class iCheckbox: UIButton {
    
    var onSelect: ((iCheckbox) -> ())?
    
    public var answerState: UIControlState = .normal {
        didSet {
            layoutSubviews()
        }
    }

    // MARK: Initializer
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, title: String, selected: Bool) {
        super.init(frame: frame)
        adjustEdgeInsets()
        self.isSelected = selected
        self.setTitle(title, for: UIControlState.normal)
        self.addTarget(self, action: #selector(iCheckbox.onTouchUpInside(_:)), for: UIControlEvents.touchUpInside)
        
        
        
    }
    
    public override var state: UIControlState {
        let superState = super.state
        let combinedState = superState.union(answerState)
        
        return combinedState
    }

    // MARK: Setters
    
    func setImageForSelectedState(withName name: String) {
        self.setImage(UIImage(named: name, withBundleAssociatedClass: iCheckbox.self), for: UIControlState.selected)
    }
    
    func setImageForNormalState(withName name: String) {
        self.setImage(UIImage(named: name, withBundleAssociatedClass: iCheckbox.self), for: UIControlState.normal)
    }
    
    func setImageForRightState(withName name: String) {
        self.setImage(UIImage(named: name, withBundleAssociatedClass: iCheckbox.self), for: UIControlState.right)
        
        self.setImage(UIImage(named: name, withBundleAssociatedClass: iCheckbox.self), for: UIControlState.right.union(.selected))
        self.setImage(UIImage(named: name, withBundleAssociatedClass: iCheckbox.self), for: UIControlState.right.union(.highlighted))
    }
    
    func setImageForWrongState(withName name: String) {
        self.setImage(UIImage(named: name, withBundleAssociatedClass: iCheckbox.self), for: UIControlState.wrong)
        
        self.setImage(UIImage(named: name, withBundleAssociatedClass: iCheckbox.self), for: UIControlState.wrong.union(.selected))
        self.setImage(UIImage(named: name, withBundleAssociatedClass: iCheckbox.self), for: UIControlState.wrong.union(.highlighted))
    }
    
    func setTitleColorForSelectedState(color: UIColor) {
        self.setTitleColor(color, for: UIControlState.selected)
    }
    
    func setTitleColorForNormalState(color: UIColor) {
        self.setTitleColor(color, for: UIControlState.normal)
    }
    
    func setTitleColorForHighlightedState(color: UIColor) {
        self.setTitleColor(color, for: .highlighted)
    }
    
    func setTitleColorForRightState(color: UIColor) {
        self.setTitleColor(color, for: .right)
        self.setTitleColor(color, for: UIControlState.right.union(.selected))
        self.setTitleColor(color, for: UIControlState.right.union(.highlighted))
    }
    
    func setTitleColorForWrongState(color: UIColor) {
        self.setTitleColor(color, for: .wrong)
        self.setTitleColor(color, for: UIControlState.wrong.union(.selected))
        self.setTitleColor(color, for: UIControlState.wrong.union(.highlighted))
    }

    // MARK: IBActions
    
    func onTouchUpInside(_ sender: UIButton) {
        self.isSelected = !self.isSelected
        
        if let onSelect = onSelect {
            onSelect(self)
        }
    }
    
    // MARK: Private
    
    private func adjustEdgeInsets() {
        let leftInset: CGFloat = 8.0
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        self.imageEdgeInsets = UIEdgeInsetsMake(CGFloat(0.0), leftInset, CGFloat(0.0), CGFloat(0.0))
        self.titleEdgeInsets = UIEdgeInsetsMake(CGFloat(0.0), (leftInset * 2), CGFloat(0.0), CGFloat(0.0))
    }
}
