
# Squircle



[![Build Status](https://www.bitrise.io/app/2736aa1acbc2546f/status.svg?token=q3ZW_AHeagHDjYtl366wNQ)](https://www.bitrise.io/app/2736aa1acbc2546f) [![Version](https://img.shields.io/cocoapods/v/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![License](https://img.shields.io/cocoapods/l/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![Platform](https://img.shields.io/cocoapods/p/Squircle.svg?style=flat)](http://cocoapods.org/pods/Squircle) [![Documentation](https://AlphaSheeps.github.io/Squircle/badge.svg)](https://AlphaSheeps.github.io/Squircle/)



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





## License



Squircle is available under the MIT license. See the LICENSE file for more info.
