//
//  LoginViewController.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/04.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
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
            $0.left.right.equalToSuperview()
        }
        
        setTextField(textField: emailTextField, placeholder: "이메일")
        setTextField(textField: passwordTextField, placeholder: "비밀번호")
    }
    
    func setGoToFindPasswordBtn() {
        goToFindPasswordBtn.then {
            $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
            $0.setTitleColor(UIColor(named: "colors/textBtnLabelColor"), for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.small)
            $0.setTitleColor(.blue, for: .highlighted)
            $0.startAnimatingPressActions()
        }.snp.makeConstraints {
            $0.trailing.equalToSuperview()
        }
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
    
    func setLoginBtn() {
        loginBtn.then {
            $0.setTitle("로그인", for: .normal)
            $0.backgroundColor = UIColor(named: "colors/disabledBtnColor")
            $0.layer.cornerRadius = 10.0
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.middle, weight: UIFont.Weight.bold)
            $0.startAnimatingPressActions()
        }.snp.makeConstraints {
            $0.height.equalTo(40.0)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setOrDivider() {
        orDivider.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setFacebookLoginBtn() {
        let facebookIcon:UIImage? = UIImage(named: "로그인/ic_login_facebook")?.resizeImageTo(size: CGSize(width: 20.0, height: 20.0))
        
        facebookLoginBtn.then {
            $0.setTitle("  Facebook으로 로그인", for: .normal)
            $0.setTitleColor(UIColor(named: "colors/textBtnLabelColor"), for: .normal)
            $0.setImage(facebookIcon, for: .normal)
            $0.setImage(facebookIcon, for: .highlighted)
            $0.layer.cornerRadius = 10.0
            $0.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.middle, weight: UIFont.Weight.bold)
            $0.startAnimatingPressActions()
        }.snp.makeConstraints {
            $0.height.equalTo(40.0)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func addMainStackSubViews() {
        mainStackView.addArrangedSubview(self.logoImageView)
        mainStackView.setCustomSpacing(30.0, after: logoImageView)
        mainStackView.addArrangedSubview(self.inputStackView)
        mainStackView.addArrangedSubview(self.findPasswordStackView)
        mainStackView.setCustomSpacing(30.0, after: findPasswordStackView)
        mainStackView.addArrangedSubview(self.loginBtn)
        mainStackView.setCustomSpacing(50.0, after: loginBtn)
        mainStackView.addArrangedSubview(self.orDivider)
        mainStackView.setCustomSpacing(30.0, after: orDivider)
        mainStackView.addArrangedSubview(self.facebookLoginBtn)
    }
    
    func setMainStackSubViewsConstraints() {
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
            $0.spacing = 10.0
        }.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        addMainStackSubViews()
        setMainStackSubViewsConstraints()
    }
    
    @objc internal func goToRegisterVC(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }

    func setGoToRegisterBtn() {
        goToRegisterBtn.setTitle("계정이 없으신가요? 가입하기", for: .normal)
        goToRegisterBtn.setTitleColor(UIColor(named: "colors/textBtnLabelColor"), for: .normal)
        goToRegisterBtn.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.small)
        goToRegisterBtn.setTitleColor(.blue, for: .highlighted)
        goToRegisterBtn.startAnimatingPressActions()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "colors/backgroundColor")
        
        setBottomStackView()
        setMainStackView()
    }

}

