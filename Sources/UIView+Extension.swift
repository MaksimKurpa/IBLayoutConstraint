//
//  UIView+Extension.swift
//  IBLayoutConstraint
//
//  Created by Maks Kurpa on 4/3/20.
//  Copyright © 2020 Maks Kurpa. All rights reserved.
//

import UIKit

extension UIView {
    static var safeAreaIndents: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets ?? .zero
        }
        return .zero
    }
}
