# Swift 기초 문법

## Swift
- Swift는 애플의 iOS와 macOS를 위한 프로그래밍 언어로 기존의 애플 운영체제용 언어인 Objective-C와 함께 공존할 목적으로 만들어졌다.

### Swift의 특징
1. 안정성(safe)
    - 안전한 프로그래밍을 지향
    - 엄격한 문법으로 개발자실수를 방지
    - Optional, guard, 오류처리, 타입통제 등등
1. 신속성(Fast)
    - C,C++,Obj-C의 대체를 목적으로 개발
    - 실행속도 최적화 및 컴파일러 개량으로 더 빠른 컴파일 성능구현
1. 더 나은 표현성(Expressiv)
    - 사용하기 편하고 보기좋은 문법...?
    - 현대적이고 세련된 문법구현...? ~~그런가...?~~

----- 
## 이름짓기 규칙
- Lower Camel Case : function, method, 변수, 상수
- Upper Camel Case : Class, Structure, enum, extension ... etc
- letter sensitive

## 상수와 변수의 선언
### 상수
- runtime 동안 값 변경 x
-  let 키워드를 사용하여 상수 생성
- let [상수명] : [데이터타입] = [값]
- 데이터타입 생략가능

```Swift
let name: String = "Muzee"
let age: Int = 24
let major = "computer engineering"
```

### 변수
- runtime 동안 값 변경 가능
- var 키워드를 사용하여 변수생성
- var [변수명] : [데이터타입] = [값]
- 데이터타입 생략가능

```Swift
var job: String = "student"
var height = 170.0
height = 160.0
```

## 기본 데이터 타입
- Int : +,- 부호를 포함한 정수
- UInt : 0을 포함한 양의 정수
- Bool : 참(true),거짓(false)만 값으로 가짐. 0,1은 타입에러
- Float : 32비트 부동소수 표현 (소수점 6자리)
- Double : 64비트 부동소수 표현 (소수점 15자리)(권장)
- nil : 없음. 값이들어있지않고 비어있음을 나타내는 키워드
- Character : 한문자 (swift는 유니코드문자를 사용, 모든언어 및 특수문자 사용가능)
- String : 문자열, 유니코드를 사용하여 문자열앞뒤에 큰따옴표를 사용하여 표현
- 특수문자/제어문자 : 문자열내에 일정기능을하는 특수문자 ( \n, \ , * , \t ,\0 )
- Any : 모든 데이터 타입
- AnyObject : 제한적인 Any, 클래스에 인스턴스만 할당가능

## 타입추론
- 변수나 상수 선언시 특정타입을 명시하지 않아도 컴파일러가 할당된 값을 기준으로 타입을 결정
- 선언과 초기화를 분리할 때에는 선언부에 타입이 무조건 있어야 함
- `name` : 타입이 선언되어 있으므로 추론할 필요없다.
- `age` : 타입이 선언되어 있지 않으므로 입력값 20을 보고 타입 Int를 추론한다.
- `number` : 변수의 선언에서 타입이 명시되어 있지 않으므로 error 발생
```Swift
var name:String = "tester"
var age = 20

var number
number = 2   // error
```

## 컬렉션
### 튜플
- 지정된 데이터의 묶음
- 타입이름은 따로없고 일정타입의 나열생성됨
- 파이선의 튜플과 유사
```Swift
var cat: (name:String, age:Int, size:string) = ("name",2,"big")
```
### 배열
- 같은 타입의 데이터를 일렬로 순서대로 저장하는 형태의 컬렉션
```Swift
var name: Array<String> = ["muzee","asd","marr"]
var name:[String]
```
### 딕셔너리
- 순서없이 키와 값의 쌍으로 구성되는 컬렉션
```Swift
var codeForName: Dictionary<String, Int> = Dictionary<String,Int>()
var codeForName:[String,Int] = [String:Int]()
var codeForName:[String,Int] = [:]
```
### 세트
- 같은타입의 데이터를 순서없이 하나의 묶음으로 저장
- 중복없음
```Swift
var codes: Set<String> = Set<String>()
let 새: Set<String> = ["비둘기","닭","꿩","매"]
```
### 열거형
- 연관된 항목들을 묶어서 표현
- enum키워드를 사용하여 생성
```Swift
enum School { case primary, elementary, middle, high }
```