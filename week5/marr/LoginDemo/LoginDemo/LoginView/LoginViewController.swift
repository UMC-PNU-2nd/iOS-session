//
//  ViewController.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/01.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

protocol SignupDataDelegate {
    func getSignupData()
}

class LoginViewController: UIViewController {
    let disposeBag = DisposeBag()
    let loginViewModel = LoginViewModel()
    
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_catstagram_logo")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let emailInputField = getInputTextField(placeholder: "이메일")
    
    let passwordInput = getInputTextField(placeholder: "비밀번호").then {
        $0.isSecureTextEntry = true
    }
    
    let loginButton = UIButton().then {
        let facebookColor = UIColor(named: "Facebook_color") ?? UIColor.blue
        $0.setBackgroundColor($0.isEnabled ? facebookColor : facebookColor.withAlphaComponent(0.25), for: .normal)
        $0.setBackgroundColor(facebookColor.withAlphaComponent(0.625), for: .highlighted)
        $0.isEnabled = false
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 2.5
    }
    
    let facebookLoginButton = UIButton().then {
        let facebookColor = UIColor(named: "Facebook_color") ?? UIColor.blue
        $0.setBackgroundColor(facebookColor, for: .normal)
        $0.setBackgroundColor(facebookColor.withAlphaComponent(0.625), for: .highlighted)
        
        $0.setImage(UIImage(systemName: "f.square.fill"), for: .normal)
        $0.setTitle(" Facebook으로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 2.5
        $0.semanticContentAttribute = .forceLeftToRight

    }
    
    let dividerWithText = UILabel().then {
        $0.text = "또는"
        $0.textColor = .gray
        $0.backgroundColor = .systemBackground
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
    }
    
    let signUpLink = UILabel().then {
        $0.text = "계정이 없으신가요? 가입하기"
        $0.textColor = .systemBlue
        $0.backgroundColor = .systemBackground
        $0.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = true
    }
    
    @objc func signUpLinkOnClick() {
        let signupViewController = SignupViewController()
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
    
    @objc
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLogoImage()
        configureEmailInputView()
        configurePasswordInputView()
        configureLoginButton()
        configureHorizontalDivierWithText()
        configureFacebookLoginButton()
        configureSignUpLink()
        setBindings()
    }
    
    func setBindings() {
        Observable.combineLatest(emailInputField.rx.text, passwordInput.rx.text).map {
            var loginModel = LoginModel()
            loginModel.email = $0!
            loginModel.password = $1!
            return loginModel
        }.bind(to: loginViewModel.loginSubject)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid.bind {
            if $0 == true {
                self.loginButton.isEnabled = true
            } else {
                self.loginButton.isEnabled = false
            }
        }.disposed(by: disposeBag)
    }
    
    func configureSignUpLink() {
        let horizontalDivider = UIView().then {
            $0.backgroundColor = .gray
        }
        
        view.addSubview(signUpLink)
        signUpLink.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
        view.addSubview(horizontalDivider)
        horizontalDivider.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.bottom.equalTo(signUpLink.snp.top).offset(-15)
            $0.height.equalTo(1.25)
        }
        
        signUpLink.addGestureRecognizer(UITapGestureRecognizer(
            target: self, action:  #selector(signUpLinkOnClick)))
    }
    
    func configureFacebookLoginButton() {
        view.addSubview(facebookLoginButton)
        facebookLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(dividerWithText.snp.bottom).offset(30)
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.height.equalTo(passwordInput.snp.height).multipliedBy(1.075)
        }
    }
    
    func configureHorizontalDivierWithText() {
        let emptyView = UIView()
        let horizontalDivider = UIView().then {
            $0.backgroundColor = .gray
        }
        view.addSubview(emptyView)
        view.addSubview(horizontalDivider)
        view.addSubview(dividerWithText)
        
        emptyView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.width.equalToSuperview().multipliedBy(0.9)
        }
        
        horizontalDivider.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(emptyView)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalTo(1.25)
        }
        
        dividerWithText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(emptyView)
            $0.width.equalToSuperview().multipliedBy(0.15)
        }
    }
    
    func configureLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordInput.snp.bottom).offset(30)
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.height.equalTo(passwordInput.snp.height).multipliedBy(1.075)
        }
    }
    
    func configureLogoImage() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.75/1)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
    }
    
    func configureEmailInputView() {
        view.addSubview(emailInputField)
        
        emailInputField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
    }
    
    func configurePasswordInputView() {
        view.addSubview(passwordInput)
        passwordInput.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.top.equalTo(emailInputField.snp.bottom).offset(20)
        }
    }
    
}

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = LoginViewController
    
    func makeUIViewController(context: Context) -> LoginViewController {
        return LoginViewController()
    }
    
    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {}
}

struct ViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
                .previewDisplayName("iPhone 13 Pro")
            
            ViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}



