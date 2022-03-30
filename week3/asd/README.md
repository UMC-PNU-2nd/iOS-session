# SwiftUI Public Tutorial
## Creating and Combining Views
> https://developer.apple.com/tutorials/swiftui/creating-and-combining-views

<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/160750833-c7c6abf1-c3a2-45bb-997a-ceb4bb0244b2.png" width="600px"></img>
</p>

* ContentView.swift 파일에서 Simulator를 따로 실행하지 않아도 변경시 자동으로 반영되는 기능이 존재

- - -

## Customize the Text View
* 특정 property에 대한 속성을 변경하고 싶다면 `.property` 형태를 사용해서 연속으로 적으면 됨
* Flutter에서는 `..` operator로 `Cascade`, Swift에서는 `modifiers`라고 명명함
```Swift
var body: some View {
    Text("Turtle Rock")
        .font(.title)
        .foregroundColor(.green)
}
```
* Preview에서도 `Command`를 누르면서 해당 object를 클릭 후 **Show SwiftUI Inspector**를 클릭하면 GUI 방식으로도 수정할 수 있음
* Inspector에서 수정된 내용은 바로 Code에 적용됨
* `Command`를 누른상태에서 Code를 클릭해도 동일하게 GUI로 수정할 수 있음
<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/160752482-9a06b647-5552-4e47-b05d-b9d76c04f678.png" width="300px"></img>
<img src="https://user-images.githubusercontent.com/55697983/160753010-e396c201-09a4-4d47-93d0-691b2454a853.png" width="300px"></img>
</p>

- - -
## Combine Views Using Stacks
<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/160755916-68e29fc4-2e7d-4ab7-bd2a-e8c87bf7b590.png" width="200px"></img>
</p>

* body는 single view만 반환하기 때문에 content를 여러개 늘리기 위해서는 HStack, VStack을 이용하여 group화 해주어야 함
* `VStack` : Vertically하게 layout을 그룹화 할 수 있음
* `HStack` : Horizontally하게 layout을 그룹화 할 수 있음
* `Spacer` : Content 사이의 영역의 공백을 추가함, 공백은 parent view 공간을 모두 사용하는 크기로 지정

```Swift
var body: some View {
    VStack {
        Text("Turtle Rock")
            .font(.title)
        HStack {
            Text("Joshua Tree National Park")
                .font(.subheadline)
            Spacer()
            Text("California")
                .font(.subheadline)
        }
    }
    .padding()
}
```

- - -
## Create a Custom Image View
<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/160755885-66f3e1ab-453b-4ef2-8bb7-ddf212832452.png" width="200px"></img>
</p>
* Image를 사용하기 위해 `Asset.xcassets`에 이미지를 추가
* `File` > `New` > `File` > User Interface의 `SwiftUi View` 선택하여 생성
* `Image()` : 해당 이름의 이미지 파일을 불러옴
* `.clipShape()` : 원하는 형태의 Shape로 이미지를 자름
* `.overlay()` : 해당 이미지 영역 위에 overlay함
* `.stroke()` : 해당 도형의 외곽선만 추출
* `.shadow()` : 그림자 추가

```Swift
var body: some View {
    Image("turtlerock")
        .clipShape(Circle())
        .overlay(
            Circle().stroke(.white, lineWidth: 4)
        )
        .shadow(radius: 7)
}
```

- - -

## Use SwiftUI Views From Other Frameworks
<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/160757603-767da3e6-4821-4632-9eaa-cb031706ef7a.png" width="200px"></img>
</p>

* `@State` : 변수의 값이 변할 때 View를 다시 계산해서 렌더링
  * View의 body 부분에서만 `@State`변수에 접근 가능
  * `private`로 선언하는 것을 권장
  * 경고문, 텍스트필드, 편집모드 같이 **현재 화면의 상태를 잠깐 나타내거나 간단한 View의 상태**를 나타내는 변수에 적합
* `@Binding` : `@State` 변수에 `$`를 붙여서 사용
  * `$`를 붙이면 해당 변수를 하위 다른 값과 연결할 수 있음
  * C언어의 주소값을 전달하는 방식과 비슷한것 같음
* region 변수의 값을 초기에 설정해두고 Map 함수의 coordinateRegion에 $region으로 binding 해주면 사용자가 지도를 이동할 때마다 해당 위치의 위도와 경도 값이 수정 되면서 View에서 update된 값으로 렌더링 해줌
```Swift
import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.011_286, longitude: 127.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        Map(coordinateRegion: $region)
    }
}
```

- - -
## Compose the Detail View

<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/160760637-cd7a0579-d804-4b26-8692-e1b15a1883a0.png" width="200px"></img>
</p>

* 앞선 만든 View component를 추가작업 없이 바로 통합 할 수 있음
* `.offset` : 기존 위치를 재조정하여 View간에 Overlay 할 수 있음
  * 먼저 선언된 View가 나중에 선언된 View 보다 아랫쪽에 위치
* `Spacer()`를 아래에 위치하여 모든 Content를 Top 기준에 맞춤
* `.ignoresSafeArea(edges: .top)`: `safeArea` 영역까지 MapView가 들어갈 수 있도록 설정

```Swift
var body: some View {
    VStack {
        MapView()
            .ignoresSafeArea(edges: .top)
            .frame(height: 300)

        CircleImage()
            .offset(y: -130)
            .padding(.bottom, -130)

        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
            HStack {
                Text("Joshua Tree National Park")
                Spacer()
                Text("California")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)

            Divider()
            Text("About Turtle Rock")
                .font(.title2)
            Text("Descriptive text goes here.")
        }
        .padding()

        Spacer()
    }
}
```

- - -
## Login 화면 구현

<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/160779030-f4152247-a73a-414a-91d6-165d103c9358.png" width="200px"></img>
</p>

* `Extract Subview` 기능을 통해서 해당 하위 코드를 바로 `struct` 형태로 변경할 수 있음
* `@State`의 값의 변경을 감지하여 View를 새로 렌더링 하니 특별한 과정 없이도 로그인 성공/실패 창을 
```Swift
import SwiftUI
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let storedUsername = "Wonjune"
let storedPassword = "0000"
struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                WelcomeText()
                UserImage()
                UsernameTextField(username: $username)
                PasswordSecureField(password: $password)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: {
                    if self.username == storedUsername && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    }
                    else {
                        self.authenticationDidFail = true
                    }
                }) {
                   LoginButtonContent()
                }
            }
            .padding()
            if authenticationDidSucceed {
                Text("Login succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        return TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(.green)
            .cornerRadius(15.0)
    }
}
```
