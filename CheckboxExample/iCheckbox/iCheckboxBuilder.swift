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
    var checkboxBuilderState: iCheckboxBuilderState
    
    private var nextOriginY: CGFloat
    private var checkboxPool: iCheckboxPool
    private weak var canvas: UIView?
    
    // MARK: - Initializers
    
    init(withCanvas canvas: UIView, andState state: iCheckboxBuilderState) {
        self.canvas = canvas
        self.checkboxPool = iCheckboxPool()
        self.checkboxBuilderState = state
        self.nextOriginY = checkboxBuilderState.startPosition.y
    }
    
    // MARK: - Construct checkboxes
    
    func addCheckboxes(withStates states: [iCheckboxState], andSelectionType selectionType: iCheckboxSelectionType) {
        checkboxPool.selectionType = selectionType
        
        for state in states {
            let checkbox = iCheckbox(frame: CGRect(x: checkboxBuilderState.startPosition.x,
                                                   y: nextPositionY(),
                                                   width: checkboxBuilderState.checkboxSize.width,
                                                   height: checkboxBuilderState.checkboxSize.height),
                                     title: state.title,
                                     selected: state.selected)
            
            checkbox.setImageForNormalState(withName: checkboxBuilderState.imageNameForNormalState)
            checkbox.setImageForSelectedState(withName: checkboxBuilderState.imageNameForSelectedState)
            checkbox.setTitleColorForNormalState(color: checkboxBuilderState.titleColorForNormalState)
            checkbox.setTitleColorForSelectedState(color: checkboxBuilderState.titleColorForSelectedState)
            
            checkbox.onSelect = { checkbox in
                
                switch self.checkboxPool.selectionType {
                
                case .Single:
                    self.checkboxPool.deselectAllCheckboxes(except: checkbox)
                    
                case .Multiple:
                    print("")
                }
                
                self.delegate?.didSelectCheckbox(withState: checkbox.isSelected,
                                                 identifier: checkbox.tag,
                                                 andTitle: (checkbox.titleLabel?.text)!)
            }
            checkboxPool.addCheckbox(checkbox: checkbox)
            canvas?.addSubview(checkbox)
        }
    }
    
    // MARK: - Private
    
    private func nextPositionY() -> CGFloat {
        nextOriginY += checkboxBuilderState.checkboxSize.height
        return nextOriginY
    }
}
