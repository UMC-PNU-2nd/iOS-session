//
//  SignupViewModel.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/03.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

class SignupViewModel {
    let disposeBag = DisposeBag()
    let signupSubject = BehaviorRelay<SignupModel?>(value: SignupModel())
    
    var isValid: Observable<Bool> {
        return signupSubject.map { signupData in
            return signupData!.isValid   
        }
    }
}

extension SignupViewModel {
    func bind(_ target: Signup, _ input: ControlProperty<String?>) {
        switch target {
        case .email:
            signupSubject.map { $0?.email }
                .distinctUntilChanged()
                .bind(to: input)
                .disposed(by: disposeBag)
        case .name:
            signupSubject.map { $0?.name }
                .distinctUntilChanged()
                .bind(to: input)
                .disposed(by: disposeBag)
        case .username:
            signupSubject.map { $0?.username }
                .distinctUntilChanged()
                .bind(to: input)
                .disposed(by: disposeBag)
        case .password:
            signupSubject.map { $0?.password }
                .distinctUntilChanged()
                .bind(to: input)
                .disposed(by: disposeBag)
        }
    }
}

enum Signup {
    case email
    case name
    case username
    case password
}
