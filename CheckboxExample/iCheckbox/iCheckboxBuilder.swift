//
//  iCheckboxBuilder.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/2/16.
//  Copyright © 2016 Demo. All rights reserved.
//

import UIKit

class iCheckboxBuilder {
    
    var delegate: iCheckboxDelegate?
    var startPosition: CGPoint
    var checkboxSize: CGSize
    
    private var checkboxPool: iCheckboxPool
    private weak var canvas: UIView?
    private var nextOriginY: CGFloat
    
    // MARK: - Initializers
    
    init(withCanvas canvas: UIView, startPosition: CGPoint, andCheckboxSize checkboxSize: CGSize) {
        self.canvas = canvas
        self.checkboxPool = iCheckboxPool()
        self.startPosition = startPosition
        self.checkboxSize = checkboxSize
        self.nextOriginY = startPosition.y
    }
    
    // MARK: - Construct checkboxes
    
    func addCheckboxes(withStates states: [iCheckboxState], andSelectionType selectionType: iCheckboxSelectionType) {
        checkboxPool.selectionType = selectionType
        
        for state in states {
            let checkbox = iCheckbox(frame: CGRect(x: startPosition.x,
                                                   y: nextPositionY(),
                                                   width: checkboxSize.width,
                                                   height: checkboxSize.height),
                                     title: state.title,
                                     selected: false)
            checkbox.onSelect = { checkbox in
                
                switch self.checkboxPool.selectionType {
                
                case .Single:
                    self.checkboxPool.deselectAllCheckboxes(except: checkbox)
                    
                case .Multiple:
                    print("")
                }
                
                self.delegate?.didSelectCheckbox(checkbox.isSelected,
                                                 identifier: checkbox.tag,
                                                 title: (checkbox.titleLabel?.text)!)
            
            }
            
            checkboxPool.addCheckbox(checkbox: checkbox)
            canvas?.addSubview(checkbox)
        }
    }
    
    // MARK: - Private
    
    private func nextPositionY() -> CGFloat {
        nextOriginY += checkboxSize.height
        return nextOriginY
    }
}
