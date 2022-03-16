# Swift 기본 문법

주차: 1️⃣

## 절차지향 VS 객체지향

### 절차지향

순차적인 처리 중요시, 프로그램 전체가 유기적으로 연결되도록 만드는 프로그래밍 기법

ex) C언어

**장점**

- 컴퓨터의 처리구조와 유사 → 실행속도 빠름

**단점**

- 유지보수 어려움
- 실행 순서가 정해져 있어 코드의 순서가 바뀌면 동일한 결과 X
- 디버깅이 어려움

### 객체지향

데이터와 절차를 하나의 덩어리로 묶어서 생각한다

**특징**

1. 캡슐화
관련된 데이터와 알고리즘이 하나의 묶음으로 정리된 것, 데이터를 감추고 외부 세계와의 상호작용은 메소드를 통하는 방법 → 라이브러리로 만들어 업그레이드 하면 쉽게 바꿀 수 있음
2. 상속
이미 작성된 클래스를 이어 받아 새로운 클래스 생성 → 기존 코드 재활용
3. 다형성
하나의 객체가 다른 여러 객체로 재구성되는 것
ex) python - override()
4. 추상화
실존하는 객체의 여러 특성 중, 프로그램을 만드는데 필요한 부분만 파악해서 추출하고 필요하지 않은 것은 제거

**장점**

- 코드의 재활용성 높음
- 생산성 증가 - 문제되는 부분만 수리하면 됨
- 디버깅 쉬움

**단점**

- 속도가 절차지향에 비해 느림
- 설계에 많은 시간 소요

![R1280x0-27.png](Swift%20%E1%84%80%E1%85%B5%E1%84%87%E1%85%A9%20bd00f/R1280x0-27.png)

![R1280x0-28.png](Swift%20%E1%84%80%E1%85%B5%E1%84%87%E1%85%A9%20bd00f/R1280x0-28.png)

절차적으로 코딩할 때에는 대개 프로젝트 규모가 크지 않고 재사용할 일이 적은 경우에 많이 쓰인다 → 프로그램 자체가 가벼워지고 개발 시간이 줄기 때문

반대로 규모가 커지면 코드 재사용을 필수적으로 고려해야하기 때문에 객체 지향 프로그래밍이 유용하다

## Optional

[Optional & TypeCasting](https://github.com/UMC-PNU-2nd/iOS-study/blob/Muss/week1/Readme/Optional%20%26%20TypeCasting.md)

## UIKit & SwiftUI

[UIKit & SwiftUI](https://github.com/UMC-PNU-2nd/iOS-study/blob/Muss/week1/Readme/UIKit%20%26%20SwiftUI.md)

## Func

[[Swift]Function 정리](http://minsone.github.io/mac/ios/swift-function-summary)

## Class & Struct

### Class

- 참조 타입 → 같은 클래스 인스턴스를 여러 개의 변수에 할당한 뒤, 값을 변경시키면 할당한 모든 변수에 영향을 준다(**인스턴스를 만들 때 메모리를 복사하기 때문**)
- 상속 가능
- 선언 시, init 함수(초기화 함수) 필요

### Struct

- 값 타입 → 같은 구조체를 여러 개의 변수에 할당한 뒤 값을 변경시키더라도 다른 변수에 영향 X(**값 자체를 복사하기 때문**)
- 상속 불가능

애플 공식문서에 따르면, 웬만하면 struct를 사용하라고 한다.

- 구조체가 더 안전하고 버그가 없다(특히 멀티 쓰레드 환경에서)
- 한 인스턴스를 여러 군데에서 참조하는 것보다 값을 가지고 있는 것이 더 안전하다

[Introduction to classes and structs in Swift - LogRocket Blog](https://blog.logrocket.com/introduction-to-classes-and-structs-in-swift/)

## Break Point

말 그대로 중단점, 디버깅 할 때 사용

### Debug Bar

- Disable/enable breakpoint: 모든 브레이크 포인트를 활성화/비활성화 할 수 있다.
- Pause/continue execution: 다음 브레이크 포인트가 나오기 전까지 계속 진행하겠다. 브레이크 포인트를 여러개 걸어놓고 이 버튼을 누르면서 사용하면 편하다.
- Step over: 브레이크 포인트가 걸린 라인의 다음라인으로 넘어가겠다.
- Step into: 만들어 놓은 메서드 안으로 들어가겠다. customMethod(aaa) 라면 customMethod 안으로 들어간다.
- Step out: 메서드 밖으로 벗어나가겠다. customMethod 밖으로 벗어난다.

### 디버깅 명령어

LLDB → 소프트웨어 디버깅 도구(디버깅 명령어를 사용해 변수값을 보거나, 프로그램 수정 가능)

print(”테스트”) 할 필요 없음,, 이걸 왜 이제 알았지;;

- p: 현재 메모리 상태에 있는 것을 프린트 해준다
- expr: 새로운 변수를 넣거나 값을 변경하고 싶을 때 사용
ex) 색 변경, Auto Layout Constraint 변경 및 확인