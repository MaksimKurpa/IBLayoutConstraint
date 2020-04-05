//
//  IBLayoutConstraint.swift
//  IBLayoutConstraint
//
//  Created by Maks Kurpa on 4/3/20.
//  Copyright © 2020 Maks Kurpa. All rights reserved.
//


import UIKit

class IBLayoutConstraint: NSLayoutConstraint {
    
    internal let orientationNotification = UIDevice.orientationDidChangeNotification
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupObserver()
        setup()
    }
    
    func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange(_:)), name: orientationNotification, object: nil)
    }
    
    @objc func setup() {
        if let constantValue = self.constantValue() {
            self.constant = constantValue
        }
    }

    @objc func orientationDidChange(_ note: Notification?) {
        performSelector(onMainThread: #selector(setup), with: nil, waitUntilDone: false)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: orientationNotification, object: nil)
    }
    
    @IBInspectable var safeAreaVerticalDistinction: Bool = false {
        didSet {
            if safeAreaVerticalDistinction {
                let additional = UIView.safeAreaIndents.bottom
                self.constant = (self.constant + additional)
            }
        }
    }
    
    internal var inch40: CGSize?
    internal var inch47: CGSize?
    internal var inch55: CGSize?
    internal var inch58: CGSize?
    internal var inch61: CGSize?
    internal var inch65: CGSize?
    
    internal var inch79: CGSize?
    internal var inch97: CGSize?
    internal var inch102: CGSize?
    internal var inch105: CGSize?
    internal var inch111: CGSize?
    internal var inch129: CGSize?
    
    private func constantValue() -> CGFloat? {
        let values: CGSize?
        switch UIDevice.currentScreen {
        case .inch40: values = inch40
        case .inch47: values = inch47
        case .inch55: values = inch55
        case .inch58: values = inch58
        case .inch61: values = inch61
        case .inch65: values = inch65
        case .inch79: values = inch79
        case .inch97: values = inch97
        case .inch102: values = inch102
        case .inch105: values = inch105
        case .inch111: values = inch111
        case .inch129: values = inch129
        case .unknown: values = CGSize(width: self.constant, height: self.constant)
        }
        
        if UIDevice.isPortrait {
            if values?.height != constant, values?.height != 0 {
                return values?.height
            }
        } else {
            if values?.width != constant, values?.width != 0 {
                return values?.width
            }
        }
        return nil
    }
    
    private func setConstantValue(_ value: CGSize ,for screen: UIDevice.Screen){
        switch screen {
        case .inch40: inch40 = value
        case .inch47: inch47 = value
        case .inch55: inch55 = value
        case .inch58: inch58 = value
        case .inch61: inch61 = value
        case .inch65: inch65 = value
        case .inch79: inch79 = value
        case .inch97: inch97 = value
        case .inch102: inch102 = value
        case .inch105: inch105 = value
        case .inch111: inch111 = value
        case .inch129: inch129 = value
        case .unknown: break
            
        }
        if screen == UIDevice.currentScreen {
            let additional: CGFloat = self.safeAreaVerticalDistinction ? (UIView.safeAreaIndents.bottom) : 0
            self.constant = (additional + (UIDevice.isPortrait ? value.height : value.width))
        }
    }
}

extension IBLayoutConstraint {
    
    @IBInspectable var _40ˮ_constant: CGSize {
        get { return inch40 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch40) }
    }
    
    @IBInspectable var _47ˮ_constant: CGSize {
        get { return inch47 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch47) }
    }
    
    @IBInspectable var _55ˮ_constant: CGSize {
        get { return inch55 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch55) }
    }
    
    @IBInspectable var _58ˮ_constant: CGSize {
        get { return inch58 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch58) }
    }
    
    @IBInspectable var _61ˮ_constant: CGSize {
        get { return inch61 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch61) }
    }
    
    @IBInspectable var _65ˮ_constant: CGSize {
        get { return inch65 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch65) }
    }
    
    @IBInspectable var _79ˮ_constant: CGSize {
        get { return inch79 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch79) }
    }
    
    @IBInspectable var _97ˮ_constant: CGSize {
        get { return inch97 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch97) }
    }
    
    @IBInspectable var _102ˮ_constant: CGSize {
        get { return inch102 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch102) }
    }
    
    @IBInspectable var _105ˮ_constant: CGSize {
        get { return inch105 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch105) }
    }
    
    @IBInspectable var _111ˮ_constant: CGSize {
        get { return inch111 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch111) }
    }
    
    @IBInspectable var _129ˮ_constant: CGSize {
        get { return inch129 ?? CGSize(width: constant, height: constant) }
        set { setConstantValue(newValue, for: .inch129) }
    }
}

