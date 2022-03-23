이번 주차에 정리한 AutoLayout을 가지고 직접 화면을 구성해보았다!
구성할 화면은 Netflix 홈 화면의 일부

## iPhone 13 Pro Max 화면
<table>
  <tr>
    <td><img src="https://images.velog.io/images/enchantee/post/0de39a83-da07-4eef-a868-3d41eac54888/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-23_%EC%98%A4%ED%9B%84_3.52.12.png" width=300></td><td><img src="https://images.velog.io/images/enchantee/post/8606ca90-aaf1-4512-9e85-612528af459e/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-23_%EC%98%A4%ED%9B%84_3.52.22.png" width=300></td>
  </tr>
</table>



<table>
  <tr>
    <td><img src="https://images.velog.io/images/enchantee/post/608fe772-0ff7-4c26-a30f-77134f630bc5/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-23_%EC%98%A4%ED%9B%84_3.52.29.png" width=300></td><td><img src="https://images.velog.io/images/enchantee/post/a1eb3c27-7277-4501-8386-48cc619cfa8f/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-23_%EC%98%A4%ED%9B%84_3.52.35.png" width=300></td>
  </tr>
</table>

<br>

## iPhone 8 화면
<table>
  <tr>
    <td><img src ="https://images.velog.io/images/enchantee/post/86f908f7-a4ea-44bd-97bb-b02051218a3f/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-23_%EC%98%A4%ED%9B%84_3.53.06.png" width=300></td><td><img src ="https://images.velog.io/images/enchantee/post/b14ff8db-8508-41da-8031-4ddbc8afe0f5/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-03-23_%EC%98%A4%ED%9B%84_3.53.16.png" width=300></td>
  </tr>
</table>


---

## Tab Bar ViewController

먼저 탭바 컨트롤러를 생성하면 두 개의 뷰 컨트롤러가 따라 나온다. 나는 네 개의 뷰가 필요해서 뷰 두 개를 더 생성했다. 

이후 탭바 컨트롤러와 뷰컨들을 `Relationship Segue`를 이용해서 연결시켜주면 우리가 원하는 탭바가 구현된다.
<br>
## ScrollView(Horizontal / Vertical)

가장 핵심이 되는 부분이라고 생각했던 스크롤 뷰이다.

기본적인 **세로 스크롤 뷰 구현**과 조건에 맞는 콘텐츠들 추천 목록이 담긴 **가로 스크롤 뷰**를 구현할 수 있었다.

*스크롤 뷰 개념부터 구현까지*

[https://kyungmosung.github.io/2019/11/06/xcode-scrollview/](https://kyungmosung.github.io/2019/11/06/xcode-scrollview/)

스크롤 뷰를 뷰컨트롤러에 올려놓으면 스크롤 뷰 뿐만 아니라 Content Layout Guide 와 Frame Layout Guide 모두 추가된다.

이 상태에서 View 를 스크롤 뷰 안에 추가해주면 Content & Frame Layout Guide를 정하지 않았다고 오류가 뜬다.

### Content Layout Guide 설정

`ScrollView`안에 컨텐츠를 넣기 위한 상위 `View` 하나를 추가해준다. 이때 `View`의 제약조건을 `ScrollView`에 걸지 않고 `Content Layout Guide`에 걸어준다.

### Frame Layout Guide 설정

이제 `Frame Layout Guide` 에 `Equal Widths` 나 `Equal Heights` 제약을 추가해 고정시킬 방향을 설정한다.

- `Equal Widths`는 가로길이를 `Frame Layout Guide`에 고정시켜 **세로 스크롤**이 필요할때 사용한다.
- `Equal Heights`는 세로길이를 `Frame Layout Guide`에 고정시켜 **가로 스크롤**이 필요할때 사용한다.

세로 스크롤로 전체 화면을 구현했고, View의 높이는 넉넉잡아 1200으로 잡았다. 가로 스크롤로 추천 콘텐츠를 구현했고, View의 총 너비는 530으로 잡아 네 가지 콘텐츠를 담을 수 있게 했다.
<br>
## Horizontal StackView

네 가지 콘텐츠를 담았는데 Distribution 에서 같은 Width를 주었고(Equally fill) Alighment는 StackView의 높이와 동일하게(Fill), Spacing은 10으로 통일했다.

직접 써보니 스택 뷰를 사용해야 할 때는 보통 크기가 일정한 객체들을 한 곳에 모아두는 용도로 쓰임 → Alignment는 항상 Fill로 주는 경우가 많을 듯 + Distribution에서 배치 모양 결정
<br>
## UIButton

외부 이미지가 아닌 xcode 내장 이미지를 사용할 경우 아래와 같은 인스펙터 영역의 point size로 버튼 사이즈를 조절할 수 있다

외부 이미지 넣을 때 → 인스펙터 영역의 Foreground img가 아닌, **Background Configuration - Background img**로 넣으면 크기를 임의로 조절 가능하다
![](https://images.velog.io/images/enchantee/post/df7b587b-961e-47e7-854b-42816c7bccd7/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-11-30_%EC%98%A4%ED%9B%84_5.15.30.png)
<br>
## UIImageView

Main 화면의 콘텐츠 사진(지옥)과 가로 두 줄의 이미지들을 나타낼 때 활용

임의로 캡쳐한 화면을 사용하다 보니 해상도가 맞지 않는다 → Content Mode - Aspect Fill로 설정
<br>
## UILabel

버튼 형식이 아닌 글자를 나타낼 때 활용했다.

