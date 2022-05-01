//
//  User.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/03.
//

import Foundation

struct SignupModel {
    var email: String = ""
    var name: String = ""
    var username: String = ""
    var password: String = ""
}

extension SignupModel {
    var isValid: Bool {
        return isEmailValid && isNameValid && isUsernameValid && isPasswordValid
    }
    var isEmailValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    var isNameValid: Bool { return name != "" }
    var isUsernameValid: Bool { return username != "" }
    var isPasswordValid: Bool { return password != "" }
}
