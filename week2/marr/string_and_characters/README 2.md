>
*출처: [애플 공식  Swift 레퍼런스](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)*

### Multiline String 
Swift에서는 여러 줄을 포함하는 String 값을 선언하기 위해 **"""** 를 사용한다. 
```swift
let quotation = """
"Was it a cat I saw?",
Alice said.
"""
```
어디서 많이 본 것 같은 표현이라고 생각했는데, Python에서도 비슷한 방법(**'''**)으로 표현하고 있었다. 사실 Python에서는 다중 주석으로 더 유명한 것 같다. 최근에 알게 된 사실인데, Python에서도 원래는 주석이 아니라 String 값을 선언하는 방식이라고 한다.

만약 IDE에서만 여러 줄로 보이고, 실제 값은 한 줄로 하고 싶을 경우 아래과 같이 백슬래시를 통해 구현할 수 있다.
```swift
let softWrappedQuotation = """
"Was it a cat I saw?", \
Alice said.
"""
```

---

### Empty String
공백 String은 아래와 같이 표현할 수 있다. **공백 문자열 값**을 할당하여 표현할 수도 있고, **String()** 생성자를 통해서 할당할 수도 있다.
```swift
var emptyString = ""
var anotherEmptyString = String()
```

그리고 String이 비어있는지는 **empty** 메소드를 통해 판단할 수 있다.
```swift
print(emptyString.isEmpty)
```
---
### String Mutability
Swift의 String은 **변수**로 선언한 경우, 변형이 가능하다.
```swift
var variableString = "Horse"
variableString += " and carriage"
```
---
### String의 타입
Swift에서 String의 타입은 value이다. 따라서 함수 혹은 메소드를 통해 String이 전달되는 경우, 즉 String 자료형을 복사하는 경우 참조가 아닌 실제 값이 복사(**깊은 복사**)된다.
```swift
var origin = "origin"
var copied = origin
origin = "modified"
print(copied) // Deep copy
```
---
### Character와 String
Swift에서 String을 구성하는 각 Character를 접근하기 위해 **for-ln loop**를 사용할 수 있다. 그리고 Character의 경우 자료형을 명시해주어여 Character로써 사용할 수 있으며, **쌍따옴표**를 사용해주어야 한다.
```swift
for character in "Dog!" {
    print(character)
}

let exclamationMark: Character = "!"
```
String은 Character 배열을 통해서도 생성할 수 있다. 이 경우 **String()**에 인자로 배열을 전달해주면 된다.
```swift
let catCharacters: [Character] = ["C", "a", "t"]
let catString = String(catCharacters)
```

그리고 String 변수에 **append()** 메소드를 통해 Character 값을 추가할 수 있다.
```swift
var welcome = "Welcome"
welcome.append("!") // Welcome!
```

### Extended Grapheme Cluster (확장 자소 집합)
Swift의 모든 Character 자료형은 하나의 Extended Grapheme Cluster(확장 자소 집합)을 표현한다. 여기서 Extended Grapheme Cluster는 하나 혹은 그 이상의 유니코드 Scalar로 구성되어 있다. 따라서 한글과 같은 복잡한 문자도 하나의 Character 값으로 유연하게 표현할 수 있다. 
```swift
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
print("\(precomposed), \(decomposed)") // 한, 한
```
위의 경우 "한"처럼 **완성형** 문자의 유니코드를 저장한 것과 "ㅎ ㅏ ㄴ"처럼 분리형 자모음을 하나씩 이어 붙인 것 모두 Character로 저장이 가능하며, 출력할 경우 동일하게 나오는 것을 확인할 수 있다.

일반적으로 타 언어에서 문자(Character) 자료형은 한 개의 Scalar로 구성이 되는 것에 비해, Swift는 유니코드 문자를 유연하게 처리하기 위해 Extended Grapheme Cluster라는 방식을 사용하고 있음을 알 수 있다. 

그리고 이런 특성 때문에, 같은 문자를 표현하는 Character 값이라고 하더라도, 구성하고 있는 유니코드 Scalar의 차이에 따라 필요한 저장공간이 다를 수 있다. 이 때문에, Swift에서 Character 자료형은 값 저장을 위해 **<u>서로 다른 양의 메모리 공간</u>**을 사용할 수 있다.

여기서 Swift의 String이 가지는 독특한 특성이 하나 나오는데, 우선 아래 예시를 보자.

```swift
// Swift
var word = "안"
print("the length of word in \(word) is \(word.count)") // the length of word in 안 is 1
word += "\u{11AB}\u{11AB}" // ㄴㄴ
print("the length of word in \(word) is \(word.count)") // the length of word in 안ᆫᆫ is 1
```
```python
# Python
word = '안'
print(f'the length of word in {word} is {len(word)}') # the length of word in 안 is 1
word += '\u11AB'
print(f'the length of word in {word} is {len(word)}') # the length of word in 안ᆫ is 2
```
분명히 "ㄴ" 두개를 이어 붙였으나, String의 길이를 쟀을 때는 똑같이 나온다. 하지만 동일한 코드를 Python에서 실행했을 때는 다르게 나온다.

Swift에서는 String의 문자 개수를 구하기 위해서는 해당 **<u>String을 구성하고 있는 Extended Grapheme Cluster를 계산</u>**하기 전에는 불가능하다. 즉, String의 길이를 구하기 위해서는 반드시 **<u>전체를 순회</u>**해야한다. 따라서 Swift에서는 String의 길이를 구하는 메소드 **count**의 시간 복잡도는 **<u>O(N)</u>**이다.

### String 인덱싱과 시간 복잡도
앞서 [문법 정리 #3](https://velog.io/@rubinstory/Swift-문법-정리-3)에서 정리한 내용을 통해, Swift에서 String은 독특한 인덱싱이 필요하다는 것을 알 수 있었다. Swift는 이를 위해 String.Index라는 타입을 제공하고 있다. String.Index의 경우 **현재 위치의 앞과 뒤만 참조**할 수 있다. 따라서 다른 언어에서 String 상의 특정 Index로 이동하기 하는 작업을 Random Access를 통해 O(1)만에 수행할 수 있는 것과 다르게, Swift에서는 직접 하나씩 이동하므로 **O(N)**이 걸리게 된다.

다만 String의 맨 처음과 끝의 경우 **startIndex**, **endIndex**를 통해 접근할 수 있다. 만약 String 상의 특정 위치를 접근하고 싶으면, **index** 메소드를 통해 수행할 수 있다.
```swift
let greeting = "Guten Tag!"
greeting[greeting.startIndex] // G
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // u
greeting[greeting.index(greeting.startIndex, offsetBy: 7)] // a
```

그리고 String 전체를 순회하는 경우 아래와 같이 **for-in loop**를 사용한다.
```swift
for index in greeting.indices {
    // Access all of indeces of individual characters in string
    print("\(greeting[index])", terminator: " ")
}
```
---
### 문자의 삽입과 삭제
String에 문자를 삽입하는 경우 **insert** 메소드를 통해 수행할 수 있고, 삭제하는 경우 **remove** 메소드를 통해 수행할 수 있다. 만약 특정 범위의 문자들을 모두 삭제하는 경우 **removeSubrange** 메소드를 통해 수행할 수 있다.

그리고 insert, remove, removeSubrange 메소드는 **RangeReplacableCollection protocol**을 따르는 모든 타입에서 사용 가능하며, 대표적으로 **String, Array, Dictionary 그리고 Set**이 있다.
```swift
var hello = "hello"
hello.insert("!", at: hello.endIndex) // hello!
hello.insert(contentsOf: " there", at: hello.index(before: hello.endIndex)) // hello there!
// at: hello.endIndex -> hello! there

hello.remove(at: hello.index(before: hello.endIndex)) // hello there
let range = hello.index(hello.endIndex, offsetBy: -6)..<hello.endIndex
hello.removeSubrange(range) // hello
```
--- 
### Substring(부분 문자열)
Substring의 경우 String과 마찬가지로 메모리에 저장이 된다. 다만, 성능 향상을 위해 Substring의 경우 저장된 메모리 공간이 재활용될 수 있다. 따라서 자주, 오래 사용되어야 하는 경우에는 String으로 저장하는 것이 바람직하다.
```swift
var greetings = "Hello, world!"
let index = greetings.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greetings[..<index] // Hello
// Convert the result to a String for long-term storage
let newString = String(beginning)
```
---
### Prefix and Suffix Equality
Swift에서는 String 내에 특정 값이 존재하는지를 확인하는 메소드를 제공한다. **hasPrefix**의 경우 해당 String이 특정 값으로 시작하는지를 반환하고, **hasSuffix**의 경우 해당 String이 특정 값으로 끝나는지를 반환한다.
```swift
let romeoAndJuliet = "Act 1 Scene 1: Verona, A public place"
print(romeoAndJuliet.hasPrefix("Act 1")) // true
print(romeoAndJuliet.hasPrefix("Scene 1")) // false
print(romeoAndJuliet.hasSuffix("place")) // true
```

