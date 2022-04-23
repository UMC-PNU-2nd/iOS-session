# Protocol

한 마디로 말하면 메뉴얼/설명서

프로토콜 내부에 필요한 부분을 **“정의만”** 한다 → 함수 이름만 있고 구현 부분은 없이

```swift
protocol ChangeLabelDelegate {
    func doChange()
}
```

이런식으로 프로토콜을 단순 나열만 하고 구현 내용은 추훼 프로토콜을 채택하는 곳에서 작성해주게 된다

- 프로토콜 내 프로퍼티를 요구할 때 반드시 var로 작성해야 하며
- get(읽기 전용)/set(읽고 쓰기 전용) 이 가능한지 명시해야 한다 → 안하면 오류발생

## 프로토콜 채택

```swift
class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
```

구조체, 클래스, 열거형 모든 타입에서 가능하며 여러개를 동시에 해도 된다

클래스에서 상속과 채택을 동시에 해주려면 **클래스 → 프로토콜** 순으로 작성해주어야 한다
<br>
<br>

# Delegate

위임하다/대리하다는 뜻의 delegate → 무언가를 대신하다는 뜻

객체지향 프로그래밍에서 하나의 객체가 모든 일을 하는 것이 아니라 **처리해야 하는 일 중 일부를 다른 객체에게 위임하는 것**을 의미

## Delegate Pattern을 통한 데이터 전달

### 두 번째 뷰 컨트롤러 = 데이터를 전달해주는 뷰

```swift
import UIKit

protocol ChangeLabelDelegate {
    func doChange(data: String)
}

class SecondViewController: UIViewController{
    
    var delegate : ChangeLabelDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonDismiss(_ sender: UIButton) {
        if let text = textField.text {
            delegate?.doChange(data: text)
        }
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
```

1. 프로토콜을 생성해준다(함수 원형만 작성/구현 X)
2. 생성해준 프로토콜 타입을 가진 delegate 프로퍼티를 생성해준다
3. delegate 프로퍼티 사용
textField 안의 text 값이 있다는 것을 확인하면, delegate 프로퍼티의 doChange() 함수를 불러와 data 파라미터에 text를 담아준다
<br>
### 첫 번째 뷰 컨트롤러 = 데이터를 전달받는 뷰

```swift
import UIKit

class ViewController: UIViewController, ChangeLabelDelegate {
    
    func doChange(data: String) {
        label.text = data
    }

    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func goNextVC(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else {return}
        
        nextVC.delegate = self
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}
```

1. 프로토콜을 채택해준다
2. 프로토콜 내의 doChange() 함수를 실제로 구현한다
3. delegate를 위임받는다
’두 번째 뷰컨에서 선언한 delegate 프로퍼티를 대신해 처리하는 것이 바로 첫 번째 뷰컨이다’ 라는 뜻
<br>
<br>

## Delegate 패턴 사용하는 이유

위임자들은 일을 시킬 뿐, 일을 어떻게 처리해야 하는지 모른다

일을 처리하는 방법은 그 일을 수행하는 객체에 구현되어 있기 때문!

→ 코드를 재사용하고 유지보수하기 쉬워진다

어떤 일을 해야 하는지를 정해놓기만 하고, 상황에 맞는 코드를 작성하면 된다

예를 들어 우리가 어떤 작업을 처리해야 하는데 동일한 작업인데도 불구하고 객체마다 다른 내용을 처리해야 한다고 생각해보자.

- 이럴 경우 동일한 작업에 대해서는 함수를 전달하기만 하고, 각각의 내용은 전달 받은 객체에서 처리하기만 하면 된다
- 작업을 전달할 때 공통된 부분을 제외하고 처리해야 하는 부분만을 전달하여 처리할 수도 있다

