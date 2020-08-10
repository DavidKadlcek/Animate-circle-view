# AnimateCircleView

[![CI Status](https://img.shields.io/travis/DavidKadlcek/AnimateCircleView.svg?style=flat)](https://travis-ci.org/DavidKadlcek/AnimateCircleView)
[![Version](https://img.shields.io/cocoapods/v/AnimateCircleView.svg?style=flat)](https://cocoapods.org/pods/AnimateCircleView)
[![License](https://img.shields.io/cocoapods/l/AnimateCircleView.svg?style=flat)](https://cocoapods.org/pods/AnimateCircleView)
[![Platform](https://img.shields.io/cocoapods/p/AnimateCircleView.svg?style=flat)](https://cocoapods.org/pods/AnimateCircleView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Screenshots
![screenshot of circle view](https://i.imgur.com/QMZ6ILv.png)

## Requirements

iOS 12.0 and above.

## Installation

AnimateCircleView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AnimateCircleView'
```

## Usage

The graph with circle and label is named `GraphView`. In `GraphView` there is an access to `AnimateLabel` and `CircleView` . 
In `CircleView` there are two layers  - `staticLayer` and `shapeLayer`. Only `shapeLayer` is animating.

I really recommend use this in `ViewController` to hide/show labels to smooth animation.
```swift
override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    coordinator.animate(alongsideTransition: { [weak self] _ in
        self?.graphView.showHideViews(show: false)
    }) { [weak self] _ in
        self?.graphView.showHideViews(show: true)
    }
}
```

## Author

DavidKadlcek, da.developer605@gmail.com

## License

AnimateCircleView is available under the MIT license. See the LICENSE file for more info.
