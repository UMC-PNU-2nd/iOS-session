//
//  LoginViewController.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/04.
//

import UIKit
import SnapKit
import Then

import RxCocoa
import RxSwift

class LoginViewController: UIViewController, RegisterDelegate {
    
    var userInfo:UserInfo?
    
    let disposeBag = DisposeBag()
    let viewModel = LoginViewModel()
    
    lazy var mainStackView = UIStackView()
    lazy var logoImageView = UIImageView()
    lazy var inputStackView = InputStackView(textFileds: [emailTextField, passwordTextField])
    lazy var emailTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var findPasswordStackView = UIStackView()
    lazy var goToFindPasswordBtn = UIButton()
    lazy var loginBtn = UIButton()
    lazy var orDivider = OrDivider()
    lazy var facebookLoginBtn = UIButton()
    
    lazy var bottomStackView = BottomStackView(button: goToRegisterBtn)
    lazy var goToRegisterBtn = UIButton()
    
    func setLogoImageView() {
        logoImageView.then {
            $0.image = UIImage(named: "ic_catstagram_logo")
            $0.contentMode = .scaleAspectFit
        }.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    func setTextField(textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setInputStackView() {
        inputStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        setTextField(textField: emailTextField, placeholder: "이메일")
        setTextField(textField: passwordTextField, placeholder: "비밀번호")
    }
    
    @objc internal func GOHOME(_ sender: Any) {
        self.view.window?.replaceRootViewController(HomeViewController(), animated: true, completion: nil)
    }
    
    func setGoToFindPasswordBtn() {
        goToFindPasswordBtn.then {
            $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
            $0.setSmallTextStyle()
        }.snp.makeConstraints {
            $0.trailing.equalToSuperview()
        }
        goToFindPasswordBtn.addTarget(self, action: #selector(GOHOME(_:)), for: .touchUpInside)
    }
    
    func setFindPasswordView() {
        findPasswordStackView.then {
            $0.axis = .vertical
            $0.alignment = .trailing
        }.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
        findPasswordStackView.addArrangedSubview(self.goToFindPasswordBtn)
        setGoToFindPasswordBtn()
    }
    
    @objc internal func login(_ sender: Any) {
        guard userInfo != nil else {
            print("No UserInfo")
            return
        }
        if userInfo?.email == emailTextField.text && userInfo?.password == passwordTextField.text {
            self.view.window?.replaceRootViewController(HomeViewController(), animated: true, completion: nil)
        }
        else {
            print("Different UserInfo")
        }
    }
    
    func setLoginBtn() {
        loginBtn.then {
            $0.setTitle("로그인", for: .normal)
            $0.setDefaultStyle()
            $0.setDisabled()
        }.snp.makeConstraints {
            $0.height.equalTo(40.0)
            $0.leading.trailing.equalToSuperview()
        }
        loginBtn.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
    }
    
    func setOrDivider() {
        orDivider.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setFacebookLoginBtn() {
        facebookLoginBtn.setFacebookLoginStyle()
        facebookLoginBtn.snp.makeConstraints {
            $0.height.equalTo(40.0)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func addMainStackSubViews() {
        mainStackView.addArrangedSubview(self.logoImageView)
        mainStackView.addArrangedSubview(self.inputStackView)
        mainStackView.setCustomSpacing(10.0, after: inputStackView)
        mainStackView.addArrangedSubview(self.findPasswordStackView)
        mainStackView.addArrangedSubview(self.loginBtn)
        mainStackView.setCustomSpacing(50.0, after: loginBtn)
        mainStackView.addArrangedSubview(self.orDivider)
        mainStackView.addArrangedSubview(self.facebookLoginBtn)
    }
    
    func setMainStackSubViews() {
        setLogoImageView()
        setInputStackView()
        setFindPasswordView()
        setLoginBtn()
        setOrDivider()
        setFacebookLoginBtn()
    }
    
    func setMainStackView() {
        let space:UIView = UIView()
        self.view.addSubview(space)
        space.snp.makeConstraints {
            $0.top.equalTo(view)
            $0.bottom.equalTo(bottomStackView.snp.top)
            $0.leading.trailing.equalTo(view)
                .inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }
        
        space.addSubview(mainStackView)
        mainStackView.then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 30.0
        }.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        addMainStackSubViews()
        setMainStackSubViews()
    }
    
    @objc internal func goToRegisterVC(_ sender: Any) {
        let registerVC = RegisterViewController()
        registerVC.delegate = self
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

    func setGoToRegisterBtn() {
        goToRegisterBtn.setTitle("계정이 없으신가요? 가입하기", for: .normal)
        goToRegisterBtn.setSmallTextStyle()
        goToRegisterBtn.addTarget(self, action: #selector(goToRegisterVC(_:)), for: .touchUpInside)
    }
    
    func setBottomStackView() {
        setGoToRegisterBtn()

        self.view.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func setupBindings() {
        emailTextField.rx.text.bind(to: viewModel.emailSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.bind(to: viewModel.passwordSubject).disposed(by: disposeBag)
        
        viewModel.isValidForm.bind {
            if $0 == true {
                self.loginBtn.setEnabled()
            }
            else {
                self.loginBtn.setDisabled()
            }
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        setBottomStackView()
        setMainStackView()
        setupBindings()
        
        self.navigationController?.navigationBar.tintColor = UIColor.gray
    }

    func registerCompleted(userInfo: UserInfo) {
        self.userInfo = userInfo
    }
}

class LoginViewModel {
    let emailSubject = BehaviorRelay<String?>(value: "")
    let passwordSubject = BehaviorRelay<String?>(value: "")
    
    let minPasswordCharacters = 8
    
    var isValidForm: Observable<Bool> {
        return Observable.combineLatest(emailSubject, passwordSubject) { email, password in
            guard email != nil && password != nil else { return false }
            return email!.isValidEmail() && password!.count >= self.minPasswordCharacters
        }
    }
}
