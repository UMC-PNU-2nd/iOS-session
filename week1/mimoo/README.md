## Week 01 - Playground 실습

week1은 Swift 기초 입니다~~  
Xcode 설치 및 프로젝트 생성은 생략합니다  

### 상수, 변수 선언
```swift
// 상수
let name: String = "MiMoo"
let name2 = "MiMoo2"

// 변수
var year: Int = 2022
var year2 = 2022

year = 2023
print(year)
```
- 여타 C++, Java 등의 언어에서 상수는 `const` 키워드를 사용했지만, Swift에서는 `let`을 사용 
- 타입은 변수명 뒤에 적음
    - 적어주지 않아도 자동으로 캐스팅이 되지만 웬만하면 잘 적어주자  

### 함수
```swift
// 함수
func sum(a: Int, b: Int) -> Int {
    return a+b
}

func mul(a: Int, b: Int) -> Int {
    a*b
}
```
- `func 이름(파라미터, ... ) -> 리턴 타입 {}`
- 간단한 경우 return의 생략 가능

#### Closure Expressions
```swift
// ex) 정렬
var years: Array<Int> = [2022, 2000, 2002, 2005]
var sortedyears: Array<Int> = years.sorted(by: { (a: Int, b: Int) -> Bool in
  return a < b
})

print(sortedyears)
// [2000, 2002, 2005, 2022]
```
클로저 표현식

```swift
var sortedyears: Array<Int> = years.sorted { (a: Int, b: Int) -> Bool in return a < b }
var sortedyears: Array<Int> = years.sorted { (a: Int, b: Int) in return a < b }

// 인덱스
var sortedyears: Array<Int> = years.sorted { return $0 < $1 }
```
위의 경우 매개변수가 하나이므로 더 줄일 수 있음

### Protocol
```swift
protocol Person {
    func eat()
}

class Student: Person {
    func eat() {
    	print("Student is eating...")
    }
}

class Teacher: Person {
    func eat() {
    	print("Teacher is eating...")
    }
}
```
- Protocol: 어떤 메소드, 프로퍼티 등을 정의해 놓은 규칙
    - 자바의 Interface와 유사
- ex) 만약 `Student`에 함수 `eat()`을 구현하지 않을 경우 에러 발생
    - "Type 'Student' does not conform to protocol 'Person'"  
- 구조체, 클래스, 열거형에서 사용 가능

