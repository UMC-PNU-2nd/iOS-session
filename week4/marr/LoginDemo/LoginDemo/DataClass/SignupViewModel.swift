//
//  SignupViewModel.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/03.
//

import Foundation

class SignupViewModel {
    var signupData: SignupData
    
    init() { signupData = SignupData() }
    
    var isValid: Bool {
        return isEmailValid && isNameValid && isUsernameValid && isPasswordValid
    }
    var isEmailValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: signupData.email)
    }
    var isNameValid: Bool { return signupData.name != "" }
    var isUsernameValid: Bool { return signupData.username != "" }
    var isPasswordValid: Bool { return signupData.password != "" }
}
