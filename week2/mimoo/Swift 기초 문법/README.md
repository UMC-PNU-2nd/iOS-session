## 문법 정리

함수마다 새 객체를 반환하는 것과 객체 자체를 바꾸는 것을 잘 구분해줍시다

## 배열 초기화
```swift
var list:[Int] = [Int](repeating: 0, count: n)
var graph:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
```

## sort
```swift
rangeList.sort(by: <) // sort: 배열 자체를 정렬
rangeList.sort(by: {(a:(Int,Int), b:(Int,Int)) -> Bool in
        if a.0 == b.0 {
            return a.1 < b.1
        }
        return a.0 < b.0
    })

let sortedList = rangeList.sorted(by: <) // sorted: 정렬된 새 배열 리턴
```

## reduce
```swift
let array = [1, 2, 3, 4]
let sum = array.reduce(0, +) // 초기값, 함수

let resultTuple:([Double], Int) = array.reduce( ([Double](), array.count) ) {    // 초기값: ([], 4)의 튜플
            let per = Double($1) / Double($0.1)
            return ($0.0 + [per], $0.1 - $1)
        }
```
`array`는 Int지만, 초기값은 튜플로 주고 `$0`은 튜플, `$1`은 Int로도 연산하는 등 다양한 조건 가능

## filter
```swift
dict = dict.filter( { (key:String, value: Int) -> Bool in return value >= 2 } ) // 필터링된 새 컬렉션 리턴
```

## enumerated
```swift
let array: [Character] = ["a", "b", "c", "d"]
for (offset, element) in array.enumerated() {  // (인덱스, 값) EnumeratedSequence 리턴
	print("\(offset): \(element)")
}
```

## Type Casting
### Character to Int
```swift
var c:Character = "5"
var n:Int = c.wholeNumberValue ?? 0
```

### String to Double
```swift
let sec:Double = Double(str) ?? 0.0
```

### Double의 정수 부분, 소수점 부분
```swift
extension FloatingPoint {
    var whole: Self { modf(self).0 }
    var fraction: Self { modf(self).1 }
}

let someDouble:Double = 1.234
let someWhole:Int = Int(someDouble.whole)
let someFraction:Double = someDouble.fraction
```
