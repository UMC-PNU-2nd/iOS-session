//
//  LoginViewModel.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/07.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel {
    let disposeBag = DisposeBag()
    let loginSubject = BehaviorRelay<LoginModel?>(value: LoginModel())
    
    var isValid: Observable<Bool> {
        return loginSubject.map {
            return $0!.isValid
        }
    }
}

extension LoginViewModel {
    func bind(_ target: Login, _ input: ControlProperty<String?>) {
        switch target {
        case .email:
            loginSubject.map { $0?.email }
                .distinctUntilChanged()
                .bind(to: input)
                .disposed(by: disposeBag)
        case .password:
            loginSubject.map { $0?.password }
                .distinctUntilChanged()
                .bind(to: input)
                .disposed(by: disposeBag)
        }
    }
}

enum Login {
    case email
    case password
}
