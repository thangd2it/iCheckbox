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
    private lazy var headerLabel = UILabel()
    
    private let borderPadding: CGFloat = 5.0
    
    // MARK: - Initializers
    
    init(withCanvas canvas: UIView, andConfig config: iCheckboxBuilderConfig) {
        self.canvas = canvas
        self.checkboxBuilderConfig = config
        self.checkboxPool = iCheckboxPool()
        self.checkboxPool.selectionType = config.selection
        self.checkboxPool.style = config.style
        self.checkboxPool.borderStyle = config.borderStyle
        self.nextOriginX = config.startPosition.x
        self.nextOriginY = config.startPosition.y
    }
    
    // MARK: - Construct checkboxes
    
    func addCheckboxes(withStates states: [iCheckboxState]) {
        addPoolBordersIfRequired(forStatesCount: states.count)
        
        var index = 0
        
        for state in states {
            let checkbox = iCheckbox(frame: CGRect(x: nextOriginX,
                                                   y: nextOriginY,
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
                    
                default:
                    ()
                }
                
                self.delegate?.didSelectCheckbox(withState: checkbox.isSelected,
                                                 identifier: checkbox.tag,
                                                 andTitle: (checkbox.titleLabel?.text)!)
            }

            checkboxPool.addCheckbox(checkbox: checkbox)
            canvas?.addSubview(checkbox)
            index += 1
            
            calculateNextPositionX(forCheckboxAtIndex: index,
                                   andNumberOfCheckboxes: states.count)
            calculateNextPositionY(forCheckboxAtIndex: index,
                                   andNumberOfCheckboxes: states.count)
        }
    }
    
    private func addPoolBordersIfRequired(forStatesCount statesCount: Int) {
        
        if checkboxPool.bordered() {
            configureHeaderLabel()
            let numberOfColumns = CGFloat(checkboxPool.numberOfColumns())
            let halfOfPoolWidth = (((checkboxBuilderConfig.checkboxSize.width * numberOfColumns) + (borderPadding * numberOfColumns)) / 2.0)
            let halfOfHeaderLabelWidth = (headerLabel.frame.size.width / 2)
            headerLabel.frame = CGRect(origin: CGPoint(x: checkboxBuilderConfig.startPosition.x + (halfOfPoolWidth - halfOfHeaderLabelWidth),
                                                       y: checkboxBuilderConfig.startPosition.y),
                                       size: headerLabel.frame.size)
            let lineInitialPositionY = (checkboxBuilderConfig.startPosition.y + (headerLabel.frame.size.height / 2))
            self.nextOriginY = lineInitialPositionY + borderPadding
            let poolHeight = CGFloat(numberOfCheckboxesInFirstColumn(totalNumberOfCheckboxes: statesCount)) * checkboxBuilderConfig.checkboxSize.height
            var borderPath = UIBezierPath()
            
            if checkboxPool.borderStyle == .Solid {
                borderPath = UIBezierPath(roundedRect: CGRect(x: checkboxBuilderConfig.startPosition.x,
                                                              y: lineInitialPositionY,
                                                              width: halfOfPoolWidth * 2,
                                                              height: poolHeight),
                                          cornerRadius: 0)
                borderPath.close()
            } else if checkboxPool.borderStyle == .SolidWithRoundedCorners {
                borderPath = UIBezierPath(roundedRect: CGRect(x: checkboxBuilderConfig.startPosition.x,
                                                              y: lineInitialPositionY,
                                                              width: halfOfPoolWidth * 2,
                                                              height: poolHeight),
                                          cornerRadius: checkboxBuilderConfig.borderCornerRadius)
                borderPath.close()
            }
            
            let borderShape = CAShapeLayer()
            borderShape.path = borderPath.cgPath
            borderShape.fillColor = UIColor.clear.cgColor
            borderShape.strokeColor = checkboxBuilderConfig.borderColor.cgColor
            borderShape.lineWidth = checkboxBuilderConfig.borderWidth
            canvas?.layer.addSublayer(borderShape)
            canvas?.addSubview(headerLabel)
        }
    }
    
    // MARK: - Private
    private func configureHeaderLabel() {
        
        if let title = checkboxBuilderConfig.headerTitle {
            headerLabel.textColor = UIColor.black
            headerLabel.text = " \(title) "
            headerLabel.sizeToFit()
            headerLabel.backgroundColor = canvas?.backgroundColor
        } else {
            headerLabel.text = nil
        }
    }
    
    private func calculateNextPositionX(forCheckboxAtIndex index: Int, andNumberOfCheckboxes checkboxesCount: Int) {
        
        switch checkboxPool.style {
            
        case .TwoColumns:

            if index == numberOfCheckboxesInFirstColumn(totalNumberOfCheckboxes: checkboxesCount) {
                nextOriginX = nextOriginX + checkboxBuilderConfig.checkboxSize.width + borderPadding
            }
            
        default:
            ()
        }
    }
    
    private func calculateNextPositionY(forCheckboxAtIndex index: Int, andNumberOfCheckboxes checkboxesCount: Int) {
        
        switch checkboxPool.style {
            
        case .OneColumn:
            nextOriginY += checkboxBuilderConfig.checkboxSize.height
            
        case .TwoColumns:

            if index == numberOfCheckboxesInFirstColumn(totalNumberOfCheckboxes: checkboxesCount) {
                nextOriginY = (checkboxBuilderConfig.startPosition.y + (headerLabel.frame.size.height / 2)) + borderPadding
            } else {
                nextOriginY += checkboxBuilderConfig.checkboxSize.height
            }
        }
    }
    
    private func numberOfCheckboxesInFirstColumn(totalNumberOfCheckboxes count: Int) -> Int {
        let checkboxCount = (Float(count) / Float(checkboxPool.numberOfColumns()))
        // If number of checkboxes is 3, then checkboxCount is equal to 1.5 
        // after it's rounded we get 2 checkboxes for first column (and 1 for second column)
        let fixedCheckboxCount = round(checkboxCount)
        return Int(fixedCheckboxCount)
    }
}
