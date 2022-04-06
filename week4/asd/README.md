# SwiftUI Public Tutorial
## Building Lists and Navigation
> https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation

이전 첫번째 튜토리얼에 이어서 하드코딩 했던 프로젝트를 `.json` 파일의 정보로 동적 리스트뷰, 네비게이션 및 여러 디바이스 환경에서의 호환 실습 진행

## Create a Landmark Model
* `.json` 파일에 저장된 포맷으로 데이터를 불러와 보여줌
* 다음과 같이 12개의 랜드마크 정보들이 저장된 `json` 파일을 프로젝트에 저장
```Json
{
    "name": "Turtle Rock",
    "category": "Rivers",
    "city": "Twentynine Palms",
    "state": "California",
    "id": 1001,
    "isFeatured": true,
    "isFavorite": true,
    "park": "Joshua Tree National Park",
    "coordinates": {
        "longitude": -116.166868,
        "latitude": 34.011286
    },
    "description": "Suscipit...",
    "imageName": "turtlerock"
},
  ...
```
* Swift File을 생성하여 `Landmark` 구조체 선언
* `Hashable protocol` : 각 데이터가 고유한 값이여야 한다면 `Hash`를 통해 `key`로 구분해줄 수 있음
* `Codable protocol` : `Encodable`과 `Decodable`이 합쳐진 프로토콜로 파일 입출력시 사용
* `CoreLocation` : 위치 정보를 유용하게 사용할 수 있는 `MapKit` 프레임워크

```Swift
import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
```

* 다음 미리 만들어진 `json` 로드 코드를 이용하여 `landmarks` 변수에 배열형태로 
```Swift
import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
```
- - -

## Create the Row View

<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/161944349-78300102-d9b7-43c1-b8f9-0f0b35f8d4a2.png" width="200px"></img>
</p>

* 전역 변수인 landmarks의 인자를 넘겨 해당 인스턴스가 가지고 있는 property를 자유롭게 사용가능

```Swift
import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
```

- - -

## Customize the Row Preview

<p align="center">
<img src="https://docs-assets.developer.apple.com/published/28a9f6b20390d8d2a8961493e3cbebb4/15600/020303~dark.png" width="200px"></img>
</p>

* `View`를 여러개 띄워서 동시에 볼 수 있음
* `.previewLayout`을 이용하면 휴대폰 크기 말고 사용자가 원하는 크기의 `layout`으로 `Preview` 가능

```Swift
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
```

- - -

## Create the List of Landmarks

<p align="center">
<img src="https://docs-assets.developer.apple.com/published/0cc77240f3adf5b0523a45d950726bbe/15600/020502.png" width="200px"></img>
</p>

* `List`: 리스트 형태로 보여줌
* 고유값을 가지기 위해 `id`가 필요함 `id: \.id`
* 하지만 객체에 `Identifiable` 프로토콜을 추가하면 자동으로 프로토콜에 있는 `id`

```Swift
import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
```

- - -

## Set Up Navigation Between List and Detail

<p align="center">
<img src="https://docs-assets.developer.apple.com/published/cc978bce0c75251bc18227324178f9da/15600/020606.png" width="200px"></img>
</p>

* `NavigationView`와 `NavigationLink`를 이용하면 페이가 이동되는 기능 구현 가능
* `NavigationLink`에 해당 `View`가 선택 되면 이동할 페이지 입력
* `label`은 NavigationView`에서 표시될 `View` 입력


```Swift
import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
```

- - -
## Pass Data into Child Views

<p align="center">
<img src="https://docs-assets.developer.apple.com/published/18ffd5d571a7b1f06d322326dc65db2b/15600/020709.png" width="200px"></img>
</p>

* 앞서 하드코딩 되었던 `Detail` 페이지도 인자를 통해 데이터 전달
* `ScrollView`로 화면 밖의 영역까지 확장 가능
* `.navigationTitle`: `NavigationView` 상단에 표시될 문구 추가

```Swift
struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}
```

- - -
## Generate Previews Dynamically

<p align="center">
<img src="https://docs-assets.developer.apple.com/published/a91d1844fd93ae1340445e741cb38f59/15600/020803~dark.png" width="200px"></img>
</p>

* 기존 `preview` 화면은 iPhone SE 디바이스 하나로 고정되어 있음
* `.previewDevice()` 함수를 통해 디바이스 지정 가능
* `.previewDisplayName()`은 `preview`에서 보이는 기기의 타이틀 지정
* `ScrollView`로 화면 밖의 영역까지 확장 가능

```Swift
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
```

* 아이패드도 가능
* 아이패드의 `Navigation View`는 자동으로 좌측 `Drawer`형태로 지정됨

<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/161948483-7837108d-3360-41ee-a6ff-55ddf52bbc44.png" width="439px"></img>
</p>
