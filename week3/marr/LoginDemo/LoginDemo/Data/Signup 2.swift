//
//  Signup.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/03/30.
//

import Foundation

class Signup: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var userId: String = ""
    @Published var password: String = ""
    
    func getUser() -> String {
        return self.email
    }
    
    func isValid() -> Bool {
        return email != "" && username != "" && userId != "" && password != ""
    }
}

