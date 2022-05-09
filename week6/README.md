이번 주차는 네트워크에 대해서 강의를 듣고 스터디를 진행했다
강의 내용에 언급한 alamofire의 multipart통신을 하고 싶었지만 시간이 나지 않아서 못 했다,,,

multipart 통신은 다음 블로그로 올리도록 하고 
오늘은 통신, 특히 alamofire에 대해 공부해 보았다.
<br>

# HTTP 통신

: HTTP란 한 마디로 HTML(웹 문서를 만들기 위한 언어) 문서를 주고 받는데 쓰이는 통신 프로토콜(통신규약)이며, TCP/UDP(전송 계층에서 사용하는 프로토콜)를 사용하여 통신한다.

- TCP: 인터넷 상에서 데이터를 메세지의 형태로 보내기 위해 IP와 함께 사용하는 프로토콜
- UDP: 데이터를 데이터그램 단위로 처리하는 프로토콜

(더 자세한 내용은 따로 공부 해서 블로그를 작성하도록 하겠다)
<br>
<br>
# HTTP 통신과정(요청과 응답)

- 클라이언트가 서버에 HTTP Request(요청)을 한다
- 서버가 사용자의 요청을 받고 HTTP Response(응답)을 한다

## HTTP Method

보통 GET, POST, PATCH, DELETE 4개가 주로 사용된다.

- GET : 정보 검색 ex) 게시판 리스트 불러오기
- POST : 실행 / 저장 ex) 회원가입 / 로그인
- PUT : 전체 수정 ex) 회원정보 전체 수정
- DELETE : 삭제 ex) 회원정보 삭제
- PATCH : 일부 수정 ex) 회원정보 일부 수정 (Update에 가장 가깝게 쓰이고 있다)
- OPTIONS : 시스템에서 지원하는 메소드 확인
<br>
<br>
# Alamofire

: http 통신을 하기 위해 사용되는 라이브러리

iOS에서 네트워킹은 기본적으로 URLSession을 사용한다.
이때, 프로젝트의 복잡도가 높아지고 추상화 되면 URLSession 위에 구현된 Alamofire 방식을 활용하게 된다.

## API 명세서

통신을 하기 위해선 API 명세서가 필요하다

어떤 url로 통신하며 어떻게 가져오는지에 대한 정보가 나와 있다

![](https://velog.velcdn.com/images/enchantee/post/bbd483fa-b083-4297-8cac-aed8f4c320c0/image.png)
![](https://velog.velcdn.com/images/enchantee/post/da783b85-cc05-4966-bacb-b8985387f433/image.png)
각각의 기능의 통신 방법, url 양식 등을 볼 수 있다

## GET 방식으로 Request 하기

```swift
func getUserFeed(_ viewController: ProfileViewController,
                     _ userID: Int = 2) {
        
        //통신
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: UserFeedModel.self) { response in
            switch response.result{
            case .success(let result):
                print("조회 성공")
                viewController.successFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
```

Request: 주소 넣기

- method: 통신 방식 넣기(get, post, patch 등등)
- parameters: 통신을 할 때 넣어줘야 할 parameter
(Alamofire 공식 문서에 따르면 더 이상 지원하지 않을 것이라고 한다!)
- headers: API 문서에 헤더에 값을 넣어줘야 한다고 명시돼 있으면 알맞은 값을 넣어서 보낸다

Validate:  확인 코드

ResponseDecodable(of: ): 정보를 받는 부부이며, of: 부분에 decodable 한 struct 파일을 받는다

### Response Handler

이후 후행 클로저를 통해 reponse 핸들링을 해준다

→ success와 failure로 구분 후, result 값 활용

처음 함수를 만들 때, viewcontroller를 함수 인자로 받고 

통신에 성공했을 때 result를 해당 뷰컨의 successAPI()에 넘겨주어서 이벤트를 처리한다.

## Response 받기

request에 대한 response가 어떤 파일 형태로 전달 되는지 확인 후, 그에 맞게 swift struct를 짜준다.

하단의 struct는 json을 표현하기 위해 Decodable Type을 사용했다.

```swift
import Foundation

// MARK: - Welcome
struct UserFeedModel:Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: Result?
}

// MARK: - Result
struct Result: Decodable {
    let isMyFeed: Bool?
    let getUserInfo: GetUserInfo?
    let getUserPosts: [GetUserPost]?
}

// MARK: - GetUserInfo
struct GetUserInfo: Decodable {
    let userIdx: Int?
    let nickName, name: String?
    let profileImgURL: String?
    let website: String?
    let introduction: String?
    let followerCount, followingCount, postCount: Int?
}

// MARK: - GetUserPost
struct GetUserPost: Decodable{
    let postIdx: Int?
    let postImgUrl: String?
}
```

## 뷰컨에서 통신하기

```swift
private func setupData() {
        UserFeedDataManager().getUserFeed(self)
}
```

원하는 위치에서 데이터 매니저 내의 함수를 호출한다(통신 한다)

## 통신 성공 후, response 뷰컨에서 처리

```swift
//API 통신 메소드
extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel) {
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool) {
        guard isSuccess else {return}
        
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
```

받아 온 result를 활용해 미리 정의해 놓은 변수에 통신해서 받아온 정보를 저장하는 등의 로직을 수행한다.

## 주의사항

통신에 성고해서 받아 온 정보를 화면에 표시할 때는 꼭 reload 시켜줘야 한다.

```swift
var userPosts : [GetUserPost]? {
        didSet {
            self.profileCollectionView.reloadData()
        }
    }
```

didsSe을 활용해 값이 바뀔 때마다 자동으로 reload 하도록 설정.
<br>
<br>
# 정리

1. DataManager 객체를 생성해서 통신할 위치, 방법, response handling 등을 정의해주고 통신한다.
2. 통신한 결과값 result와 동일한 형태의 파일을 받아올 swift struct를 만들어 준다.
3. 통신할 뷰컨에서 함수를 호출하고, 성공한다면 받아온 정보를 상황에 맞게 활용한다.

