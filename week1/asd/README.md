# Swift 기초문법

## Swift 특징
* 안전한 프로그래밍 지향
* 엄격한 문법으로 개발자 실수 방지
* 옵션널, guard, 오류처리, 타입통제 등등
* 신속성(Fast)
    * C,C++,Obj-c를 대체하기 위해 개발
    * 실행속도, 최적화 및 컴파일러 개량으로 더 빠른 컴파일 성능 구현
* 표현성(Expressive)
    * 사용하기 편하고 보기좋은 문법
    * 현대적이고 세련된 문법구현

## Console log
* print: 단순 문자열 춮력
* dump: 객체에 자세한 설명까지 출
```swift
class UMC {
    var product: String = ""
}

let company: UMC = UMC()
company.product = "iOS-Study"
dump(company)

/* 출력결과
__lldb_expr_7.UMC #0
  - product: "iOS-Study"
*/
```

## 문자열 보간법
* 문자열내에 변수와 상수에 값을 출력하기 위해 사용
* \(변수 or 상수)
```swift
let name: String = "Wonjune Choi"

print("나는 \(name) 입니다.")

/* 출력결과
나는 Wonjune Choi 입니다.
*/
```

## 상수와 변수
* `let` 키워드를 사용하여 상수 생성
* `let [상수명] : [데이터타입] = [값]`
* 데이터타입 생략 가능
```swift
let gName: String = "UMC"
let myName: String = "Choi Won June"
let age: Int = 23
```

* `var` 키워드를 사용하여 변수 생성
* `var [변수명] : [데이터타입] = [값]`
* 데이터타입 생략 가능
```swift
var job: String = "iOS Programmer"
var height = 171.0
height = 171.5
```

## 기본 데이터 타입
* `Int`: +,- 부호를 포함한 정수
* `UInt`: 0을 포함한 양의 정수
* `Bool`: 참(true), 거짓(false)만 값으로 가짐. 0,1은 타입 에러
* `Float`: 32비트 부동소수 표현 (소수점 6자리) 
* `Double`: 64비트 부동소수 표현 (소수점 15자리)(권장)
* `nil`: 없음. 값이 들어있지 않고 비어있음을 나타내는 키워드
* `Character`: 한문자 (Swift는 유니코드문자를 사용, 모든어어 및 특수문자 사용가능)
* `String`: 문자열, 유니코드를 사용하여 문자열 앞뒤에 큰따옴표를 사용하여 표현
* `특수문자/제어문자`: 문자열 내에 일정기능을 하는 특수문자 (`\n`, `\` , `*`, `\t`, `\0`)
* `Any`: 모든 데이터 타입
* `AnyObject`: 제한적인 `Any`, 클래스의 인스턴스만 할당 가능

## 컬렉션
### 튜플
* 지정된 데이터의 묶음
* 파이썬의 튜플과 유사
* 타입이름은 따로없고 일정타입의 나열생성됨
```swift
var cat: (name:String, age:Int, size:String) = ("name",2,"big")
```

### 배열
* 같은 타입의 데이터를 일렬로 순서대로 저장하는 형태의 컬렉션
```swift
var names: Array<String> = ["Choi Won June", "ASD"]
var names:[String]
```

### 딕셔너리
* 순서없이 키와 값의 쌍으로 구성되는 컬렉션
```swift
var codeForName: Dictionary<String, Int> = Dictionary<String, Int>()
```

### 세트
* 같은 타입의 데이터를 순서없이 하나의 묶음으로 저장, 중복없음
```swift
var codes: Set<String> = Set<String>()
let bird: Set<Strnig> = ["Pizons", "Cock", "Turkey", "Eagle"]
```

### 열거형
* 연관된 항목들을 묶어서 표현, `enum` 키워드를 사용하여 생성
```swift
enum School { case primary, elementary, middle, high}
```
