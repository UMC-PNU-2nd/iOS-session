//
//  UIView+Extension.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/03/29.
//

import Foundation
import UIKit

@IBDesignable
extension UIView{
    //인스펙터로 활용할 수 있다
    @IBInspectable var cornerRadius: CGFloat{
        get { //값을 읽어올 때
            return layer.cornerRadius
        }
        set { //값을 세팅해줄 때는 newValue로 입력받고 UIView에 넣어준다
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
