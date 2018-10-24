
# Squircle



[![Build Status](https://travis-ci.org/neobeppe/Squircle.svg?branch=master)](https://travis-ci.org/neobeppe/Squircle) [![Version](https://img.shields.io/cocoapods/v/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![License](https://img.shields.io/cocoapods/l/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![Platform](https://img.shields.io/cocoapods/p/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![Coverage Status](https://coveralls.io/repos/github/neobeppe/Squircle/badge.svg?branch=swift4.2)](https://coveralls.io/github/neobeppe/Squircle?branch=master)



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation



Squircle is available through [CocoaPods](http://cocoapods.org). To install

it, simply add the following line to your Podfile:



```ruby

pod 'Squircle'

```



## Usage

Squircle is an UIView extension, and can be used in different ways:


```swift
let view = UIView()
view.squircle()
```

just apply conventional squircle radius to the view. If the view is a square, i'll obtain the same effect as iOS springboard icons, if it's a rectangle i'll obtain rounded corners based on a square built on smallest side.

```swift
let view = UIView()
view.squircle(with: radius)
```

permits you to define a radius, similar to iOS corner radius. If the radius is bigger than smallest side length multiplied by 4.7, `radius` parameter will be ignored.


Squircle is also an CALayer extension, permitting you to add a squircle mask directly on a layer.
Rules are the same as the UIView methods, invocation is:

```swift
let layer = CALayer()
layer.applySquircle(with: radius)
```

## License



Squircle is available under the MIT license. See the LICENSE file for more info.
