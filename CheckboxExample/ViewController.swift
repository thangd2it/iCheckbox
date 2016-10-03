//
//  ViewController.swift
//  iCheckboxDemo
//
//  Created by Ștefan Godoroja on 8/9/14.
//  Copyright (c) 2014 Demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, iCheckboxDelegate {

    let checkboxTitles = ["First option", "Second option", "Third option"]

    override func viewDidLoad() {
        super.viewDidLoad()
        addCheckboxes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func addCheckboxes() {
        let checkboxBuilderConfig = iCheckboxBuilderConfig()
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
        
        checkboxBuilder.addCheckboxes(withStates: [firstCheckboxState, secondCheckboxState, thirdCheckboxState, fourthCheckboxState],
                                      andSelectionType: .Single)
    }

    func didSelectCheckbox(withState state: Bool, identifier: Int, andTitle title: String) {
        print("Checkbox '\(title)', has selected state: \(state)")
    }
}
