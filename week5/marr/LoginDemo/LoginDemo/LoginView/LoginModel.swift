//
//  LoginModel.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/07.
//

import Foundation

struct LoginModel {
    var email: String = ""
    var password: String = ""
}

extension LoginModel {
    var isValid: Bool {
        return !email.isEmpty && !password.isEmpty
    }
}
