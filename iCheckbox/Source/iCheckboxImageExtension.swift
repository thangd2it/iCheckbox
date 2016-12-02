//
//  iCheckboxImageExtension.swift
//  iCheckbox
//
//  Created by Stefan Godoroja on 10/7/16.
//  Copyright © 2016 Godoroja Stefan. All rights reserved.
//

extension UIImage {
    
    convenience init?(named name: String, associatedWith associatedClass: AnyClass) {
        self.init(named: name,
                  in: Bundle(for: associatedClass),
                  compatibleWith: nil)
    }
}

        
