//
//  ViewController.swift
//  iCheckboxDemo
//
//  Created by Stefan Godoroja on 10/6/16.
//  Copyright © 2016 Godoroja Stefan. All rights reserved.
//

import UIKit

//
//  ViewController.swift
//  iCheckboxDemo
//
//  Created by Ștefan Godoroja on 8/9/14.
//  Copyright (c) 2014 Demo. All rights reserved.
//

import UIKit
import iCheckbox

class ViewController: UIViewController, iCheckboxDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCheckboxes()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addCheckboxes() {
        var checkboxBuilderConfig = iCheckboxBuilderConfig()
        checkboxBuilderConfig.headerTitle = "Some title"
        
        let checkboxBuilder = iCheckboxBuilder(withCanvas: self.view, andConfig: checkboxBuilderConfig)
        checkboxBuilder.delegate = self
        
        var firstCheckboxState = iCheckboxState()
        firstCheckboxState.title = "One"
        var secondCheckboxState = iCheckboxState()
        secondCheckboxState.title = "Two"
        var thirdCheckboxState = iCheckboxState()
        thirdCheckboxState.title = "Three"
        var fourthCheckboxState = iCheckboxState()
        fourthCheckboxState.title = "Four"
        var fifthCheckboxState = iCheckboxState()
        fifthCheckboxState.title = "Five"
        var sixthCheckboxState = iCheckboxState()
        sixthCheckboxState.title = "Six"
        var seventhCheckboxState = iCheckboxState()
        seventhCheckboxState.title = "Seven"
        checkboxBuilder.addCheckboxes(withStates: [firstCheckboxState,
                                                   secondCheckboxState,
                                                   thirdCheckboxState,
                                                   fourthCheckboxState,
                                                   fifthCheckboxState,
                                                   sixthCheckboxState,
                                                   seventhCheckboxState])
    }
    
    func didSelectCheckbox(withState state: Bool, identifier: Int, andTitle title: String) {
        print("Checkbox '\(title)', has selected state: \(state)")
    }
}

