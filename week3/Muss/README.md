## Interface
주로 중간에서 연결해주는 역할을 하는 장치나 소프트웨어에서 많이 사용되는 용어

사용자와 view가 서로 접촉 → User - Controller 사이에서 연결을 담당하는 것이 view

사용자와 앱이 의사소통 할 수 있도록 중간에서 연결을 담당하는 모든 것이 app에서의 인터페이스
<br>
<br>
# UINavigationController

Container View Controller → 계층을 가지고 있는 뷰들을 **스택 형태**로 나타내주는 뷰 컨트롤

보통 관련있는 뷰들 사이를 이동할 때 사용하며 단계적, 순차적으로 view controller를 띄워주고 이런 뷰컨들을 관리하고 싶을 때 사용!

![](https://images.velog.io/images/enchantee/post/c791ca1d-ea14-4147-b801-2426c9fad476/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-30_%EC%98%A4%ED%9B%84_2.32.45.png)

설정 - 일반 - 오토 락(오토 락을 설정하는 뷰에 들어가기 위해 계층을 타고 들어간다)

스택 기반이므로 최상단의 하나의 뷰만 보여지게 된다 → push & pop으로 이동

- UIToolbar: 사파리 앱 아래에 있는 바, 기본적으로 navigation controller에서는 숨김처리 되어 있다(숨김 해제 후 해당 영역 설정 가능)
- Delegate: 특정 event에서 사용할 수 있는 delegate가 선언되어 있다
보통 특정 view controller가 보여지거나, 뷰의 이동 간 애니메이션 설정할 때 사용한다
델리게이트 오브젝트들은 UINavigationControllerDelegate 프로토콜을 따라야 한다!
![](https://images.velog.io/images/enchantee/post/7654852f-bd49-449b-a9ba-de85e9d7ed09/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-30_%EC%98%A4%ED%9B%84_2.43.26.png)
<br>
## Pop 제스처 사용하기, 사용하지 않기

오른쪽으로 스와이프하는 pop제스처를 이용하여 이전 view controller로 돌아갈 수 있다

스와이프 이벤트를 사용하는 view controller에서는 pop 제스처 막아야 함

```swift
self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
```

이 경우엔 모든 뷰컨에 일괄적으로 적용되기 때문에, 다른 뷰컨에서 기본적으로 isEnabled값을 true로 지정해줘야 한다
<br>

_Q_

```swift
self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
```

이거 무슨 버그 때문에 한거지,, 주석처리해도 버그가 안나온다
<br>
<br>

# UITabBarController

Container View Controller → 다중선택 인터페이스를 관리한다, 탭바의 아이템들은 자식 뷰들이다

유저가 특정 탭을 선택하면, 이전의 뷰들과 상관없이 이를 대체하는 **루트뷰로 나타낸다**

탭바 인터페이스는 다른 종류의 정보를 나타내거나, 같은 정보지만 완전히 다른 스타일의 인터페이스로 나타낼 때 사용한다
![](https://images.velog.io/images/enchantee/post/1705d62f-ea17-46ad-b7b6-99cbedec1511/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-30_%EC%98%A4%ED%9B%84_3.23.13.png)

시간과 관련된 탭들이지만, 완전히 다른 정보를 보여준다

- Delegate: naviagation controller와 비슷하게 특정 탭을 선택했을 때의 추가적인 작업이 필요할 때나, 선택이 안되도록 막기 등을 수행할 때 사용한다
tab bar controller또한 UITabBarControllerDelegate 프로토콜을 따라야한다


![](https://images.velog.io/images/enchantee/post/195fec25-5a23-4b4d-8c1f-53ac8bc055ef/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-30_%EC%98%A4%ED%9B%84_3.29.48.png)

tab bar controller와 view controller들은 relationship segue - show 로 연결되어 있는 상태이다

---
<br>
<br>

# Extensions

## UIColor & String

커스텀 컬러를 추가하거나 String 타입에 특정 기능을 수행하는 메서드를 추가할 수 있다

![](https://images.velog.io/images/enchantee/post/4fbf3b01-f2d7-43f7-8eac-01d5c8a94be3/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-30_%EC%98%A4%ED%9B%84_3.51.05.png)

static / class 가 앞에 붙은 프로퍼티 → 타입 프로퍼티(인스턴스를 만들지 않고도 UIColor.facebookColor와 같이 바로 접근 가능하다)

- Static: 오버라이딩 금지
- Class: 오버라이딩 허용

![](https://images.velog.io/images/enchantee/post/8d274104-3eb3-4378-959d-6869711a7278/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-30_%EC%98%A4%ED%9B%84_3.57.48.png)


위와 동일하게 static / class 가 앞에 붙은 메서드 → 타입 메서드(인스턴스 만들지 않고도 접근 가능)
<br>
_Q_

왜 커스텀 컬러를 코드로 추가해야 코드로 접근할 수 있는지

_Q_

위의 extension에서는 인스턴스 메서드로 정의해주었는데 저 메서드를 사용할 때는 인스턴스를 만들지 않고 사용함,, 아니면 text를 만든게 이미 인스턴스를 정의해준건가??
<br>

## UIView

### @IBInspectable
![](https://images.velog.io/images/enchantee/post/e19acf63-ce10-4944-a606-b2382da949e9/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-30_%EC%98%A4%ED%9B%84_4.05.04.png)

인스펙터로 활용할 수 있다 
ex) Corner Radius의 값을 지정해줄 수 있다

set에는 원래 파라미터 이름을 받을 수 있지만, 없을 때 이름은 반드시 “newValue”라고 한다!

### @IBDesignable

이렇게 속성을 지정해줘도 실시간으로 보지 못한다 

→ @IBDesignable이 가능하게 해준다

_Q_

나는 안됨;;
<br>


## UIViewController

```swift
extension UIViewController{
    func generateButtonAttribute(_ button: UIButton,
                                 // ...은 파라미터를 복수로 받을 수 있는 swift 문법
                                 texts: String...,
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString { //어떤 속성이 적용된 형태로 리턴한다
        
        //UIButton에 입력된 text를 가져온다
        guard let wholeText = button.titleLabel?.text else {fatalError("버튼에 텍스트가 없음.")}
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        //설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        //설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체를 생성한다
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        //텍스트에 맞는 설정을 추가한다
        texts.indices.forEach{index in
            attributedString.addAttribute(.font,
                                          value: customFonts[index],
                                          range: customTextsRanges[index])
            
            attributedString.addAttribute(.foregroundColor,
                                          value: customColors[index],
                                          range: customTextsRanges[index])
            
        }
        return attributedString
    }
}
```

```swift
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
```

버튼의 라벨을 인덱싱해서 부분별로 다른 색깔을 준다

NSString, NSMutable 등등은,,, 나중에 하는 걸로! 흐름은 이해 완료 🙂

Hi
