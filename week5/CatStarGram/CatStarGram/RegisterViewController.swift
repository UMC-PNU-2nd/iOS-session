//
//  RegisterViewController.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/03/28.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Properties
    //회원가입 정보를 멤버변수로 받아온다
    var email : String = ""
    var name: String = ""
    var nickname: String = ""
    var pw: String = ""
    
    //구조체를 파라미터로 전달 -> 리턴 없음
    var userInfo: ((UserInfo) -> Void)?
    
    
    
    //유효성 검사를 위한 프로퍼티
    var isValidEmail = false{
        didSet{ //프로퍼티 옵저버
            //값을 입력받을 때마다 메소드가 호출된다
            self.validateUserInfo()
        }
        
    }
    
    var isValidName = false{
        didSet{ //프로퍼티 옵저버
            //값을 입력받을 때마다 메소드가 호출된다
            self.validateUserInfo()
        }
        
    }
    
    var isValindNickname = false{
        didSet{ //프로퍼티 옵저버
            //값을 입력받을 때마다 메소드가 호출된다
            self.validateUserInfo()
        }
        
    }
    
    var isValidPassword = false{
        didSet{ //프로퍼티 옵저버
            //값을 입력받을 때마다 메소드가 호출된다
            self.validateUserInfo()
        }
        
    }
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    //TextFields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    var textFields: [UITextField] {
        [emailTextField, nicknameTextField, nameTextField, pwTextField]
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
        setUpAttribute()
        
        //bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    //MARK: - Actions

    //IBAction과 비슷한 역할 수행
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        
        switch sender{
            
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case nicknameTextField:
            self.isValindNickname = text.count > 2
            self.nickname = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case pwTextField:
            self.isValidPassword = text.isValidPassword()
            self.pw = text
        default:
            fatalError("Missing Textfield,,,")
        }
        
    }
    
    
    @IBAction func barButtonItem(_ sender: Any) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func registerButtonDidTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
                
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            pw: self.pw)
        
        // 구조체 형식으로 정보 저장
        self.userInfo?(userInfo)
        
    }
    
    

    
    //MARK: - Helpers
    
    private func setUpTextField() {
        textFields.forEach { tf in
            tf.addTarget(self,
                         action: #selector(textFieldEditingChanged(_:)),
                         for: .editingChanged)
        }
    }
    
    
    //사용자가 입력한 회원정보를 입력하고 -> UI 업데이트
    private func validateUserInfo() {
        if isValidEmail && isValidName && isValindNickname && isValidPassword {
            
            self.signUpButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signUpButton.backgroundColor = UIColor.facebookColor //이거 왜 코드로 extension 해놓아야 쓸 수 있는건지,,
            }
            
        } else {
            self.signUpButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signUpButton.backgroundColor = UIColor.disabledButtonColor
            }
            
        }
    }
    
    private func setUpAttribute() {
        //registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        
        let attributes = generateButtonAttribute(
            popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
        
    }

}


