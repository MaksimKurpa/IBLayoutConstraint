# IBLayoutConstraint
📏 Configure constraints for each device in Interface Builder with IBLayoutConstraint.
<p align="left">
  <p align="left">
    <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat"></a>
    <a href="https://github.com/MaksimKurpa/Linker"><img src="https://img.shields.io/cocoapods/p/Linker.svg"></a>
    <a href="https://github.com/MaksimKurpa/Linker"><img src="https://img.shields.io/cocoapods/v/Linker.svg"></a>
	<a href="https://raw.githubusercontent.com/Linker/master/LICENSE"><img src="https://img.shields.io/cocoapods/l/Linker.svg"></a>
  </p>
</p>

## Requirements
IBLayoutConstraint is written in Swift 5.0 and is available on iOS/Mac Catalyst 11.0 or higher.

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate IBLayoutConstraint into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://cdn.cocoapods.org/'
platform :ios, '11.0'

pod 'IBLayoutConstraint'
```

Then, run the following command:

```bash
$ pod install
```

</details>

## Introduction

The main thought of this framework is convinient way to configure constraint for each device in Interface Builder.
Sometimes we need to change `constant`/`multiplier` value for `NSLayoutConstraint` only for specific device, for example, for iPhone 5s (4").
If this `UIView` with layout has special constraint for one device, we should do:

1. incheritance from `UIView`
2. add `outlet` to this view `@IBOutlet weak private var someConstraint: NSLayoutConstraint!` 
3. add some code to change constraint value for specific device 
```Swift
if UIDevice.current.isIPhone5() {
     someConstraint.constant = 290
}
```

IBLayoutConstraint will takes responsibity for this cases.

## How to use

<h5> (!) Notice: This approach isn't quite obvious, and you should notify and admit usafe in documentation of your project.
 </h5>

1. Find `constraint` for configuration in Interface Builder View in Xcode.
2. Go to `Indentity Inspector` for this `constraint` in right-side panel.
3. Change Class `NSLayoutConstraint` to `IBLayoutConstraint`

    If you want to specify `multiplier` value or `constraint`and `multiplier` toghether, you should use `IBMultiplierLayoutConstraint`.

4. Go to `Attributes Inspector` for this `constraint` in right-side panel. You'll see:

##### IBLayoutConstraint
This is your standard linear gradient blending between color stops from the start point to the end point.

<div align="center">
    <img width="388" height="454" src="https://github.com/MaksimKurpa/IBLayoutConstraint/raw/master/docs/ib_screen_1.png" alt="IBLayoutConstraint">
</div>

#### IBMultiplierLayoutConstraint
<div align="center">
    <img width="380" height="331" src="https://github.com/MaksimKurpa/IBLayoutConstraint/raw/master/docs/ib_screen_2.png" alt="IBLayoutConstraint">
</div>

5. Find the screen size in inches that matches your need. You'll see two textfields:

   `Width` - value for landscape mode
   
   `Height` - value for portrait mode
   
   Fill the text fields. The necessary value will be applied after initialization and will change accordingly after device rotation.
   
##### Note: You don't need specify values for all sizes,but you need specify values for 'width' and 'height' in one line - it is required (even if you don't support rotation). If values don't specified for some size - IBLayoutConstraint will work as NSLayoutConstraint.

## Contributing

Issues and pull requests are welcome!

## Author

Maksim Kurpa - [@maksim_kurpa](https://twitter.com/maksim_kurpa)

## License

This code is distributed under the terms and conditions of the [MIT license](https://raw.githubusercontent.com/MaksimKurpa/IBLayoutConstraint/master/LICENSE). 
