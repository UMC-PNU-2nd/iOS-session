# SwiftUI의 데이터 흐름

## SwiftUI 라이프사이클
- SwiftUI에는 View의 상태를 나타내는 함수가 아래와 같이 단 두가지 밖에 없다.
- 대신 상태를 나타내는 다양한 Property Wrapper가 존재해 Data flow에 대한 여러 상태에 대응할 수 있다.
```Swift
.onAppear {
    print("View appeared")
}

.onDisappear {
    print("View disappeared")
}
```

---

### @State
- 일반적으로 struct는 값 타입이여서 struct내의 값을 변경할 수 없다.
- SwiftUI는 @State를 제공해 struct내의 값을 변경할 수 있게 해준다.
- SwiftUI의 view는 struct이고, 이는 언제든 소멸되거나 재생성된다.
- 그렇기 때문에 @State를 사용해 지속적으로 변형 가능한 변수를 만드는 것이다.
- 단, @State는 String, Int, Bool과 같은 간단한 타입에만 사용되는 것이 좋다.
- 일반적으로 @State 변수는 private으로 선언되고, 다른 view와 공유되지 않는다.
- 다른 view와 값을 공유하고 싶다면, @ObservedObject나 @EnvironmentObject를 사용하면 된다.

```Swift
struct ContentView: View {
    @State private var number = 0
}
```

### @Binding
- @Binding은 부모 view의 @State와 같은 값을 양방향으로 연결되도록 해준다.
- 아래 코드에서 isPresented는 showAddView를 바인딩 시켜줘서 값을 변경해준다.

```Swift
struct ContentView: View {
    @State private var showAddView = false

    var body: some View {
        VStack {
            Text("Hello World.")
        }
    }
    .sheet(isPresented: $showAddView) {
        AddView(isPresented: self.$showAddView)
    }
}

struct AddView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button("Dismiss") {
            self.isPresented = false
        }
    }
}
```

### @StateObject
- SwiftUI가 View를 다시 랜더링 할 때, 실수록 취소되는 것을 방지해준다.
- WWDC 2020에서 애플은 @StateObject를 추가로 공개했다.
- @ObservedObject와 거의 같은 방식으로 작동함.

```Swift
struct ContentView: View {
    @StateObject var user = User()
}
```

### ObservableObject
- ObservableObject는 Protocol으로 Combine 프레임워크의 일부다.
- 이것을 사용하기 위해서는, Protocol을 준수하고 @Published를 사용하면 된다.
- @Published를 사용하면 변수의 값이 추가되거나 삭제 되었다는 것을 View가 알 수 있게 해준다.
- ObservableObject는 MVVM 아키텍쳐의 ViewModel에 적용하기 좋은 프로토콜이다.

```Swift
class MyViewModel: ObservableObject {
    @Published var dataSource: MyModel
    
    init(dataSource: MyModel) {
        self.dataSource = dataSource
    }
}
```

### @ObservedObject
- SwiftUI는 @ObservedObject를 통해 view가 외부 객체를 감지하게 해준다.
- 아래 코드에서 User class는 ObservableObject를 준수하고 @Published 변수를 갖고 있다.
- @ObservedObject user 변수는 이러한 User class 객체를 담고 있다.
- SwiftUI는 이러한 user 객체의 @Published 변수 값이 변경될 때 view를 refresh 한다.
```Swift
class User: ObservableObject {
    @Published var name = "Hohyeon Moon"
}

struct ContentView: View {
    @ObservedObject var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.name).")
        }
    }
}
```
### @EnvironmentObject
- @EnvironmentObject는 보통 앱 전반에 걸쳐 공유되는 데이터에 사용된다.
- @EnvironmentObject는 .environmentObject()를 통해 값을 전달할 수 있다.
- 전달하는 object는 ObservableObject 프로토콜을 준수해야 한다.
- 아래 코드와 같이 root view를 제공하면, 어떠한 view에서도 사용이 가능하다.

```Swift
// MySettings.swift
class Settings: ObservableObject {
    @Published var version = 0
}

// SceneDelegate.swift
var settings = UserSettings() 
window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(settings))

// MyViews.swift
struct ContentView: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.settings.version += 1
                }) {
                    Text("Increase version")
                }

                NavigationLink(destination: DetailView()) {
                    Text("Show Detail View")
                }
            }
        }
    }
}

struct DetailView: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        Text("Version: \(settings.version)")
    }
}
```

## 최종 분류
<p align="center">
<img src="https://d33wubrfki0l68.cloudfront.net/2d7c3c8c00eb2d3c3ac126c0fe78eb958d998c89/817d0/images/swiftui-data-flow-1.png"></img>
</p>