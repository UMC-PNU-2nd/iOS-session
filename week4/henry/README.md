# 프로토콜 지향 언어
<p>
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb00LNH%2Fbtq0EDcpENr%2Fu72LKY6EMzmknlZFlkubg0%2Fimg.png">
</p>
- 위예제처럼 프로토콜과 익스텐션을 결합하면 코드의 재사용성이 훨씬 증가하게 됩니다.

- 이렇게 프로토콜의 요구사항을 익스텐션을 통해 구현하는 것을 프로토콜의 초기 구현이라고 합니다.

- 만약에 프로토콜의 익스텐션에서 구현한 기능을 사용하지 않고 타입의 특성에 따라 조금 변경해서 구현하고 싶으면 프로토콜을 상속한 class { } 안에 재정의를 해주면 됩니다.
<p>
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbDuuRY%2Fbtq0AHz4Fk2%2F1Knno8IiSQGQFOkbmc7EJ1%2Fimg.png">
</p>
- 2번째 functionTest(_: String) -> String 메소드는 이미 프로토콜을 준수하는 타입의 메소드를 호출했으므로 특정 프로토콜 준수하는 타입에 프로토콜의 요구사항을 찾아보고 이미 구현되어 있다면 그 기능을 호출하고, 그렇지 않으면 초기 구현의 기능을 호출합니다.

- 스위프트의 클래스는 다중 상속을 지원하지 않으므로 부모클래스의 기능으로 부족하다면 자식 클래스에서 다시 구현해야 하지만, 프로토콜 초기 구현을 한 프로토콜을 채택했다면 상속도 추가 구현도 필요가 없습니다. 

- 구조체, 열거형은 상속을 지원하지 않지만 초기구현한 프로토콜만 채택한다면 기능을 얼마든지 추가할 수 있습니다.

# ArrayList
추가 삭제 수정이 용이하다.
# DataSource
ViewController에게 데이터를 전달해주는 객체
# Delegate

생각해볼것 

 <img src ="https://developers.kakao.com/docs/latest/ko/assets/style/images/message/message_common_friend.png">
카카오톡 친구 뷰는
아래와 같은 구조로 구성되어 있다.

                            테이블뷰
                        /
                    스크롤뷰
                /
            탭바


# NotificationCenter

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbha9T2%2FbtqI082BBfE%2Fs3vLeZzvH3XhK4Vk6saXk1%2Fimg.png">

Notification 구조체

'''
var name: Notification.Name // 알림을 식별하는 태그
var object: Any? // 발송자가 옵저버에게 보내려고 하는 객체. 주로 발송자 객체를 전달하는 데 쓰임
var userInfo: [AnyHashable : Any]? // Notification과 관련된 값 또는 객체의 저장소
'''


'''
// 노티피케이션 발송
NotificationCenter.default.post(name: NSNotification.Name("TestNotification"), object: nil, userInfo: nil)​
'''
.post 가 핵심이다.

'''
 // 옵저버 등록
 NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name("TestNotification"), object: nil)

 @objc func didRecieveTestNotification(_ notification: Notification) {
         print("Test Notification")
 }
 '''

addObserver : 관찰자를 대기시킵니다.
selector : 관찰자가 수행해야 할 업무를 의미합니다.

<a href="https://silver-g-0114.tistory.com/106">자세한 내용<a>
