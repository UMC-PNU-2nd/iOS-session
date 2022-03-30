import UIKit

class LogInViewController: UIViewController {
    
    var email = String()
    var password = String()
    
    var userInfo: UserInfo?
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.isValidEmail() ? .blue : .gray
        self.email = text
    }

    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.count>2 ? .blue : .gray
        self.password = text
    }
    
    
    @IBAction func LogInButtonDidTap(_ sender: UIButton) {
        // 옵셔널 해제
        guard let userInfo = userInfo else {  return  }
        
        if userInfo.email == self.email && userInfo.password == self.password {
            print("to the next level")
        }
        else {
            print("wrong account")
        }
        
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환
        // 1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // ARC
        registerViewController.userInfo = { [weak self] (userInfo) in self?.userInfo = userInfo}
    }
    
}
