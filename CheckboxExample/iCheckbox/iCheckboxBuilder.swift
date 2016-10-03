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
    
    private var nextOriginX: CGFloat
    private var nextOriginY: CGFloat
    
    private var checkboxPool: iCheckboxPool
    private weak var canvas: UIView?
    
    // MARK: - Initializers
    
    init(withCanvas canvas: UIView, andConfig config: iCheckboxBuilderConfig) {
        self.canvas = canvas
        self.checkboxBuilderConfig = config
        self.checkboxPool = iCheckboxPool()
        checkboxPool.selectionType = config.selection
        checkboxPool.style = config.style
        self.nextOriginX = config.startPosition.x
        self.nextOriginY = config.startPosition.y
    }
    
    // MARK: - Construct checkboxes
    
    func addCheckboxes(withStates states: [iCheckboxState]) {
        var index = 0
        
        for state in states {
            let checkbox = iCheckbox(frame: CGRect(x: nextPositionX(forCheckboxAtIndex: index,
                                                                    andNumberOfCheckboxes: states.count),
                                                   y: nextPositionY(forCheckboxAtIndex: index,
                                                                    andNumberOfCheckboxes: states.count),
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
            index += 1
        }
    }
    
    // MARK: - Private
    
    private func nextPositionX(forCheckboxAtIndex index: Int, andNumberOfCheckboxes checkboxesCount: Int) -> CGFloat {
        
        switch checkboxPool.style {
            
        case .OneColumn:
            return nextOriginX
            
        case .TwoColumns:
            let padding: CGFloat = 5.0
            let checkboxesPerColumn = (Float(checkboxesCount) / 2.0)
            let firstColumnCheckboxesCount = Int(round(checkboxesPerColumn))
            
            if index >= firstColumnCheckboxesCount {
                return (nextOriginX + checkboxBuilderConfig.checkboxSize.width + padding)
            } else {
                return nextOriginX
            }
            
        default:
            return nextOriginX
        }
    }
    
    private func nextPositionY(forCheckboxAtIndex index: Int, andNumberOfCheckboxes checkboxesCount: Int) -> CGFloat {
        
        switch checkboxPool.style {
            
        case .OneColumn:
            nextOriginY += checkboxBuilderConfig.checkboxSize.height
            
        case .TwoColumns:
            let checkboxesPerColumn = (Float(checkboxesCount) / 2.0)
            let firstColumnCheckboxesCount = Int(round(checkboxesPerColumn))
            
            if index == firstColumnCheckboxesCount {
                nextOriginY = checkboxBuilderConfig.startPosition.y
            }
            
            nextOriginY += checkboxBuilderConfig.checkboxSize.height
            
        default:
            return nextOriginY
        }
        
        return nextOriginY
    }
}
