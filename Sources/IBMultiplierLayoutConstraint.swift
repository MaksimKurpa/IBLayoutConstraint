//
//  IBMultiplierLayoutConstraint.swift
//  IBLayoutConstraint
//
//  Created by Maks Kurpa on 4/3/20.
//  Copyright © 2020 Maks Kurpa. All rights reserved.
//

import UIKit

class IBMultiplierLayoutConstraint: IBLayoutConstraint {
    
    private var isPortrait: Bool?
    
    @objc override func orientationDidChange(_ note: Notification?) {
        super.orientationDidChange(note)
        performSelector(onMainThread: #selector(setup), with: nil, waitUntilDone: false)
    }
    
    @objc override func setup() {
        super.setup()
        if isPortrait == UIDevice.isPortrait {
            return
        }
        isPortrait = UIDevice.isPortrait
        
        if let multiplierValue = self.multiplierValue(), multiplierValue != self.multiplier {
            IBMultiplierLayoutConstraint.changeMultiplier(self, multiplier: multiplierValue)
        }
    }
    
    private var inch40_mltplr: CGSize?
    private var inch47_mltplr: CGSize?
    private var inch55_mltplr: CGSize?
    private var inch58_mltplr: CGSize?
    private var inch61_mltplr: CGSize?
    private var inch65_mltplr: CGSize?
    
    private var inch79_mltplr: CGSize?
    private var inch97_mltplr: CGSize?
    private var inch102_mltplr: CGSize?
    private var inch105_mltplr: CGSize?
    private var inch111_mltplr: CGSize?
    private var inch129_mltplr: CGSize?
    
    internal func multiplierValue() -> CGFloat? {
        let values: CGSize?
        switch UIDevice.currentScreen {
        case .inch40: values = inch40_mltplr
        case .inch47: values = inch47_mltplr
        case .inch55: values = inch55_mltplr
        case .inch58: values = inch58_mltplr
        case .inch61: values = inch61_mltplr
        case .inch65: values = inch65_mltplr
        case .inch79: values = inch79_mltplr
        case .inch97: values = inch97_mltplr
        case .inch102: values = inch102_mltplr
        case .inch105: values = inch105_mltplr
        case .inch111: values = inch111_mltplr
        case .inch129: values = inch129_mltplr
        case .unknown: values = CGSize(width: self.multiplier, height: self.multiplier)
        }
        return UIDevice.isPortrait ? values?.height : values?.width
    }
    
    private func setMultiplierValue(_ value: CGSize ,for screen: UIDevice.Screen){
        switch screen {
        case .inch40: inch40_mltplr = value
        case .inch47: inch47_mltplr = value
        case .inch55: inch55_mltplr = value
        case .inch58: inch58_mltplr = value
        case .inch61: inch61_mltplr = value
        case .inch65: inch65_mltplr = value
        case .inch79: inch79_mltplr = value
        case .inch97: inch97_mltplr = value
        case .inch102: inch102_mltplr = value
        case .inch105: inch105_mltplr = value
        case .inch111: inch111_mltplr = value
        case .inch129: inch129_mltplr = value
        case .unknown: break
        }
        if screen == UIDevice.currentScreen {
            let multiplier = UIDevice.isPortrait ? value.height : value.width
            self.setValue(multiplier, forKey: "multiplier")
            IBMultiplierLayoutConstraint.changeMultiplier(self, multiplier: multiplier)
        }
    }
    
}

extension IBMultiplierLayoutConstraint {
    
    @IBInspectable var _40ˮ_multiplayer: CGSize {
        get { return inch40_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch40) }
    }
    
    @IBInspectable var _47ˮ_multiplayer: CGSize {
        get { return inch47_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch47) }
    }
    
    @IBInspectable var _55ˮ_multiplayer: CGSize {
        get { return inch55_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch55) }
    }
    
    @IBInspectable var _58ˮ_multiplayer: CGSize {
        get { return inch58_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch58) }
    }
    
    @IBInspectable var _61ˮ_multiplayer: CGSize {
        get { return inch61_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch61) }
    }
    
    @IBInspectable var _65ˮ_multiplayer: CGSize {
        get { return inch65_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch65) }
    }
    
    @IBInspectable var _79ˮ_multiplayer: CGSize {
        get { return inch79_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch79) }
    }
    
    @IBInspectable var _97ˮ_multiplayer: CGSize {
        get { return inch97_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch97) }
    }
    
    @IBInspectable var _102ˮ_multiplayer: CGSize {
        get { return inch102_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch102) }
    }
    
    @IBInspectable var _105ˮ_multiplayer: CGSize {
        get { return inch105_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch105) }
    }
    
    @IBInspectable var _111ˮ_multiplayer: CGSize {
        get { return inch105_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch105) }
    }
    
    @IBInspectable var _129ˮ_multiplayer: CGSize {
        get { return inch129_mltplr ?? CGSize(width: multiplier, height: multiplier) }
        set { setMultiplierValue(newValue, for: .inch129) }
    }
}

extension IBMultiplierLayoutConstraint {
    
    static func changeMultiplier(_ constraint: IBMultiplierLayoutConstraint, multiplier: CGFloat) {
        if (String(format:"%.2f", constraint.multiplier) == String(format:"%.2f", multiplier) || multiplier == 0) {
            return
        }
        NSLayoutConstraint.deactivate([constraint])
        
        let newConstraint = IBMultiplierLayoutConstraint(
            item: constraint.firstItem as Any,
            attribute: constraint.firstAttribute,
            relatedBy: constraint.relation,
            toItem: constraint.secondItem,
            attribute: constraint.secondAttribute,
            multiplier: multiplier,
            constant: constraint.constant)
        
        newConstraint.priority = constraint.priority
        newConstraint.shouldBeArchived = true
        newConstraint.identifier = constraint.identifier
        
        newConstraint.inch40 = constraint.inch40
        newConstraint.inch47 = constraint.inch47
        newConstraint.inch55 = constraint.inch55
        newConstraint.inch58 = constraint.inch58
        newConstraint.inch61 = constraint.inch61
        newConstraint.inch65 = constraint.inch65
        
        newConstraint.inch79 = constraint.inch79
        newConstraint.inch97 = constraint.inch97
        newConstraint.inch47 = constraint.inch47
        newConstraint.inch105 = constraint.inch105
        newConstraint.inch111 = constraint.inch111
        newConstraint.inch129 = constraint.inch129
        
        newConstraint.inch40_mltplr = constraint.inch40_mltplr
        newConstraint.inch47_mltplr = constraint.inch47_mltplr
        newConstraint.inch55_mltplr = constraint.inch55_mltplr
        newConstraint.inch58_mltplr = constraint.inch58_mltplr
        newConstraint.inch61_mltplr = constraint.inch61_mltplr
        newConstraint.inch65_mltplr = constraint.inch65_mltplr
        
        newConstraint.inch79_mltplr = constraint.inch79_mltplr
        newConstraint.inch97_mltplr = constraint.inch97_mltplr
        newConstraint.inch47_mltplr = constraint.inch47_mltplr
        newConstraint.inch105_mltplr = constraint.inch105_mltplr
        newConstraint.inch111_mltplr = constraint.inch111_mltplr
        newConstraint.inch129_mltplr = constraint.inch129_mltplr
        
        NSLayoutConstraint.activate([newConstraint])
        newConstraint.setupObserver()
    }
}
