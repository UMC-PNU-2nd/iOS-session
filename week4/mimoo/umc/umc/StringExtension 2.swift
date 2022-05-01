//
//  StringExtension.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/05.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValidation = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        return emailValidation.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        return passwordValidation.evaluate(with: self)
    }
}
