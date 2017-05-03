//
//  ViewController.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/6/16.
//  Copyright © 2016 Godoroja Stefan. All rights reserved.
//

import UIKit
import iCheckbox

class ViewController: UIViewController, iCheckboxDelegate {
    
    var group: iCheckboxGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCheckboxes()
    }
    

    func addCheckboxes() {
        let checkboxBuilderConfig = iCheckboxBuilderConfig()
        checkboxBuilderConfig.headerTitle = "Some title"
        
        let checkboxBuilder = iCheckboxBuilder(withCanvas: self.view, andConfig: checkboxBuilderConfig)
        checkboxBuilder.delegate = self
        
        let firstCheckboxState = iCheckboxState()
        firstCheckboxState.title = "One"
        let secondCheckboxState = iCheckboxState()
        secondCheckboxState.title = "Two"
        let thirdCheckboxState = iCheckboxState()
        thirdCheckboxState.title = "Three"
        let fourthCheckboxState = iCheckboxState()
        fourthCheckboxState.title = "Four"
        let fifthCheckboxState = iCheckboxState()
        fifthCheckboxState.title = "Five"
        let sixthCheckboxState = iCheckboxState()
        sixthCheckboxState.title = "Six"
        let seventhCheckboxState = iCheckboxState()
        seventhCheckboxState.title = "Seven"
        checkboxBuilder.addCheckboxes(withStates: [firstCheckboxState,
                                                   secondCheckboxState,
                                                   thirdCheckboxState,
                                                   fourthCheckboxState,
                                                   fifthCheckboxState,
                                                   sixthCheckboxState,
                                                   seventhCheckboxState])
        
        group = checkboxBuilder.build()
    }
    
    func didSelectCheckbox(withState state: Bool, identifier: Int, andTitle title: String) {
        print("Checkbox with tag \(identifier) has '\(title)', has selected state: \(state)")
        group.changeAnswerState(ofCheckbox: identifier, state: state ? .right : .wrong)
    }
}

