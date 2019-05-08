
# Squircle

[![Documentation](http://travasoni.com/Squircle/badge.svg)](http://travasoni.com/Squircle) [![Build Status](https://travis-ci.org/neobeppe/Squircle.svg?branch=master)](https://travis-ci.org/neobeppe/Squircle) [![Version](https://img.shields.io/cocoapods/v/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![License](https://img.shields.io/cocoapods/l/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![Platform](https://img.shields.io/cocoapods/p/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![Coverage Status](https://coveralls.io/repos/github/neobeppe/Squircle/badge.svg)](https://coveralls.io/github/neobeppe/Squircle?branch=master)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

Squircle is available through [CocoaPods](http://cocoapods.org). To install

it, simply add the following line to your Podfile:

```ruby

pod 'Squircle'

```

## Usage

### Squircle

Squircle is an UIView extension, and can be used in different ways:


```swift
let view = UIView()
view.squircle()
```

just apply conventional squircle radius to the view. If the view is a square, i'll obtain the same effect as iOS springboard icons, if it's a rectangle i'll obtain rounded corners based on a square built on smallest side.

Squircle is also an CALayer extension, permitting you to add a squircle mask directly on a layer.
Rules are the same as the UIView methods, invocation is:

```swift
let layer = CALayer()
layer.applySquircle()
```

### Squircle with border

If you want to apply squircle with a border use the dedicated methods:


```swift
let view = UIView()
view.squircleWithBorder(width: CGFloat, color: UIColor)
```

```swift
let layer = CALayer()
layer.applySquircleWithBorder(width: CGFloat, color: UIColor)
```

### Remove squircle

To remove the squircle from a UIView:


```swift
view.removeSquircle()
```

or directly on CALayer:


```swift
layer.removeSquircle()
```

If a border has been added to the squircle, both functions above will remove it too.


### Remove border

To remove only the border from a squircle:


```swift
view.removeSquircleBorder()
```

or directly on CALayer:


```swift
layer.removeSquircleBorder()
```


## License

Squircle is available under the MIT license. See the LICENSE file for more info.
