//
//  CheckBox.swift
//  CheckBox
//
//  Created by Ștefan Godoroja on 8/9/14..
//  Copyright (c) 2014 Ștefan Godoroja. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    var delegate: CheckBoxDelegate?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(frame: CGRect, title: String, selected: Bool) {
        super.init(frame: frame)
        self.adjustEdgeInsets()
        self.applyStyle()
        self.setTitle(title, for: UIControlState())
        self.addTarget(self, action: #selector(CheckBox.onTouchUpInside(_:)), for: UIControlEvents.touchUpInside)
    }

    func adjustEdgeInsets() {
        let leftInset: CGFloat = 8.0
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        self.imageEdgeInsets = UIEdgeInsetsMake(0.0 as CGFloat, leftInset, 0.0 as CGFloat, 0.0 as CGFloat)
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0 as CGFloat, (leftInset * 2), 0.0 as CGFloat, 0.0 as CGFloat)
    }

    func applyStyle() {
        self.setImage(UIImage(named: "checked_checkbox"), for: UIControlState.selected)
        self.setImage(UIImage(named: "unchecked_checkbox"), for: UIControlState())
        self.setTitleColor(UIColor.black, for: UIControlState())
    }

    func onTouchUpInside(_ sender: UIButton) {
        self.isSelected = !self.isSelected
        delegate?.didSelectCheckBox(self.isSelected, identifier: self.tag, title: self.titleLabel!.text!)
    }
}
