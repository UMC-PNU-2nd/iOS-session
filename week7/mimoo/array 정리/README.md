
## Array에서 삭제 관련 함수들 정리

| 함수	 | Return 값	 | 원본 조작	 | 비고	 | 시간 복잡도	 |
| :--: | :--: | :--: | :--: | :--: |
| `remove(at:)`	 | 없앤 값	 | O	 | 해당 위치 없으면 오류	 | O(n)	 |
| `removeFirst()`	 | 없앤 값(처음 값)	 | O	 | 해당 위치 없으면 오류	 | O(n)	 |
| `removeFirst(_:)`	 | void	 | O	 | 해당 위치 없으면 오류	 | O(n)	 |
| `removeLast()`	 | 없앤 값(마지막 값)	 | O	 | 해당 위치 없으면 오류	 | O(1)	 |
| `removeLast(_:)`	 | void	 | O	 | 해당 위치 없으면 오류	 | O(k)	 |
| `popFirst()`	 | 없앤 값(처음 값) optional	 | O	 | subsequence만 가능	 | O(1)	 |
| `popLast()`	 |  없앤 값(마지막 값) optional	 | O	 | 	 | O(1)	 |
| `dropFirst(_:)`	 | 원본 배열을 복사해서 값들 없앤 subsequence	 | X	 | 	 | RandomAccessCollection이면 O(1),<br>아니면 O(k)	 |
| `dropLast(_:)`	 | 원본 배열을 복사해서 값들 없앤 subsequence	 | X	 | 	 | RandomAccessCollection이면 O(1),<br>아니면 O(k)	 |


## [ArraySlice](https://developer.apple.com/documentation/swift/arrayslice)  
원본 ㅁrray를 참조하는 것이므로 새로 메모리 차지하지 않음  
ArraySlice는 슬라이스된 부분 뿐만 아니라 array 원본 전체에 대한 참조를 하는데, 장기 저장하게 될 경우 원본 ㅁrray의 수명이 끝난 뒤에도 참조를 유지하고 있으므로 메모리 누수가 발생할 수 있다.  

### 인덱스
ArraySlice는 원본 배열의 전체를 참조하지만 `startIndex`와 `endIndex`로 일정 범위를 끊어서 그 범위만 접근한다. 따라서 인덱스는 0부터가 아닐 수 있음  

#### 코드
```swift
var arr3:[Int] = [0, 1, 2, 3, 4]
var slice3 = arr3[1...]
print(slice3)
// error: print(slice3[0])
print(slice3[1])
```

#### 결과
```
[1, 2, 3, 4]
1
```

### 원본 Array 또는 ArraySlice 조작
#### 코드
```swift
var arr:[Int] = [0, 1, 2, 3, 4]
var slice = arr[arr.indices]
print("slice.popFirst()!: \(slice.popFirst()!)")
print("arr: \(arr)")
print("slice: \(slice)")
print()

var arr2:[Int] = [0, 1, 2, 3, 4]
var slice2 = arr2[arr2.indices]
print("arr2[arr2.indices].popFirst()!: \(arr2[arr2.indices].popFirst()!)")
print("arr2: \(arr2)")
print("slice2: \(slice2)")
print()
```

#### 결과
```
slice.popFirst()!: 0
arr: [0, 1, 2, 3, 4]
slice: [1, 2, 3, 4]

arr2[arr2.indices].popFirst()!: 0
arr2: [1, 2, 3, 4]
slice2: [0, 1, 2, 3, 4]
```
