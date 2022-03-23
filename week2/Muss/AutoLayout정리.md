# Auto Layout

: 제약 조건(Constraints)에 따라 뷰 계층 구조에 있는 모든 뷰의 크기와 위치를 동적으로 지정하는 것이다.

## External Changes

superview의 크기나 모양이 변할 때 external change가 일어난다

ex) 화면을 돌리거나, 스플릿 뷰를 들어가거나 나올 때(아이패드), 등등

이런 특수한 경우가 아니더라도, OS를 사용하는 디바이스의 크기가 제각각이므로 일관된 사용자 경험을 주기 위해선 동적으로 변하는 사이즈가 필수다.

## Internal Changes

ex) 앱의 변화로 컨텐츠가 보여질 때, 앱이 국제화를 지원할 때, 등등

- 뉴스 앱 → 기사의 길이에 따라 레이아웃이 달라짐
- 국제화된 앱 → 지원하는 언어에 따라 레이아웃이 달라짐
텍스트의 사이즈 뿐만 아니라 레이아웃의 조직화도 달라질 수 있음

---

## Frame-Based Layout

![](https://images.velog.io/images/enchantee/post/3c4e3a38-22bb-4935-9281-ab9d46cc8e0a/R1280x0-5.png)

오토 레이아웃을 사용하지 않고 x, y, width, height 값만 정의 해주는 fram-based layout은 현재 화면의 크기를 고려하지 않는다.

이러한 방식은 뷰의 사이즈가 달라질 때마다 위치 및 크기를 다시 계산해주어야 하는 단점이 존재한다 → 동적으로 변하지 X

## Auto Layout
![](https://images.velog.io/images/enchantee/post/3dcada39-be05-4e73-8042-9e9b53913fb3/R1280x0-6.png)

따라서 view의 frame 좌표를 직접 지정해주는 것이 아니라, 위와 같이 imageView의 위치나 크기를 다른 객체(Safe Area)를 이용해 "**상대적**"으로 제약을 주는 것을 auto layout이라 부른다.

내 위치를 다른 객체로부터 상대적으로 나타내는 것이 **Constraints이다.**

ImageView의 **width를 별도로 지정해주지 않았지만, 이 경우엔** Leading / Trailing Cosntraints에 의해 해상도 별로 width가 자동으로 지정 된다.

만약 이미 width 값이 동적으로 결정되는데, width를 또 직접 지정하는 constraint를 추가해버리면, 동적으로 결정된 값을 따를지 constraint를 따를지 몰라 constraints가 충돌했다며, leading / trailing / width 중 하나를 지우라는 에러가 뜬다.

- Top: Text의 위쪽
- Bottom: Text의 아래쪽
- Leading : Text가 시작되는 지점
- Trailing : Text가 끝나는 지점

---

## Safe Area
<center>
<img src="https://images.velog.io/images/enchantee/post/7a1e6107-169a-4cab-a329-43705fbd1d90/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-11-27_%EC%98%A4%ED%9B%84_10.59.56.png" width=200>
</center>


### Top / Bottom Layout Guide

iOS11이 나오기 전, 직사각형의 화면을 가졌을 때는 상태 바, 내비게이션 바, 탭 바, 등에 의해서 View가 가려지지 않기 위해 제공 되던 시스템적인 마진이었다. 가로 모드일 때도 top, bottom만 신경쓰면 됐다.

 하지만 iOS 11이 등장하며 노치 디자인이 생겼고 이는 Landscape 모드일 때 Leading / Trailing에 대한 마진도 필요하게 되었다.

따라서 기존에 쓰이던 Top / Bottom Layout Guide에서 상하좌우 모두 시스템 마진을 가지는 Safe Area로 옮겨가게 되었다.

### Safe Area 사용하지 않는 법

1. 특정 Constraints만 safe area 적용하지 않기
    
    safe area로 되어있는 기준 뷰를 superview로 바꿔주면 특정 constraints에 한해서 safe area 적용을 풀 수 있다.
    
2. View controller 에서 use safe area layout guide를 끄면 safe area는 사라지고 top / bottom layout이 등장한다.

동영상, 사진 같이 화면을 꽉 채워야만 하는 특별한 경우가 아닌 이상 Safe Area 사용을 권장!
<br>
## Intrinsic Content Size

Intrinsic Content Size란 말 그대로 컨텐츠의 "**본질적인 크기**"를 가리킨다.

앞서 언급했듯이, Label에 constraints를 줄 때, Width를 우리가 지정하지 않았지만, View와 다르게 레이아웃단 에러가 나지 않은 이유는

Label은 Width 뿐만 아니라 Height에 대해 Intrinsic Content Size를 가지기 때문이다
![](https://images.velog.io/images/enchantee/post/4862317d-aaa9-4f0f-953e-8932f04cb58d/R1280x0-7.png)

텍스트와 폰트의 크기에 따라 본질적인 Width, Height를 자체적으로 갖기 때문에, Label에 대해 Width, Height를 지정해주지 않아도 에러가 나지 않는다.

따라서 글자의 길이가 길어지면 길어지는대로 텍스트의 크기는 늘어난다(화면 밖을 벗어나도)

만약 여기서 양쪽 constraints를 20씩 주고 싶다고 하면 자동으로 trail 부분이 truncate됨을 알 수 있다 → Line Break를 어떻게 설정하는지에 따라 다르게 나타낼 수 있음

텍스트가 잘리지 않고 싶다 → Lines 갯수 늘리면 된다

**Intrinsic Content Size를 가지는 대표적인 것들**

|  | Intrinsic Content SIze Width | Intrinsic Content Size Height |
| --- | --- | --- |
| UIView | ❌ | ❌ |
| UI Slider | ⭕️ | ❌ |
| UILabel, UIButton, UISwitch, UITextField | ⭕️ | ⭕️ |
| TextView, ImageView | Content에 따라 변한다. | Content에 따라 변한다. |
<br>

## Priority
<center>
<img src="https://images.velog.io/images/enchantee/post/8da3d603-6510-4ca2-b3ce-964e15364aa7/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-11-27_%EC%98%A4%ED%9B%84_11.28.05.png" width=200>
</center>

다음과 같이 intrinsic content size를 가지는 두 Label에 다음과 같이 constraints를 정의해주면 왼쪽은 trailing, 오른쪽은 leading constraints가 없다는 오류가 난다. 

따라서 왼쪽 Label의 Trailing을 오른쪽 Label의 Leading으로 Contraints를 맞춰주면, 하나의 view의 priority를 바꾸라는 빨간 오류가 뜬다.

### Content Hugging Priority

위의 방식으로 Leading Trailing을 설정하면 이 constraints에 의해 둘 중 하나의 width는 동적으로 설정돼 intrinsic width를 유지하지 못 한다. 

둘 다 우선순위가 같아서 어떤 label이 늘어나야 할 지를 모르는 것이다.

두 오브젝트 중에 한 놈이 "커져야" 하는 상황일 때 어떤 놈이 Intrinsic Size를 유지 못하고 늘어날래?

=> 우선순위(Hugging Priority Horizontal / Vertical) 높은 놈은 Intrinsic Size를 유지, 낮은 놈이 늘어남!

### **Content Compression Resistance Priority**

왼쪽 Label이 너무 길어져서 오른쪽 Label의 영역을 넘어 설 때,

둘 다 우선 순위가 같아서, 어떤 놈이 줄어들어야 할지 모르는 것이다.

두 오브젝트 중에 한 놈이 "작아져야" 하는 상황일 때

어떤 놈이 Intrinsic Size를 유지 못하고 줄어들래???

=> 우선순위(Content Compression Resistance Priority)높은 놈은 Intrinsic Size를 유지, 낮은 놈이 줄어듬!

우선순위가 높은 것이 intrinsic content width를 유지하고, 나머지 오브젝트는 Constraints에 따라 줄어들거나 커진다.

### Priority 예제

제목과 작성자를 설정하여 게시글을 표시할 때
![](https://images.velog.io/images/enchantee/post/510fa0c6-6510-41fc-afc6-5406ed7d1655/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-21_%EC%98%A4%ED%9B%84_9.13.17.png)


![](https://images.velog.io/images/enchantee/post/dc7057d7-f7b0-474a-a8e6-60d7c8f9c1c1/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-21_%EC%98%A4%ED%9B%84_9.13.33.png)

작성자 label 보다 글 제목 Label의 Width가 더 길어져야 하므로 **작성자의 hugging prority가 더 높아야 한다!**
![](https://images.velog.io/images/enchantee/post/5f07d039-7162-4038-bcb4-42671ce3aaaf/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-21_%EC%98%A4%ED%9B%84_9.15.32.png)

![](https://images.velog.io/images/enchantee/post/aa8477b6-5381-400a-bccc-fce9bef5c691/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-21_%EC%98%A4%ED%9B%84_9.16.02.png)


제목이 긴 경우, 제목이 아무리 길어도 작성자가 압축돼서 안보이면 안되기 때문에 **작성자의 compression priority가 더 높아야 한다!**
<br>

## Stack View

오브젝트의 제약 조건이 일정할 때 사용한다

스택을 만들어준 후, 오브젝트를 넣으면 알아서 일렬로 붙는다(수직 & 수평 둘다)

스택뷰의 너비와 높이는 안에 있는 오브젝트에 따라 달라지므로 오토 레이아웃으로 위치만 잡아주면 된다.

### Spacing

- 스택뷰 안의 뷰 간 간격 설정

### Alignment

- 서로 다른 크기를 가진 뷰들을 스택뷰로 이용해 정렬할 때, 좀 더 세부적인 설정 가능
![](https://images.velog.io/images/enchantee/post/dd2377bf-d612-48fd-8adf-bd34a3651814/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202022-03-23%20%EC%98%A4%ED%9B%84%203.05.02.png)

### Distribution

스택뷰 안의 뷰들의 관계 나타낼 때 사용
<center>
  <img src="https://images.velog.io/images/enchantee/post/3c7137f0-4230-4073-b2eb-35476c18f4a8/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-22_%EC%98%A4%ED%9B%84_5.33.20.png" width=300>
</center>

**Fill**

내가 맞춘 크기에 맞게 뷰들을 채운다
다만, 우선순위는 알아서 설정해줘야 함

스택뷰의 너비가 정해진 경우, 어떤 라벨이 intrinsic content size를 지킬지 정해줘야 한다

**Fill Equally**

모든 뷰들의 크기를 같게 맞춰준다

개인적인 경험으로는 가장 많이 쓰였다,, 스택뷰를 이용하는 가장 큰 이유지 않나 싶다

이때 Spacing을 주면 같은 간격으로 벌어지게 된다

**Equal Spacing**

내부 뷰들의 크기는 본연 크기대로 잡히는데, 이 뷰들 간의 간격을 동일하게 한다

이때 spacing 값을 20으로 설정해도 이와 상관없이 동일하게 지정되는데, 이때 정한 spacing 값은 intrinsic content size가 너무 커졌을 때의 최소 spacing값이 된다

**Equal Centering**

컨텐츠들의 가운데를 기준으로 간격이 맞춰진다

**Fill Proportionally**

컨텐츠의 크기가 크면 여백이 커지고, 작아지면 여백 또한 작아진다
<br>
## 코드로 Auto Layout 설정하기

```swift
//
//  secondViewController.swift
//  autoLayoutPractice
//
//  Created by 정지윤 on 2022/03/22.
//

import Foundation
import UIKit

class secondViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mussButton : UIButton = .init(frame: .init())
        mussButton.backgroundColor = .red
        mussButton.setTitle("나는야 머스", for: .normal)
        
        let umcButton : UIButton = .init(frame: .init())
        umcButton.backgroundColor = .black
        umcButton.setTitle("나는야 UMC", for: .normal)
        
        //addSubView는 필수로 해줘야 한다
        self.view.addSubview(mussButton)
        self.view.addSubview(umcButton)

        //translatesAutoresizingMaskIntoConstraints = false -> auto layout 사용
        //translatesAutoresizingMaskIntoConstraints = true -> frame-based layout 사용
        mussButton.translatesAutoresizingMaskIntoConstraints = false
        umcButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        mussButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        mussButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        // 코드로 설정할 때, trailingAnchor/bottomAnchor에 한해서 스토리보드와 달리 마이너스를 붙여줘야 한다!
        mussButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true
        
        //self.view에 붙일 때 -> safeArea에 붙이기 위해서 safeAreaLayoutGuide를 사용한다!
        umcButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        umcButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    }
}
```

<center>
  <img src="https://images.velog.io/images/enchantee/post/2c210652-c060-4927-bc1e-cae93a0222b6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-22_%EC%98%A4%ED%9B%84_7.34.33.png" width=300>
</center>

