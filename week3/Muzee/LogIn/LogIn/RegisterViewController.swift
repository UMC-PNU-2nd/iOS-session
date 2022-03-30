import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var email: String = ""
    var name: String =  ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo)->Void)?
     
    var isValidEmail = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    var textField: [UITextField] {
        [emailTextfield,nameTextField,nicknameTextField,passwordTextField]
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfield()
    }
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextfield:
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        default:
            print("Missing TextField...")
            
        }
    }

    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    // MARK: - Helpers
    private func setupTextfield() {
        textField.forEach{
            tf in tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 정보 확인하고 UI 업데이트
    private func validateUserInfo() {
        
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.blue
            }
        }
        else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.gray
            }
            
        }
        
    }
}

extension String {
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let EmailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", EmailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}
