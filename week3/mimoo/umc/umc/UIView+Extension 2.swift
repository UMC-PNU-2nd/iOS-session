//
//  UIView+Extension.swift
//  umc
//
//  Created by Yujin Cha on 2022/03/30.
//

import SwiftUI

extension View {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
