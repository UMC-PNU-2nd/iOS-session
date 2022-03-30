//
//  UIView+Extension.swift
//  LogIn
//
//  Created by 안현주 on 2022/03/30.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRatio: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
