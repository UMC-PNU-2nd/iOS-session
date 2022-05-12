
메일로 이미지 파일을 전송한다고 가정하자, 그때 png나 jpg파일 자체가 전송되는 것이 아니라 이미지 파일을 스펙에 맞게 문자로 생성하여 서버로 전송한다.
<br>

# Multipart

: Alamofire에서 제공해주는 기능으로 이미지를 data로 전환해서 전송하는 방식

HTTP는 아래의 4개로 나뉘는데

1. Request Line
2. HTTP Header
3. Empty Line
4. Message Body

message body에 들어가는 데이터 타입을 HTTP Header에 명시해줄 수 있다.

명시해주는 필드가 바로 Content-Type이다.

```json
{
    "Content-Type" : "multipart/form-data"
}
```

Content-Type 필드에 밈타입(multipurpose internet mail extensions)을 적어줄 수 있는데, 그 여러 타입들 중 하나가 multipart이다.

## MIME

: 멀티미디어 파일의 데이터를 ASCII 데이터로 변환 후 전송

![](https://velog.velcdn.com/images/enchantee/post/8796e17f-b6ef-4790-b70f-7bec8b25dc19/image.png)

여기까지가 mulripart 이론 부분이었고, 이를 실제로 적용해보고자 했다.
<br>
<br>
## 사진 올리기

```swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                    
                    let imageString = "https://firebasestorage.googleapis.com/v0/b/catstargram-d7fbf.appspot.com/o/Cat1?alt=media&token=e92d1af6-ceb3-4a0c-9ba9-acd5cf534a42"
                    //let data = image.jpegData(compressionQuality: 1)    
                    let input = FeedUploadInput(content: "지노 상이입니다, 귀엽지 않나요?", postImgsUrl: [imageString])
                    FeedUploadDataManager().posts(self, input)
                }
```

**이미지 업로드 방법**

1. url을 이용해서 전송
→ 이미지를 aws나 firebase와 같은 데이터베이스에 올렸을 때 생성되는 url을 통해 서버에 이미지를 전송한다.
2. multipart 통신을 이용해 이미지를 data로 전환해서 전송한다.

UIImagePicker를 이용해서 시뮬레이터에 내장되어 있는 사진을 전송하려고 한다.

내가 짠 코드는 이미지 업로드 하는 첫 번째 방법인 미리 생성된 url로 이미지를 전송하는 방식이다. 
물론 이 방법도 이미지마다 url을 생성해줘서 array에 담아준 후 보내줘도 되지만 url의 길이가 너무 길고 전부 저장하기엔 공간 차지가 크다.

→ multipart 사용(주석 부분 사용)
<br>

### Alamofire - upload

```swift
func posts(_ viewController : HomeViewController, _ parameter: FeedUploadInput, _ imgData: UIImage?) {
        let url: String = "https://edu-api-ios-test.softsquared.com/posts"
        
        let header: HTTPHeaders = [
            "Content-Type" : "multipart/form-data"
        ]

                //parameter
                let parameters: [String : Any] = [
            "content": parameter.content,
            "postImgsUrl": parameter.postImgsUrl,
        ]

        AF.upload(multipartFormData: { MultipartFormData in
            //body 추가
                        for (key, value) in parameters {
                MultipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                        }
            //img 추가
                        if let image = imageData?.pngData() {
                MultipartFormData.append(imgData, withName: "img", fileName: "\(userName).jpg", mimeType: "image/jpg")
                        }
        }, to: url, method: .post, headers: header)
        .validate()
        .responseDecodable(of: FeedUploadModel.self) { response in
            
            switch response.result {
            case .success(let result):
                if result.isSuccess{
                    print("업로드 성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
```

**주의해야 할 점**

1. Content-Type이 multipart/form-data라는 점
2. Body부분에 이미지를 제외하고도 업로드 해줄 데이터가 있는 경우 multipart를 통해 분리해서 업로드 해줘야 함

만약 API 명세서의 Request Body에 이미지가 아닌 다른 데이터가 존재한다면, key - value 를 배열 형식으로 작성 해준다.

→ 여기서 이미지 파일은 Multipart를 통해 따로 data로 변환시켜 전송해줄 것이기 때문에 따로 parameters 배열에 넣어주지 않아도 된다.

이후 Alamofire에서 제공하는 upload를 통해서 데이터를 전송해준다.

```swift
//body 추가
for (key, value) in parameters {
  MultipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
}
//img 추가
if let image = imageData?.pngData() {
  MultipartFormData.append(imgData, withName: "img", fileName: "\(image).jpg", mimeType: "image/jpg")
}
```

- withName: key 값
- fileName: 서버에 업로드할 파일 이름
- mimeType: 파일 형식

생각보다 간단하다

문제는! 서버에서 전달받은 API 명세서엔 multipart가 아닌 url로 이미지를 업로드 하게 되어 있어서 아직 실습을 해보지는 못 했다,,
다음 프로젝트엔 꼭 multipart 통신 해봐야겠다

참고 블로그: 

[[iOS] Alamofire Multipart/formdata를 통한 이미지 서버 통신](https://roniruny.tistory.com/148)

