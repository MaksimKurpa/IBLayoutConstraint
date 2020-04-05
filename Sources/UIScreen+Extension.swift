//
//  UIScreen+Extension.swift
//  IBLayoutConstraint
//
//  Created by Maks Kurpa on 4/3/20.
//  Copyright © 2020 Maks Kurpa. All rights reserved.
//

import UIKit

private func computeIfSome<T: Any, S: Any>(optional: T?, computation: ((T) -> S)) -> S? { if let some = optional { return computation(some) } else { return .none } }

public extension UIScreen {
    
    /// The number of pixels per inch for this device
       static let pixelsPerInch: CGFloat? = {
           switch UIDevice.modelIdentifier {
           case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":             // iPad 2
               return 132
               
           case "iPad2,5", "iPad2,6", "iPad2,7":                        // iPad Mini
               return 163
               
           case "iPad3,1", "iPad3,2", "iPad3,3":            fallthrough // iPad 3rd generation
           case "iPad3,4", "iPad3,5", "iPad3,6":            fallthrough // iPad 4th generation
           case "iPad4,1", "iPad4,2", "iPad4,3":            fallthrough // iPad Air
           case "iPad5,3", "iPad5,4":                       fallthrough // iPad Air 2
           case "iPad6,7", "iPad6,8":                       fallthrough // iPad Pro (12.9 inch)
           case "iPad6,3", "iPad6,4":                       fallthrough // iPad Pro (9.7 inch)
           case "iPad6,11", "iPad6,12":                     fallthrough // iPad 5th generation
           case "iPad7,1", "iPad7,2":                       fallthrough // iPad Pro (12.9 inch, 2nd generation)
           case "iPad7,3", "iPad7,4":                       fallthrough // iPad Pro (10.5 inch)
           case "iPad7,5", "iPad7,6":                       fallthrough // iPad 6th generation
           case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": fallthrough // iPad Pro (11 inch)
           case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":             // iPad Pro (12.9 inch, 3rd generation)
               return 264
               
           case "iPhone4,1":                                fallthrough // iPhone 4S
           case "iPhone5,1", "iPhone5,2":                   fallthrough // iPhone 5
           case "iPhone5,3", "iPhone5,4":                   fallthrough // iPhone 5C
           case "iPhone6,1", "iPhone6,2":                   fallthrough // iPhone 5S
           case "iPhone8,4":                                fallthrough // iPhone SE
           case "iPhone7,2":                                fallthrough // iPhone 6
           case "iPhone8,1":                                fallthrough // iPhone 6S
           case "iPhone9,1", "iPhone9,3":                   fallthrough // iPhone 7
           case "iPhone10,1", "iPhone10,4":                 fallthrough // iPhone 8
           case "iPhone11,8":                               fallthrough // iPhone XR
           case "iPod5,1":                                  fallthrough // iPod Touch 5th generation
           case "iPod7,1":                                  fallthrough // iPod Touch 6th generation
           case "iPad4,4", "iPad4,5", "iPad4,6":            fallthrough // iPad Mini 2
           case "iPad4,7", "iPad4,8", "iPad4,9":            fallthrough // iPad Mini 3
           case "iPad5,1", "iPad5,2":                                   // iPad Mini 4
               return 326
               
           case "iPhone7,1":                                fallthrough // iPhone 6 Plus
           case "iPhone8,2":                                fallthrough // iPhone 6S Plus
           case "iPhone9,2", "iPhone9,4":                   fallthrough // iPhone 7 Plus
           case "iPhone10,2", "iPhone10,5":                             // iPhone 8 Plus
               return 401
               
           case "iPhone10,3", "iPhone10,6":                 fallthrough // iPhone X
           case "iPhone11,2":                               fallthrough // iPhone XS
           case "iPhone11,4", "iPhone11,6":                             // iPhone XS Max
               return 458
               
           default:                                                     // unknown model identifier
               return .none
           }
       }()
    
    /// The number of pixels per centimeter for this device
    static let pixelsPerCentimeter: CGFloat? = computeIfSome(optional: pixelsPerInch, computation: { $0 / 2.54 })
    
    /// The number of points per inch for this device
    static let pointsPerInch: CGFloat? = computeIfSome(optional: pixelsPerInch, computation: { $0 / main.nativeScale })
    
    /// The number of points per centimeter for this device
    static let pointsPerCentimeter: CGFloat? = computeIfSome(optional: pixelsPerCentimeter, computation: { $0 / main.nativeScale })
    
    /// The screen dimension in inches
    static let dimensionInInches: CGSize? = computeIfSome(optional: pixelsPerInch, computation: { CGSize(width: main.nativeBounds.width / $0, height: main.nativeBounds.height / $0) })
    
    /// The screen dimension in centimeters
    static let dimensionInCentimeters: CGSize? = computeIfSome(optional: pixelsPerCentimeter, computation: { CGSize(width: main.nativeBounds.width / $0, height: main.nativeBounds.height / $0) })
    
}

