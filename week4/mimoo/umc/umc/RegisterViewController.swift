//
//  RegisterViewController.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/05.
//

import UIKit
import SnapKit
import Then

import RxCocoa
import RxSwift

class RegisterViewController: UIViewController {
    
    var delegate: RegisterDelegate?
    
    let disposeBag = DisposeBag()
    let viewModel = RegisteringViewModel()
    
    lazy var mainStackView = UIStackView()
    lazy var logoImageView = UIImageView()
    lazy var explainLabel = UILabel()
    lazy var facebookLoginBtn = UIButton()
    lazy var orDivider = OrDivider()
    
    lazy var inputStackView = InputStackView(textFileds: [emailTextField, nameTextField, nickNameTextField, passwordTextField])
    lazy var emailTextField = UITextField()
    lazy var nameTextField = UITextField()
    lazy var nickNameTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var registerBtn = UIButton()
    
    lazy var bottomStackView = BottomStackView(button: backToLoginBtn)
    lazy var backToLoginBtn = UIButton()
    
    func setLogoImageView() {
        logoImageView.then {
            $0.image = UIImage(named: "ic_catstagram_logo")
            $0.contentMode = .scaleAspectFit
        }.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    func setExplainLabel() {
        explainLabel.then {
            $0.numberOfLines = 0
            $0.text = "친구들의 사진과 동영상을 보려면\n가입하세요"
            $0.textAlignment = NSTextAlignment.center
            $0.font = UIFont.systemFont(ofSize: FontSize.small)
        }.snp.makeConstraints {
            $0.centerX.equalToSuperview()
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
        
        setTextField(textField: emailTextField, placeholder: "휴대폰 번호 또는 이메일 주소")
        setTextField(textField: nameTextField, placeholder: "성명")
        setTextField(textField: nickNameTextField, placeholder: "사용자 이름")
        setTextField(textField: passwordTextField, placeholder: "비밀번호")
    }
    
    func setRegisterBtn() {
        registerBtn.then {
            $0.setTitle("가입", for: .normal)
            $0.setDefaultStyle()
            $0.setDisabled()
        }.snp.makeConstraints {
            $0.height.equalTo(40.0)
            $0.leading.trailing.equalToSuperview()
        }
        registerBtn.addTarget(self, action: #selector(backToLoginVC(_:)), for: .touchUpInside)
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
        mainStackView.setCustomSpacing(10.0, after: logoImageView)
        mainStackView.addArrangedSubview(self.explainLabel)
        mainStackView.addArrangedSubview(self.facebookLoginBtn)
        mainStackView.setCustomSpacing(50.0, after: facebookLoginBtn)
        mainStackView.addArrangedSubview(self.orDivider)
        mainStackView.addArrangedSubview(self.inputStackView)
        mainStackView.addArrangedSubview(self.registerBtn)
    }
    
    func setMainStackSubViews() {
        setLogoImageView()
        setExplainLabel()
        setFacebookLoginBtn()
        setOrDivider()
        setInputStackView()
        setRegisterBtn()
    }
    
    func setMainStackView() {
        self.view.addSubview(mainStackView)
        mainStackView.then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 30.0
        }.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view)
                .inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }
        
        addMainStackSubViews()
        setMainStackSubViews()
    }
    
    @objc internal func backToLoginVC(_ sender: UIButton) {
        if sender == registerBtn {
            self.delegate?.registerCompleted(userInfo: UserInfo(email: emailTextField.text!, name: nameTextField.text!, nickName: nickNameTextField.text!, password: passwordTextField.text!))
        }
        self.navigationController?.popViewController(animated: true)
    }

    func setBackToLoginBtn() {
        backToLoginBtn.setTitle("계정이 있으신가요? 로그인하기", for: .normal)
        backToLoginBtn.setSmallTextStyle()
        backToLoginBtn.addTarget(self, action: #selector(backToLoginVC(_:)), for: .touchUpInside)
    }
    
    func setBottomStackView() {
        setBackToLoginBtn()

        self.view.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func setupBindings() {
        emailTextField.rx.text.bind(to: viewModel.emailSubject).disposed(by: disposeBag)
        nameTextField.rx.text.bind(to: viewModel.nameSubject).disposed(by: disposeBag)
        nickNameTextField.rx.text.bind(to: viewModel.nickNameSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.bind(to: viewModel.passwordSubject).disposed(by: disposeBag)
        
        viewModel.isValidForm.bind {
            if $0 == true {
                self.registerBtn.setEnabled()
            }
            else {
                self.registerBtn.setDisabled()
            }
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        setBottomStackView()
        setMainStackView()
        setupBindings()
    }

}

protocol RegisterDelegate {
    func registerCompleted(userInfo: UserInfo)
}

class RegisteringViewModel {
    let emailSubject = BehaviorRelay<String?>(value: "")
    let nameSubject = BehaviorRelay<String?>(value: "")
    let nickNameSubject = BehaviorRelay<String?>(value: "")
    let passwordSubject = BehaviorRelay<String?>(value: "")
    
    let minNameCharacters = 3
    
    var isValidForm: Observable<Bool> {
        return Observable.combineLatest(emailSubject, nameSubject, nickNameSubject, passwordSubject) { email, name, nickName, password in
            guard email != nil && name != nil && nickName != nil && password != nil else {
                return false
            }
            return email!.isValidEmail() && name!.count >= self.minNameCharacters && nickName!.count >= self.minNameCharacters && password!.isValidPassword()
        }
    }
}
