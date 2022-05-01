//
//  Color+ Extension.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/03/28.
//

import Foundation
import UIKit

extension UIColor{
    static let facebookColor = UIColor(
        red: 0.255,
        green: 0.576,
        blue: 0.947,
        alpha: 1.0)
    
    static let disabledButtonColor = UIColor(
        red: 0.776,
        green: 0.872,
        blue: 0.980,
        alpha: 1.0)
}


// 정규표현식
extension String{
    // 대문자, 소문자, 특수문자, 숫자, 8자 이상 -> 비밀번호
    func isValidPassword() -> Bool {
        let pwRegex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}"
        let pwTest = NSPredicate.init(format: "SELF MATCHES %@", pwRegex)
        return pwTest.evaluate(with: self)
    }
    
    // @2글자
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
}
