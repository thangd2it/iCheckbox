//
//  UIImageExtension.swift
//  iCheckbox
//
//  Created by Stefan Godoroja on 10/7/16.
//  Copyright © 2016 Godoroja Stefan. All rights reserved.
//

public extension UIImage {
    
    convenience init?(named: String, withBundleAssociatedClass aClass: AnyClass) {
        let bundle = Bundle(for: aClass)
        
        self.init(named: named,
                  in: bundle,
                  compatibleWith: nil)
    }
}
