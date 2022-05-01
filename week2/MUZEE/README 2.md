# Week 02_Auto Layout

# Auto Layout

<aside>
📌 **제약 조건(Constraints)**에 따라  뷰 계층 구조에 있는 모든 뷰의 크기와 위치를 **동적으로 지정**하는 것

</aside>

### 왜 필요한가?

화면의 구성요소들을 좌표로 정해버리면, 해상도가 다른 화면에서 다르게 표현될 수 있다. 아래 코드에서 원점에서 x로는 30만큼 y로는 80만큼 떨어진 곳에 너비 350, 높이 200으로 사진 넣었지만 iPhone8과 iPad는 해상도가 다르기 때문에 저딴식으로 나타나게 된다. 

```swift
let myView: UIImageView = .init(frame:.init(x: 30, y: 80, width: 350, height: 200))
```

![Untitled](Week%2002_Au%2032194/Untitled.png)

가능한 모든 기기의 해상도를 받아와 계산해서 넣을 수야 있지만,,, 너무나 비효율적인 과정이다. 그래서 우리의 착하고 똑똑한 Auto Layout은 ‘애들끼리 상대적인 위치만 알려줘 봐 내가 알아서 구성해줌ㅇㅇ’하고 해준다.

### Constraints 제약 조건

화면의 구성요소들 간의 상대적인 위치나 크기를 지정해주는 것이 Constraints이다. 아래 그림처럼 좌우로 30, 위로 50만큼 떨어진 곳에 높이가 200인 imageView를 띄워라! 하는 것이다.

![Untitled](Week%2002_Au%2032194/Untitled%201.png)

제약조건을 줄 때, 반드시 크기와 위치를 알게끔 줘야한다. 명시를 해주든, 다른 Constraints로 추론을 할 수 있든지 간에 말이다. 위 예로 보면 width는 직접 주지 않았지만 왼쪽 오른쪽 공백의 크기를 통해 width를 추론해 낼 수 있다. 또, 아래 공백을 설정하지 않았기 때문에 height를 명시해주었다. 근데 여기서 width도 Constraints에 추가하면, width에 대한 정보가 두가지가 생기기 때문에 에러가 뜬다...

### Constraints 의 요소

1. 크기에 대한 요소 : height, width
2. 위치에 대한 요소
    1. margin : top, bottom, leading(left), tailing(right) 각각 위, 아래, 왼쪽, 오른쪽으로부터 얼마나 떨어져있을지
    2. alignment : 정렬기준. x,y축으로부터 얼마나 떨어져 있을건지, 다른 요소들과 정렬할건지
    

### 크기 결정하는 법

1. height, width Constraints 주기
2. margin 에 대한 제약조건으로 추론할 수 있게 하기
3. 기준 요소에 대한 비율
    
    ![Untitled](Week%2002_Au%2032194/Untitled%202.png)
    
4. Intrinsic Content Size : 뷰가 원래 가지고 있었던 크기를 고유 콘텐츠 크기(Intrinsic Content Size)라고 한다. 즉 오토레이아웃에 의해 변경되기 전 원본 크기를 의미한다.

![Untitled](Week%2002_Au%2032194/Untitled%203.png)

### **제약 우선도(Constant Priority)**

오토레이아웃에서 제약이 가지는 우선도를 말한다. 만약 제약이 충돌하는 경우, 우선도가 높은 제약부터 레이아웃에 적용된다. 고유 콘텐츠 크기보다 뷰가 커지지 않도록 제한하는 **콘텐츠 허깅 우선도(Contents Hugging Priority)** 와, 이와 반대로 작아지지 않도록 제한하는 **콘텐츠 축소 방지 우선도(Contents Compression Resistance Priority)ㅊ** 가 있다.

## Safe Area

<aside>
📌 **시스템에 의해 가려질 수 있는 부분**의 마진을 자체적으로 갖고 있는 영역

</aside>

앱을 화면 전체로 사용한다면 가려지는 부분이 생긴다. 머머리 부분이나, 상단바, 모서리 부분 등.. 그래서 Safe Area는 그러한 부분을 제외한 영역 안에서 개발할 수 있게 해준다. 아래 그림의 왼쪽이 전체화면인 Super View 영역, 오른쪽은 Safe Area의 영역을 보여주고 있다. 

![Untitled](Week%2002_Au%2032194/Untitled%204.png)

![Untitled](Week%2002_Au%2032194/Untitled%205.png)