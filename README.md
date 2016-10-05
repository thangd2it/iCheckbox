iCheckbox
========

A custom checkbox component for iOS apps, written in Swift 3.0.
Checkboxes can be ordered in one or two columns, can have solid borders with or without rounded corners, single or multiple selections, etc.

See few examples:
> Single selection, two columns, rounded corners solid border with title

![ve49bsufoe](https://cloud.githubusercontent.com/assets/2619031/19113388/ac35c482-8b09-11e6-8068-3a586e90f897.gif)

> Single selection, two columns, solid border with title

![hpqth224qj](https://cloud.githubusercontent.com/assets/2619031/19113390/ac36191e-8b09-11e6-9d2b-09bb31d15d83.gif)

> Single selection, two columns, no border

![plnuwbl9nf](https://cloud.githubusercontent.com/assets/2619031/19113389/ac35f39e-8b09-11e6-8236-e2e17206d2ba.gif)

> Multiple selections, single column, no border

![multiple](https://cloud.githubusercontent.com/assets/2619031/19113392/ac3ac22a-8b09-11e6-8c18-11d0ed38e43e.gif)

Library offers checkbox/checkbox pool customization:

- Checkbox

  - Normal state title color
  - Selected state title color
  - Normal state image
  - Selected state image
  - Size


- Checkbox pool
  - Position on canvas
  - Selection type
  - Pool style
  - Border type
  - Border width
  - Border color
  - Border corner radius
  - Header title color

iCheckbox works with iOS 8 and newer.

Install using Cocoapods
------
[In Progress]

Install using Carthage
------
[In Progress]

Install manually
------
[In Progress]

Getting Started
------
Using iCheckbox is straightforward. Use `iCheckboxBuilderConfig` to create a configuration instance for the `iCheckboxBuilder` which will render checkboxes. `iCheckboxBuilderConfig` contains values to setup checkbox title color, checkbox states images, checkbox pool border, etc. For more details look in API section. Except `iCheckboxBuilderConfig`, `iCheckboxBuilder` takes a series of `iCheckboxState`s, each of them describing a checkbox, it's title and selected state. To get notified when a checkbox is tapped implemented `iCheckboxDelegate`'s didSelectCheckbox() method.

Example:

```
class ViewController: UIViewController, iCheckboxDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        addCheckboxes()
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
```

Contact
------
If you detect any issues or want a feature to be added, create [an issue](https://github.com/mancunianetz/iCheckbox/issues) or generate a pull request.
Alternatively you can contact me on [twitter](https://twitter.com/mancunianetz).

License
------
MIT License

Copyright (c) 2016 Stefan Godoroja

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
