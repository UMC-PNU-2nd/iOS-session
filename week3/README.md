### IBAction, IBOutlet
storyBoard의 연결고기를 담당한다. 변수나 함수를 정의할 떄 앞에 해당 키워드를 눞이면 버튼또는 레이블같은 컴포넌트와 연결이 가능하다.
![image](https://user-images.githubusercontent.com/75213755/160763926-c1222c84-b75b-4555-8ad7-2e0f73d9b815.png)

* IB란? Interface Builder 의 약자.
## IBAction
Event가 발생할때 호출되는 Action

## IBOutlet
값에 접근하기 위한 변수라고 보면 편하다.

## @ 기호
컴파일러에게 어떠한 속성을 가지고 있다고 전하는 예약어

## UI~~ 의 의미
'UI중에서 어떤 항목을 가리키도록 설정할 것 인가' 를 의미한다.

## Cocoa Touch FrameWork
<img width="743" alt="스크린샷 2022-03-30 오후 4 04 56" src="https://user-images.githubusercontent.com/75213755/160772611-7292b3be-fbac-4618-bae5-508f1697a2ac.png">

UIKit / Foundation / CoreData / MapKit / CoreAnimation 등등을 
포함하고 있는 Framework
<img width="671" alt="스크린샷 2022-03-30 오후 4 08 38" src="https://user-images.githubusercontent.com/75213755/160772680-88561c07-7248-4ced-a321-53557cefd62c.png">

## Cocoa Framework

MacOS에서 구동되는 application을 개발하기 위해 사용하는 통합 프레임워크

## NS접두어의 의미 (Next Step)
코코아의 모든 함수 상수 타입에 NS가 붙음.
ex) NSLog(print+ 시간+날짜) 와 print

## 정규식
NSPredicate - 메모리 내 필터링 이나 검색을 통한 패치 -> Collection안의 내용을 검색 혹은 필터하는 용도

NSRegularExpression - 유니코드 문자열에 적용되는 정규식의 표현 -> 정규식!

let pattern = "^[A-Za-z0-9]{0,}$" 

// A-Za-z0-9에 속하는 문자열인지 검사

^: 시작을 나타냄
$: 종료를 나타냄
{0, }: 0개 이상
[]: 괄호안에 있는 문자중 임의의 한 문자

출처: https://nsios.tistory.com/139 [NamS의 iOS일기]
