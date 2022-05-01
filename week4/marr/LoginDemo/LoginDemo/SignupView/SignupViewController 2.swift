//
//  SignupViewController.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/03.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxSwift
import RxRelay
import RxCocoa

class SignupViewController: UIViewController {
    let disposeBag = DisposeBag()
    let signupViewModel = SignupViewModel()
    
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_catstagram_logo")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let facebookLoginButton = UIButton().then {
        let facebookColor = UIColor(named: "Facebook_color") ?? UIColor.blue
        $0.setBackgroundColor($0.isEnabled ? facebookColor : facebookColor.withAlphaComponent(0.25), for: .normal)
        $0.setBackgroundColor(facebookColor.withAlphaComponent(0.625), for: .highlighted)
        $0.setImage(UIImage(systemName: "f.square.fill"), for: .normal)
        $0.setTitle(" Facebook 계정으로 가입", for: .normal)
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
    
    let emailInputField = getInputTextField(placeholder: "휴대폰 번호 또는 이메일 주소")
    
    let nameInputField = getInputTextField(placeholder: "성명")
    let usernameInputField = getInputTextField(placeholder: "사용자 이름")
    let passwordInputField = getInputTextField(placeholder: "비밀번호").then {
        $0.isSecureTextEntry = true
    }
    
    let signupButton = UIButton().then {
        let facebookColor = UIColor(named: "Facebook_color") ?? UIColor.blue
        $0.setBackgroundColor($0.isEnabled ? facebookColor : facebookColor.withAlphaComponent(0.25), for: .normal)
        $0.setBackgroundColor(facebookColor.withAlphaComponent(0.625), for: .highlighted)
        $0.isEnabled = false
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 2.5
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureLogoImage()
        configureFacebookLoginButton()
        configureHorizontalDivierWithText()
        configureInputFields()
        configureSignupButton()
        setupBindings()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(back))
    }
    
    func setupBindings() {
        Observable.combineLatest(
            emailInputField.rx.text,
            nameInputField.rx.text,
            usernameInputField.rx.text,
            passwordInputField.rx.text
        )
        .map {
            var signupData = SignupModel()
            signupData.email = $0!
            signupData.name = $1!
            signupData.username = $2!
            signupData.password = $3!
            return signupData
        }
        .bind(to: signupViewModel.signupSubject)
        .disposed(by: disposeBag)
        
        signupViewModel.bind(Signup.email, emailInputField.rx.text)
        
        signupViewModel.bind(Signup.name, nameInputField.rx.text)
        
        signupViewModel.bind(Signup.username, usernameInputField.rx.text)
        
        signupViewModel.bind(Signup.password, passwordInputField.rx.text)
        
        signupViewModel.isValid.bind {
            if $0 == true {
                self.signupButton.isEnabled = true
            } else {
                self.signupButton.isEnabled = false
            }
        }.disposed(by: disposeBag)
    }
    
    @objc
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func configureSignupButton() {
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordInputField.snp.bottom).offset(20)
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.height.equalTo(facebookLoginButton.snp.height)
        }
        signupButton.addTarget(self, action: #selector(back), for: .touchDown)
    }
    
    func configureInputFields() {
        view.addSubview(emailInputField)
        view.addSubview(nameInputField)
        view.addSubview(usernameInputField)
        view.addSubview(passwordInputField)
        
        emailInputField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.top.equalTo(dividerWithText.snp.bottom).offset(20)
        }
        
        nameInputField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.top.equalTo(emailInputField.snp.bottom).offset(20)
        }
        
        usernameInputField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.top.equalTo(nameInputField.snp.bottom).offset(20)
        }
        
        passwordInputField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.top.equalTo(usernameInputField.snp.bottom).offset(20)
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
            $0.top.equalTo(facebookLoginButton.snp.bottom).offset(40)
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
    
    func configureFacebookLoginButton() {
        let textView = UILabel().then {
            $0.text = "친구들의 사진과 동영상을 보려면\n가입하세요"
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
        view.addSubview(textView)
        view.addSubview(facebookLoginButton)
        
        textView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
        facebookLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textView.snp.bottom).offset(20)
            $0.width.equalToSuperview().multipliedBy(0.9/1)
            $0.height.equalTo(textView.snp.height)
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
    
}

import SwiftUI

struct SignupViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = SignupViewController
    
    func makeUIViewController(context: Context) -> SignupViewController {
        return SignupViewController()
    }
    
    func updateUIViewController(_ uiViewController: SignupViewController, context: Context) {}
}

struct SignupViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SignupViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
                .previewDisplayName("iPhone 13 Pro")
            
            SignupViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}




