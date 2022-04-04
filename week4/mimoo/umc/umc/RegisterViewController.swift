//
//  RegisterViewController.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/05.
//

import UIKit
import SnapKit
import Then

class RegisterViewController: UIViewController {
    
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
    lazy var RegisterBtn = UIButton()
    
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
            $0.left.right.equalToSuperview()
        }
        
        setTextField(textField: emailTextField, placeholder: "휴대폰 번호 또는 이메일 주소")
        setTextField(textField: nameTextField, placeholder: "성명")
        setTextField(textField: nickNameTextField, placeholder: "사용자 이름")
        setTextField(textField: passwordTextField, placeholder: "비밀번호")
    }
    
    func setRegisterBtn() {
        RegisterBtn.then {
            $0.setTitle("가입", for: .normal)
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
        mainStackView.setCustomSpacing(10.0, after: logoImageView)
        mainStackView.addArrangedSubview(self.explainLabel)
        mainStackView.setCustomSpacing(30.0, after: explainLabel)
        mainStackView.addArrangedSubview(self.facebookLoginBtn)
        mainStackView.setCustomSpacing(30.0, after: facebookLoginBtn)
        mainStackView.addArrangedSubview(self.orDivider)
        mainStackView.setCustomSpacing(30.0, after: orDivider)
        mainStackView.addArrangedSubview(self.inputStackView)
        mainStackView.setCustomSpacing(30.0, after: inputStackView)
        mainStackView.addArrangedSubview(self.RegisterBtn)
        mainStackView.setCustomSpacing(50.0, after: RegisterBtn)
    }
    
    func setMainStackSubViewsConstraints() {
        setLogoImageView()
        setExplainLabel()
        setFacebookLoginBtn()
        setOrDivider()
        setInputStackView()
        setRegisterBtn()
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
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        addMainStackSubViews()
        setMainStackSubViewsConstraints()
    }
    
    @objc internal func backToLoginVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    func setBackToLoginBtn() {
        backToLoginBtn.setTitle("계정이 있으신가요? 로그인하기", for: .normal)
        backToLoginBtn.setTitleColor(UIColor(named: "colors/textBtnLabelColor"), for: .normal)
        backToLoginBtn.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.small)
        backToLoginBtn.setTitleColor(.blue, for: .highlighted)
        backToLoginBtn.startAnimatingPressActions()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "colors/backgroundColor")
        
        setBottomStackView()
        setMainStackView()
    }

}

struct UserInfo {
    var email: String = ""
    var name: String = ""
    var nickName: String = ""
    var password: String = ""
}


/*

mvvm
https://ichi.pro/ko/swift-mich-mvvm-dijain-paeteon-eul-sayonghan-logeu-in-hwamyeon-guhyeon-74723834678771
 
 
 navigator
 https://velog.io/@leeyoungwoozz/iOS-storyboard-%EA%B0%80-%EC%95%84%EB%8B%8C-%EC%BD%94%EB%93%9C%EB%A1%9C-UI-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0-Navigation-Controller
*/

