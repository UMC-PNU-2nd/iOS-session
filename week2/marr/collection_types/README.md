>
*출처: [애플 공식  Swift 레퍼런스](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)*

### Collection Types
Swift에서는 Array, Set 그리고 Dictionary 총 3가지의 Collection type들을 제공한다. Array의 경우 순서가 있는 값들의 집합이고, Set의 경우 중복을 허용하지 않고 순서가 없는 값들의 집합이며 Dictionary의 경우 순서가 없는 Key-Value 쌍의 집합이다.

---
### Array
Array의 경우 순서가 존재하는 값들의 집합이다. 따라서 같은 값이 다른 위치에 중복으로 나타날 수 있다. 비어있는 Array는 다음과 같이 선언할 수 있다.
```swift
var someInts: [Int] = []
// var somInts: Array<Int> = []
```
그리고 **append** 메소드를 통해 값을 추가할 수 있으며, **+=** 연산자를 통해서 Array를 추가할 수도 있다. 초기화를 원하는 경우 빈 Array를 대입하면 된다.
```swift
someInts.append(3)
someInts += [4, 5] // [3, 4, 5]
someInts = [] // Now someInts is empty!
```
만약 Array를 선언함과 동시에 특정 값들로 채우고 싶다면, **repeating과 count** 인자를 통해 원하는 값들로 채울 수 있다. 그리고 두 Array를 합쳐 새로운 Array도 생성할 수 있다.
```swift
var threeDoubles = Array(repeating: 0.0, count:3)
// [0,0, 0,0, 0,0]
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
// [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```
Array는 특정 위치의 값을 접근하기 위해 정수형 Index를 사용할 수 있으며, 특정 범위의 값들을 한번에 접근할 때는 **Array[start...end]**를 통해 수행할 수 있다.
```swift
var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList[0] = "Six eggs" // ["Six eggs", "Milk"]
shoppingList[0...1] = ["Tomato", "Noodle"] // ["Tomato", "Noodle"]
shoppingList[shoppingList.endIndex...] = ["Banana", "Apple"] // ["Tomato", "Noodle", "Banana", "Apple"]
```
여기서 특이한 점은, 만약 **Array[endIndex...] = [...]**와 같이 작성할 경우 마치 값을 추가하는 것처럼 동작한다는 것이다.

만약 특정 위치에 값을 추가하고 싶은 경우, **insert(_: , at: )** 메소드를 통해 수행할 수 있다. 그리고 삭제하고 싶은 경우에는 **remove(at: )** 메소드를 통해 수행할 수 있다. 이때 remove 메소드의 경우 삭제한 값을 **반환**한다. 이외에도 removeFirst, removeLast 등 다양한 메소드들이 있다.
```swift
shoppingList.insert("Maple Syrup", at: 0) // ["Maple Syrup", ...]
let mapleSyrup = shoppingList.remove(at: 0) // "Maple Syrup"
```

Array를 순회하는 경우 **for-in loop**을 통해 쉽게 가능하다. 만약 Index와 값 모두가 필요한 경우, **enumerated** 메소드를 통해 수행할 수 있다. eunmerated 메소드의 경우 값과 해당 값의 Index를 **Tuple**의 형태로 반환한다.
```swift
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
```

### Set
Set은 **중복을 허용하지 않고** 순서도 없는 값의 집합이다. Set 자료형은 값을 저장할 때 해시값을 사용한다. 따라서 사용자가 만든 커스텀 자료형을 Set에 저장하고 싶다면 반드시 Swift 표준 라이브러리의 **Hasahble Protocol**을 확장해서 사용해야 한다. 그리고 이건 Set 뿐만 아니라, **Dictionary 자료형의 Key**에도 해당하는 내용이다.

Set의 사용법은 대체적으로 Array와 유사하다. 단, **insert** 메소드의 경우 Index가 존재하지 않는데, 이는 Set은 순서가 없는 집합이기 때문이다.
```swift
var letters = Set<Character>()
letters.insert("a")
letters = []
letters += ["b"] // Error!
```

원소를 삭제하는  **remove** 메소드의 경우 Array와 다소 차이가 있다. 아래 예시를 보자.
```swift
let removedGenre = favoriteGenres.remove("Rock") // removedGenre -> String?
```
Set에서 remove는 Optional 값을 반환한다. 이는 삭제하려고 하는 값이 Set에 존재하지 않을 수 있기 때문이다. 따라서 remove를 사용할 때에는 반드시 Optional 여부를 잘 확인 해주어야 한다.

특정 값의 존재 여부는  **contains(_:)** 메소드를 통해 확인할 수 있다.
```swift
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} 
```
만약 Set에 있는 값들을 정렬할 필요가 있을 경우, **sorted(by: )** 메소드를 통해 수행할 수 있다.
```swift
for genre in favoriteGenres.sorted(by: <) {
    print(genre)
}
```
---

### Set 연산 수행
![Set 연산 예시](https://images.velog.io/images/rubinstory/post/1cf780ae-2dc6-4e09-91d7-c2b2e8183e7b/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202022-03-20%2021.47.08.png) *사진 출처: 애플 Swift 공식 레퍼런스*

위 사진은 Swift에서 제공하는 Set 연산의 종류들이다. 교집합, 합집합, 차집합 등의 연산들을 제공하고 있다.

```swift
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbes: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbes).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbes).sorted()
// [1, 2, 9]
```

그리고 아래와 같이 부분집합의 여부도 확인할 수 있다.
```swift
let houseAnimals: Set = ["Dog", "Cat"]
let farmAnimals: Set = ["Cow", "Chicken", "Sheep", "Dog", "Cat"]
let cityAnimals: Set = ["Pigeon", "Rat"]
houseAnimals.isSubset(of: farmAnimals) // true
farmAnimals.isSuperset(of: houseAnimals) // true
farmAnimals.isDisjoint(with: cityAnimals) // true
```

### Dictionary
Dictionary는 key와 value의 쌍들의 집합이다. Dictionary 역시 Set과 마찬가지로 **순서가 없으며**, **key**의 경우 **중복을 허용하지 않는다**. 

Dictionary의  key와 value는 자료형이 동일하지 않아도 된다. 따라서 선언할 때 key와 value의 자료형을 명시해 주어야 한다.
```swift
var namesOfIntegrs: [Int: String] = [:]
namesOfIntegrs[16] = "sixteen"
namesOfIntegrs = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```

Dictionary의 value는 key를 통해 접근할 수 있다. 이때 **[]**  를 통해 접근하고 값을 바꿀 수 있다.
```swift
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
```

그리고 Dictionary 자료형은 **updateValue(_:, forKey: )** 메소드를 통해서도 특정 key에 대응하는 value를 바꿀 수 있다. 이때 updateValue는 기존 값을 반환하게 된다.
```swift
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
```

key와 value 쌍을 제거하는 방법은 2가지가 있다. 첫번째는 **[]** 를 통해 접근하여 **nil** 값을 할당하는 것이고, 두번째는 **removeValue(forKey: )** 메소드를 사용하는 것이다. 이떄 removeValue 메소드는 삭제된 값을 반환하게 된다.
```swift
airports["DUB"] = nil // removing from dictionary

if let removedValue = airports.removeValue(forKey: "DUB") {
    print(removedValue)
}
```

Dictionary를 순회할 때는 Array, Set과 마찬가지로 **for-in loop**를 사용할 수 있다. 단, Dictionary는 기본적으로 key와 value가 쌍을 이루므로, 이를 Tuple로써 반환해준다. 만약 key 혹은 value만 순회하고 싶다면, **keys**와 **values** 으로 접근할 수 있다.
```swift
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values.sorted(by: <) {
    print("Airport name: \(airportName)")
}
```
마지막으로, 만약 key 혹은 value들만 따로 Array로 저장하고 싶다면, 아래와 같이 수행할 수 있다.
```swift
let airportCodes = [String](airports.keys)
let airportNames = Array<String>(airports.values)
```
