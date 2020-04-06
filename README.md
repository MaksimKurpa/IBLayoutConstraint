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

4. Go to `Attributes Inspector` for this `constraint` in right-side panel.
(see sample Xcode project IBLayoutConstraint-Example)

## Contributing

Issues and pull requests are welcome!

## Author

Maksim Kurpa - [@maksim_kurpa](https://twitter.com/maksim_kurpa)

## License

This code is distributed under the terms and conditions of the [MIT license](https://raw.githubusercontent.com/MaksimKurpa/IBLayoutConstraint/master/LICENSE). 
