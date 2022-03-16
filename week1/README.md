### 상수와 변수 선언
다른 여타 언어와 마찬가지로, Swift 역시 상수와 변수를 선언할 수 있다. C++에서는 상수와 변수의 차이가 **const**의 유무에 따라 달라진 반면, Swift에서는 선언하는 방식 자체가 다르다.

```cpp
# C++ Style
const int maximumNumberOfLoginAttempts = 10
int currentLoginAttempt = 0
```

```swift
// Swift Style
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
```
상수의 경우 **let** 키워드를 이용하여 선언할 수 있고, 변수의 경우 **var** 키워드를 이용하여 선언할 수 있다.

위처럼 한 줄에 하나의 변수를 선언할 수 있지만, 아래와 같이 한 줄에 여러 변수를 선언할 수도 있다.
```swift
var x = 0.0, y = 0.0, z = 0.0
```
---
### 자료형
Swift는 자료형의 **자동 할당**을 지원한다. 따라서 위의 예시와 같이 변수의 자료형을 명시하지 않고도 사용할 수 있다. 하지만 실제 프로그래밍을 할 때 명시된 자료형은 생각보다 중요하다(대표적인 예시로 TypeScript). 

Swift의 경우 자동 할당을 지원하지만, Python과는 다르게 한번 자료형이 할당된 이후에는 변수의 자료형이 고정된다. 그리고 자료형을 아래와 같이 명시할 수도 있다.
```swift
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double
```
---
### String Interpolation
Swift에서도 Python의 Format과 유사한 방식으로 변수를 출력문에 포함시킬 수 있다. Python에서는 **{ }** 을 사용하는 반면 Swift에서는 ** \ ( ) **을 사용한다.
```python
# Python Style
print(f'The current value is {welcomeMessge}')
```
```swift
// Swift Style
print("The current value is \(welcomeMessage)")
```
---
### Type Alais
C++의 **typedef** 와 유사하게, Swift에서도 자료형의 별명을 정의할 수 있는 키워드를 제공한다. Swift에서는 **typealias** 를 사용하여 자료형의 별명을 정의할 수 있다.
```swift
typealias AudioSample = UInt16
```
---
### 튜플
Swift 역시 다른 언어들과 마찬가지로 튜플 자료형을 지원한다. 튜플은 **( )** 를 통해서 값을 표현한다. 그리고 변수에 값을 할당할 때, 만약 2개의 다른 변수에 하나의 튜플 값을 각각 할당해주고 싶다면 아래와 같이 할 수 있다.
```swift
let http404Error: (Int, String) = (404, "Not Found")
// Type Definition is not essential!
let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
print("The status Message is \(statusMessage)")
```
그리고 만약 튜플에서 하나의 값만 변수에 할당해주고 싶다면, 아래와 같이 사용할 수 있다.
```swift
let (justTheStatusCode, _) = http404Error
```

마치 C++의 **pair<type,type>** 과 유사해보인다. 하지만 다른 점이 있는데, Swift의 튜플은 pair와 다르게 2개보다 많은 값을 가질 수 있다.
```swift
let james = ("James", "Male", "010-1234-5678")
```

대소 비교의 경우 pair와 유사한 방식으로 동작한다. 같은 개수의 값과 자료형을 가진 튜플들의 경우 대소비교가 가능한데, 이 경우 왼쪽부터 오른쪽까지 값을 하나씩 비교해 나간다.
```swift
print((1, "zebra", -1) < (2, "apple", -1)) // true
print((3, "apple") < (3, "bird")) // true
print((4, "dog") == (4, "dog")) // true

print(("blue", false) < ("purple", true)) // error!
```
단, 대소비교가 불가능한(예. Bool) 값이 있을 경우 아무리 해당 값에 도착하기 전에 대소비교가 가능하더라도 오류가 난다. 위의 경우 이미 "blue"와 "purple"만으로도 대소비교가 가능하지만, 그 다음의 값이 Boolean이기 때문에 오류가 나게 된다. Swift에서 **Bool**은 대소비교가 불가능한 자료형이다.

---
### Nil과 Optional
원래 Objective-C에서 nil은 객체 참조에 사용되었고, null은 그외 다른 값들을 참조하는데 사용했었다. 하지만 Swift에는 null이 존재하지 않는다. 이는 Objective-C에서 Swift로 넘어오면서 null과 nil 중 nil만 가져왔기 때문이다. Swift에서 nil은 값이 없는 상태(valueless state)를 의미한다.

**Optional** 은 값이 없을 수도 있다는 것을 의마한다. 예를 들어, 어떤 변수가 주어졌을 때 해당 변수가 값을 반드시 지닌다는 것을 보장하지 못하는 경우, Optional을 사용하여 표현할 수 있다.

```swift
var serverResponseCode: Int? = 404
serverResponseCode = nil
```
위 코드를 보면 **?** 를 사용하여 Optional을 명시한 것을 알 수 있다. 그리고 nil의 경우 반드시 Optional 타입의 변수에만 사용할 수 있다.

그리고 조건문 없이 간단하게 nil 여부를 판단하여 원하는 값을 변수에 저장할 수 있다.
```swift
let defaultColor = "red"
var userDefinedColor: String? // defaults to nil
var colorToUse = userDefinedColor ?? defaultColor
print(colorToUse) // result is "red"
```
위 코드는 userDefinedColor 변수의 상황에 따라 colorToUse 변수에 다른 값이 저장된다. 만약 userDefinedColor이 nil이라면 뒤 쪽의 defaultColor의 값이 할당되며, 그렇지 않은 경우 userDefinedColor의 값이 할당된다.
