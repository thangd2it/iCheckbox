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
    var checkboxBuilderConfig: iCheckboxBuilderConfig
    
    private var nextOriginY: CGFloat
    private var checkboxPool: iCheckboxPool
    private weak var canvas: UIView?
    
    // MARK: - Initializers
    
    init(withCanvas canvas: UIView, andConfig config: iCheckboxBuilderConfig) {
        self.canvas = canvas
        self.checkboxPool = iCheckboxPool()
        self.checkboxBuilderConfig = config
        self.nextOriginY = checkboxBuilderConfig.startPosition.y
    }
    
    // MARK: - Construct checkboxes
    
    func addCheckboxes(withStates states: [iCheckboxState], andSelectionType selectionType: iCheckboxSelectionType) {
        checkboxPool.selectionType = selectionType
        
        for state in states {
            let checkbox = iCheckbox(frame: CGRect(x: checkboxBuilderConfig.startPosition.x,
                                                   y: nextPositionY(),
                                                   width: checkboxBuilderConfig.checkboxSize.width,
                                                   height: checkboxBuilderConfig.checkboxSize.height),
                                     title: state.title,
                                     selected: state.selected)
            
            checkbox.setImageForNormalState(withName: checkboxBuilderConfig.imageNameForNormalState)
            checkbox.setImageForSelectedState(withName: checkboxBuilderConfig.imageNameForSelectedState)
            checkbox.setTitleColorForNormalState(color: checkboxBuilderConfig.titleColorForNormalState)
            checkbox.setTitleColorForSelectedState(color: checkboxBuilderConfig.titleColorForSelectedState)
            
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
        nextOriginY += checkboxBuilderConfig.checkboxSize.height
        return nextOriginY
    }
}
