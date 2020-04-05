//
//  UIDevice+Extension.swift
//  IBLayoutConstraint
//
//  Created by Maks Kurpa on 4/3/20.
//  Copyright © 2020 Maks Kurpa. All rights reserved.
//

import UIKit

extension UIDevice {
    
    public enum Screen {
        case inch40
        case inch47
        case inch55
        case inch58
        case inch61
        case inch65
        
        case inch79
        case inch97
        case inch102
        case inch105
        case inch111
        case inch129
                
        case unknown
    }
    
    public enum Scale {
        case x1
        case x2
        case x3
        case unknown
    }
    
    public static var isIpad: Bool = {
        return UIDevice.current.userInterfaceIdiom == .pad
    }()
    
    public static var isPortrait: Bool {
        return UIApplication.shared.statusBarOrientation.isPortrait
    }
    
    public static var currentScreen: UIDevice.Screen =
    {
        let maxSide = max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)
        let mimSide = min(UIScreen.main.bounds.height, UIScreen.main.bounds.width)
        
        if maxSide == 568 { return .inch40 }
        else if maxSide == 667 { return .inch47 }
        else if maxSide == 736 { return .inch55 }
        else if maxSide == 812 { return .inch58 }
        else if maxSide == 896 && scale == .x2 { return .inch61 }
        else if maxSide == 896 && scale == .x3 { return .inch65 }
            
        else if maxSide == 1024, UIScreen.pointsPerCentimeter == 326 { return .inch79 }
        else if maxSide == 1024 { return .inch97 }
        else if maxSide == 1080 { return .inch105 }
        else if maxSide == 1112 { return .inch105 }
        else if maxSide == 1194 { return .inch111 }
        else if maxSide == 1366 { return .inch129 }
        else if maxSide == 960 { return .inch97}
        else { return .unknown }
    }()
    
    public static var scale: UIDevice.Scale = {
        let scale = Int(UIScreen.main.scale)
        if scale == 1 { return .x1 }
        else if scale == 2 { return .x2 }
        else if scale == 3 { return .x3 }
        else { return .unknown }
    }()
    
    static let modelIdentifier: String = {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] { return simulatorModelIdentifier }
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }()
}
