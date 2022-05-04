//
//  LoginViewController.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/03/28.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAttribute()
    
    }
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
       
        //옵셔널
        //값이 있을 수도 없을 수도
        let text = sender.text ?? ""
        
        //상황연산자 = if/else
        self.loginButton.backgroundColor
        // true -> facebookColor, false -> disabledButtonColor
        = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        
        if text.isValidEmail() {
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.isEnabled = false
        }
        
        self.email = text
    }
    
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.isValidPassword() ? .facebookColor : .disabledButtonColor
        
        if text.isValidPassword() {
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.isEnabled = false
        }
        
        
        self.password = text
    }
    

    @IBAction func loginButtonDidTapped(_ sender: UIButton) {
        //회원가입 정보 전달받아서, 그것과 textField 데이터가 일치하면 로그인이 되어야 한다
        print("Tapped")
        guard let userInfo = self.userInfo else {return}
        
        if userInfo.email == self.email && userInfo.pw == self.password {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "tabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        } else {
            print("사용자 정보가 없습니다")
        }
        
        
    }
    
    
    @IBAction func registerButtonDidTapped(_ sender: UIButton) {
        
        //화면전환
        //1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        //2. 뷰 컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        
        //3. 화면전환 메소드 이용하여 화면 전환
        //completion -> 화면 전환 후 필요한 동작 입력
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        //ARC 개념,,,-> 강한 참조/ 약한 참조(ARC 낮춰줌)
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
            print(userInfo)
        }
        
        

    }
    
    private func setUpAttribute() {
        //registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        
        let attributes = generateButtonAttribute(
            registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)

    }
}
