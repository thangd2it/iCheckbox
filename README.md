iCheckbox [![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/mancunianetz/iCheckbox/master/LICENSE)
========

A custom checkbox component for iOS apps, written in Swift 3.0.
Checkboxes can be ordered in one or two columns, can have solid borders with or without rounded corners, single or multiple selections, etc. iCheckbox works with iOS 8 and newer, also can be used in an Objective-C project.

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

Install manually
------
1. Drag the `iCheckbox.xcodeproj` to your project. Go to app target's settings, press the "+" under the `Embedded Binaries` section, and select the `iCheckbox.framework`
2. Add `@import iCheckbox` in your class.

Install using Cocoapods
------
CocoaPods manages library dependencies for your Xcode projects. If you haven't used it before, take a look [here](https://guides.cocoapods.org/using/getting-started.html).

1. Add `pod 'iCheckbox'` to your `Podfile`.
2. Run `pod install`.

Note: If this is very first pod installed in your project don't
forget to open `.xcworkspace` file not `.xcodeproj`.

Install using Carthage
-----


Getting Started
------
Using iCheckbox is straightforward. Use `iCheckboxBuilderConfig` to create a configuration instance for the `iCheckboxBuilder` which will render checkboxes. `iCheckboxBuilderConfig` contains values to setup checkbox title color, checkbox states images, checkbox pool border, etc. Except `iCheckboxBuilderConfig`, `iCheckboxBuilder` takes a series of `iCheckboxState`s, each of them describing a checkbox, it's title and selected state. To get notified when a checkbox is tapped, interested class must implement `iCheckboxDelegate`'s didSelectCheckbox() method.

Full examples:

**Swift**
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
**Objective-C**
```
#import "ViewController.h"
@import iCheckbox;

@interface ViewController () <iCheckboxDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    iCheckboxBuilderConfig *buiderConfig = [[iCheckboxBuilderConfig alloc] init];
    buiderConfig.headerTitle = @"Some Title";
    iCheckboxBuilder *builder = [[iCheckboxBuilder alloc] initWithCanvas:self.view
                                                               andConfig:buiderConfig];
    builder.delegate = self;

    iCheckboxState *firstCheckbox = [[iCheckboxState alloc] initWithTitle:@"First"
                                                                 selected:NO];
    iCheckboxState *secondCheckbox =  [[iCheckboxState alloc] initWithTitle:@"Second"
                                                                  selected:NO];
    iCheckboxState *thirdCheckbox =  [[iCheckboxState alloc] initWithTitle:@"Third"
                                                                  selected:NO];
    iCheckboxState *fourthCheckbox =  [[iCheckboxState alloc] initWithTitle:@"Four"
                                                                  selected:NO];
    iCheckboxState *fifthCheckbox =  [[iCheckboxState alloc] initWithTitle:@"Five"
                                                                  selected:NO];
    iCheckboxState *sixthCheckbox =  [[iCheckboxState alloc] initWithTitle:@"Six"
                                                                  selected:NO];
    iCheckboxState *seventhCheckbox =  [[iCheckboxState alloc] initWithTitle:@"Seven"
                                                                  selected:NO];
    [builder addCheckboxesWithStates:@[firstCheckbox,
                                       secondCheckbox,
                                       thirdCheckbox,
                                       fourthCheckbox,
                                       fifthCheckbox,
                                       sixthCheckbox,
                                       seventhCheckbox]];
}

- (void)didSelectCheckboxWithState:(BOOL)state identifier:(NSInteger)identifier andTitle:(NSString *)title
{
    NSLog(@"Checkbox %@, has selected state: %d", title, state);
}

@end
```

TODO
-----
* Add support for OSX, tvOS and watchOS.
* More customization options.
* Add unit tests.
* Add Carthage support.

Contact
------
If you detect any issues or want a feature to be added, create [an issue](https://github.com/mancunianetz/iCheckbox/issues) or generate a pull request.
Alternatively you can contact me on [twitter](https://twitter.com/mancunianetz).

License
------

Copyright (c) 2016 Stefan Godoroja. iCheckbox is released under the [MIT License](https://raw.githubusercontent.com/mancunianetz/iCheckbox/master/LICENSE).
