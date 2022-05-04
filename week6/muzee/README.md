# Alamofire

- iOS, macOS를 위한 스위프트 기반 HTTP 네트워킹 라이브러리
- HTTP네트워킹을 하는데 자주 사용하게 되는 코드나 함수를 더 쉽게 사용할 수 있도록 모아놓은 것 

## 주요함수
- AF.upload : 멀티파트, 스트림, 파일 메소드를 통해 파일을 업로드 한다
- AF.download : 파일을 다운로드 하거나, 이미 진행중인 다운로드를 재개한다
- AF.request : 파일과 관련없는 기타 HTTP 요청

```Swift
AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
            method: .get,
            parameters: nil)
    .validate()
    .responseDecodable(of: UserFeedModel.self) { response in
    switch response.result {
    case .success(let result):
        viewController.successFeedAPI(result)
    case .failure(let error):
        print("error: ")
        print(error.localizedDescription)
    }
```

## Request
- 요청을 보내기 위해 사용하는 함수이다.
- HTTPMethod라는 열거형이 저장됨, method의 인자로 사용.
![](https://velog.velcdn.com/images%2Fdlwns33%2Fpost%2F4ed05b9b-31e8-490f-8852-fa9bb6828f84%2Fimage.png)

## Response
- request 뒤에 response를 붙임
```Swift
AF.request(URL).response()
```

### Response Handler
1. `Response`
- `URLSessionDelegate`에서 직접 모든 정보를 전달하고 응답 데이터를 평가하지 않는다 -> 2가지 방식으로 사용된다

2. `responseData`
- `DataResponseSerializer`를 사용해 서버에서 반환된 데이터를 추출하고 유효성 검사를 진행한다.

3. `responseString`
- `StringResponseSerializer`를 사용해 서버에서 반환된 데이터를 지정된 인코딩을 사용하는 문자열로 변환한다.

4. `responseJSON`
- `JSONResponseSerializer`를 사용해 서버에서 반환된 데이터를 지정된 `JSONSerialization.ReadingOptions`를 사용하는 Any타입으로 변환한다.
5. `responseDecodable`
- `DecodableResponseSerializer`를 사용해 서버에서 반환된 데이터를 지정된 `DataDecoder`을 사용하는 `Decodable`타입으로 변환한다.

### Validation
- 요청에 대한 유혀성 검사 실시
- 유효하지 않을 경우 response가 넘어올 수 없다.
```Swift
// 일반적 사용법
AF.request(url).validate().response { response in
    print(response)
}

// 조건 걸어주기
AF.request(url, method: .get, parameters: nil)
            .validate(statusCode: 200..<500)
            //200~500사이 상태만 허용
            .validate(contentType: ["application/json"])
            //JSON 포맷만 허용
            .response { response in
                print(response)
            }
```

## Codable
- JSON 데이터를 간편하고 쉽게 Encoding/Decoding 할 수 있는 프로토콜
- Codable = Decodable + Encodable
- Struct, Class, Enum 모두 Codable을 채택할 수 있음

### Encoding
- struct, class, enum 등등의 인스턴스를 JSON 형태의 Data로 만들어주는 것
```Swift
struct Human: Codable {
    var name: String
    var age: Int
}

let someone: Human = .init(name: "someone", age: 24)

let data = try? JSONEncoder().encode(someone)
```
- 결과 : data = {"name":"someone", "age":24}