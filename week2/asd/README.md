# AutoLayout

> AutoLayout은 `제약조건(Constraints)`에 따라 뷰 계층 구조에 있는 모든 뷰의 크기와 위치를 동적으로 지정하는 것

<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/159658290-02cab33f-1507-4a15-ab40-658e535d6dc8.png" width="300px" height="300px"></img>
</p>

* View의 좌표를 직접 지정해주는 것이 아니라 ImageView의 위치나 크기를 다른 객체(Safe Area)를 이용해 **상대적**으로 제약
* 어떤 해상도일지라도 기준 객체(Safe Area)의 왼쪽으로 30, 오른쪽으로 30, 위로 50의 margin을 부여하고 height는 200으로 지정
* 단, 제약조건을 부여할때는 **나머지 값은 무조건 추론이 가능**해야함


<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/159659115-6ea7e61e-cd92-4660-aeef-ba78a5f57513.png" width="800px" height="300px"></img>
</p>

## Constraint 종류
* Leading, Top, Trailing, Bottom, Width, Height
  * 입력 필드에는 기본적으로 가장 인접한 뷰와 거리가 자동으로 입력 됨
  * 너비와 높이는 하나의 뷰에 고정된 Constant 값으로 추가하거나 다른 뷰와의 관계나 비율로 추가 가능
<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/159665263-538150a6-0f62-4931-a810-e54cb3b2517e.png" width="250px" height="400px"></img>
</p>

* CenterX, CenterY
  * 수평, 수직 방향으로 정렬 가능
  * 가운데 정렬하거나 두 개 이상의 뷰를 정렬 할 수 있음
<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/159666073-c59edb63-6bd6-4cd0-87dc-ddc3527368a1.png" width="400px" height="400px"></img>
</p>

* Multiplier
  * 제약을 추가할 때 비율을 지정하는 기능
  * 기본값은 1이며, 값을 변경하여 1/4 지점 3/4 지점 및 2배 등과 같이 지정할 수 있음

<p align="center">
<img src="https://user-images.githubusercontent.com/55697983/159667036-7475de4f-10e8-459d-88c5-98f4c6b6a0cd.png" width="600px" height="300px"></img>
</p>

* Etc.
  * AspectRatio
  * Baseline
  * Relation
  * Constant
  * Priority
  * Interinsic Content Size
  * Content Hugging (CH) & Compression Resistance (CR)


- - -
# UIView

> UIView는 화면의 직사각형 모양을 관리하는 객체

* Draw, Animation
  * 뷰는 UIKit Core Graphics를 사용하여 직사각형 영역에 콘텐츠를 그림
* Layout, Subview 관리
  * 뷰에는 0개 이상의 subview가 존재 가능
  * 뷰는 subview의 크기와 위치를 조정할 수 있음
  * 레이아웃을 사용해서 뷰 계층 구조의 변경에 따라 뷰의 크기, 위치를 조정하는 규칙 생성 가능
* Event handling
  * 터치가 기타 이벤트에 응답할 수 있음
  * 제스처를 처리하기 위해 제스처 인식기를 사용할 수 있음

> Code로 생성할 수 있고 스토리보드로 제작할 수 있음, 스토리보드로 제작하는 것이 시각적으로 바로 확인 할 수 있어 좋겠지만 개인적으로 수정하기 불편한것 같음

```Swift
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1.text = "Week2 iOS UMC Lab"
    }
}
```
* 위와 같이 UILabel을 ViewController와 연결하여 text를 코드단계로 수정 할 수 있음
* 이 과정에서 Storyboard에서 선언한 객체를 Controller에 제대로 모두 연결하지 않으면 `this class is not key value coding-compliant for the key ~`와 같은 오류가 발생
* 해당 오류는 본인이 직접 하나하나 다 찾아서 제거해줘야 하는 번거로움이 있음...
