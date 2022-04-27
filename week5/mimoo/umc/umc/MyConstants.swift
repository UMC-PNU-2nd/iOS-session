//
//  Constants.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/04.
//

import UIKit

struct FontSize {
    static let small:Double = 14.0
    static let middle:Double = 17.0
    static let big:Double = 20.0
}

struct Colors {
    static let backgroundColor:UIColor? = UIColor(named: "colors/backgroundColor")
    static let actibatedBtnColor:UIColor? = UIColor(named: "colors/actibatedBtnColor")
    static let disabledBtnColor:UIColor? = UIColor(named: "colors/disabledBtnColor")
    static let textBtnLabelColor:UIColor? = UIColor(named: "colors/textBtnLabelColor")
    static let dividerColor:UIColor? = UIColor(named: "colors/dividerColor")
}

struct AnimateDuration {
    static let normal:TimeInterval = 0.4
}

struct IconSize {
    static let middle:CGSize = CGSize(width: 20.0, height: 20.0)
}

struct ProfileImageSize {
    static let small:CGSize = CGSize(width: 35.0, height: 35.0)
    static let middle:CGSize = CGSize(width: 55.0, height: 55.0)
    static let big:CGSize = CGSize(width: 100.0, height: 100.0)
}

struct StoryCellSize {
    static let width:CGFloat = 75.0
    static let height:CGFloat = 95.0
    static let profileImageBtnWidth:CGFloat = 65.0
    static let profileImage:CGSize = CGSize(width: 55.0, height: 55.0)
}

struct CornerRadius {
    static let small:Double = 5.0
    static let middle:Double = 10.0
}

struct Spacing {
    static let middle:Double = 10.0
}
