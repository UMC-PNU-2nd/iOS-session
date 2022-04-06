# 프로토콜 지향 언어

# ArrayList

# DataSource

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