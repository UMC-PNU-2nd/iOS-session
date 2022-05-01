//
//  Inputs.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/03.
//

import Foundation
import UIKit
import Then

func getInputTextField(placeholder: String) -> PaddedTextField  {
    let inputTextField = PaddedTextField().then {
        $0.placeholder = placeholder
        $0.layer.cornerRadius = 3
        $0.font = UIFont.systemFont(ofSize: 20.0, weight: .light)

        $0.layer.masksToBounds = true
        $0.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        $0.layer.borderWidth = 2

        $0.autocorrectionType = .no
        $0.autocapitalizationType = .none
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    return inputTextField
}
