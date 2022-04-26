# week04

# Protocol

<aside>
📌 특정 역할을 하기 위한 메소드, 프로퍼티, 기타 요구사항 등의 **청사진**
</aside>
  
# **프로토콜의 사용**

- **구조체, 클래스, 열거형**은 **프로토콜을 채택**해서 특정 기능을 실행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있다.
- 프로토콜은 **정의를 하고 제시를 할 뿐** 스스로 **기능을 구현하지는 않는다.** (**조건만 정의**)
- **하나의 타입으로 사용**되기 때문에 아래와 같이 타입 사용이 허용되는 모든 곳에 프로토콜을 사용할 수 있다.
    - *함수, 메소드, 이니셜라이저의 파라미터 타입 혹은 리턴 타입*
    - *상수, 변수, 프로퍼티의 타입*
    - *배열, 딕셔너리의 원소타입*
    

### 기본형태

```swift
protocol 프로토콜이름 {
 // 프로토콜 정의
}

struct SomeStruct: AProtocol, AnotherProtocol {
 // 구조체 정의
}

// 상속받는 클래스의 프로토콜 채택
class SomeClass: SuperClass, AProtocol, AnotherProtocol {
 // 클래스 정의
}
```

• 구조체, 클래스, 열거형 등에서 프로토콜을 채택하려면 타입 이름 뒤에 콜론“:”을 붙여준 후 채택할 프로토콜 이름을 쉼표“,”로 구분하여 명시해준다. (**SubClass의 경우 SuperClass를 가장 앞에 명시한다.**)

### ****Property Requirments****

**이름과 타입 그리고 gettable, settable한지 명시**한다. (프로퍼티는 **항상 var로 선언**해야 한다.)

```swift
protocol Student {
  var height: Double { get set }
  var name: String { get }
  static var schoolNumber: Int { get set }
}

class Aiden: Student {
    var roundingHeight: Double = 0.0
    var height: Double {
        get {
            return roundingHeight
        }
        set {
            roundingHeight = 183.0
        }
    }
    var name: String = "Aiden"
    static var schoolNumber: Int = 20112330
}

let aiden = Aiden()
print(aiden.height, aiden.name, Aiden.schoolNumber)
// 0.0 Aiden 20112330
aiden.height = 183.0
print(aiden.height, aiden.name, Aiden.schoolNumber)
```

### **Method Requirements**

: 프로토콜에서는 인스턴스 메소드와 타입 메소드를 정의할 수 있다. 하지만 **메소드 파라미터의 기본 값은 프로토콜 안에서 사용할 수 없다.**

- 메소드를 정의할 때 **함수명과 반환값을 지정**할 수 있고, **{}는 적지 않는다.**
- **mutating 키워드를 사용해 인스턴스에서 변경 가능하다는 것을 표시할 수 있다. (값 타입에서만 사용 가능)**

```swift
protocol Person {
  static func breathing()
  func sleeping(time: Int) -> Bool
  mutating func running()
}

struct Aiden: Person {
    var heartRate = 100
    static func breathing() {
        print("숨을 쉽니다")
    }
    
    func sleeping(time: Int) -> Bool {
        if time >= 23 {
            return true
        } else {
            return false
        }   
    }
    
    mutating func running() {
        heartRate += 20
    }
}

print(Aiden.breathing())
// 숨을 쉽니다.
var aiden = Aiden()
print(aiden.sleeping(time: 23))
// true
print(aiden.heartRate)
// 100
aiden.running()
print(aiden.heartRate)
// 120
```

# **Extension**

: **타입에 기능을 추가하기 위해 사용하는 문법**으로 기존의 타입에 **새로운 프로토콜을 채택하기 위해 Extension을 사용할 수도 있다.**

- 상속 역시 기존 타입에서 확장할 수 있지만, 새로운 클래스를 만들면서 기능을 확장한다는 차이점이 있다.
- Extensions은 그냥 기능을 덛붙힌다고 보면 된다. (**수평적 확장**)
- 기능들을 모음으로써 가독성을 높힐 수 있다.
- **프로퍼티는 연산프로퍼티만 사용할 수 있다.**

### 기본 형태

```swift
extension SomeType {
 // 구현부
}

extension SomeType: SomeProtocol {
 // 구현부
}
```

### 예시

```swift
extension String {
 var length: Int {
  var string: NSString = NSString(string: self)
  return sting.length
 }
}

struct Hamster {
  var name: String
  var textualDescription: String {
    return "A hamster named \(name)"
  }
}
extension Hamster: TextRepresentable {}
```

: 타입이 이미 프로토콜의 모든 요구사항을 만족하지만 아직 해당 프로토콜을 채택한다고 명시하지 않은 경우 형식에 빈 Extension을 사용해서 프로토콜을 채택하도록 할 수 있다.

# **프로토콜 타입 확인**

: 일반적인 타입 확인과 마찬가지로 is, as를 사용한다.

- **is :** 앞에있는 타입이 뒤에있는 프로토콜을 채택하고 있는지 확인 (반환타입 Bool)
- **as? :** 앞에있는 타입이 뒤에있는 프로토콜을 채택하고 있는 경우 해당 타입을 프로토콜 타입으로 다운케스트, 그렇지 않은 경우는 nil 반환
- **as! :** 앞에있는 타입을 뒤에있는 프로토콜 타입으로 다운캐스트 실패시 런타임 에러 발생

## 타입캐스팅

- 타입 캐스팅은 인스턴스의 "타입"을 확인 하거나, 해당 인스턴스를 슈퍼 클래스나 하위 클래스로 취급하는 방법이다.
- Swift에서 타입 캐스팅은 "is"나 "as" 연산자로 구현

### is : 타입 확인

```swift
let char: Character = "A"
 
char is Character       // true
char is String          // false
 
 
let bool: Bool = true
 
bool is Bool            // true
bool is Character       // false
```

- 타입을 체크하는 연산자로, 런타임 시점에 실제 체크가 이루어진다
- 표현식이 Type과 동일하거나, 표현식이 Type의 서브 클래스인 경우 ➡️ true
- 이 외의 경우엔 ➡️ false

### ****as: Type Casting****

```
표현식 as  (변환 할)Type
표현식 as? (변환 할)Type
표현식 as! (변환 할)Type
```

- **표현식(의 타입)이 변환할** Type과 호환된다면, 변환할 Type으로 캐스팅된 인스턴스를 리턴한다
- 상속 관계인 업캐스팅(Upcasting)과 다운 캐스팅(Downcasting)에서 사용한다

1. **업캐스팅(Upcasting)**
    - 서브 클래스 인스턴스를 "슈퍼 클래스의 타입"으로 참조한다
    - 업 캐스팅은 항상 성공한다
    - as 연산자를 사용해서 할 수도 있다 (컴파일 시점에 캐스팅 가능 여부를 결정한다)

```swift
// 1. as를 사용한 업캐스팅
let human1 = Teacher.init() as Human
 
// 2. Type Annotation을 사용한 업캐스팅
let human2: Human = Teacher.init()
```

1. **다운캐스팅(Downcasting)**
- 슈퍼 클래스 인스턴스를 "서브 클래스의 타입"으로 참조한다
- 업캐스팅된 인스턴스를 다시 원래 서브 클래스 타입으로 참조할 때 사용한다
- 다운 캐스팅은 실패할 수있기에 as?, as! 연산자를 이용한다