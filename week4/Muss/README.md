# UITableView

일정한 형태의 화면 구성이 반복되며 리스트에  포함되어 있다 → UITableView & Cell로 구현 가능하다. ex) 카톡 대화 창, 인스타그램 피드

리스트 형태를 지니고 있으며, 스크롤이 가능하다(수직으로만).

섹션을 이용해 행을 시각적으로 구분 할 수 있다.

섹션의 헤더와 푸터에 이미지나 텍스트를 이용하여 추가적인 정보를 보여줄 수 있다.

![](https://imagedelivery.net/v7-TZByhOiJbNM9RaUdzSA/000eb41c-3d7b-4b62-26b0-96336bb4b600/public)
<br>

## TableViewDelegate

- 테이블뷰 델리게이트 객체는 **UITableViewDelegate** 프로토콜을 채택한다.
- 델리게이트는 테이블뷰의 **시각적인 부분 수정**, **행의 선택 관리**, **액세서리뷰 지원** 그리고 **테이블뷰의 개별 행 편집**을 도와준다.

![](https://imagedelivery.net/v7-TZByhOiJbNM9RaUdzSA/a09b343e-54a7-49af-d0a8-e2556ba16f00/public)
프로토콜 내에 메서드들이 선언되어 있는 모습 → optional이 붙었기 때문에 필수 구현 메서드가 아니다
<br>

UITableViewDelegate 프로토콜의 주요 메서드

```swift
// 지정된 행이 선택되었음을 알리는 메서드
func tableView(UITableView, didSelectRowAt: IndexPath)

// 지정된 행의 선택이 해제되었음을 알리는 메서드
func tableView(UITableView, didDeselectRowAt: IndexPath)

// 특정 위치 행의 높이를 묻는 메서드
func tableView(UITableView, heightForRowAt: IndexPath)

// 특정 위치 행의 들여쓰기 수준을 묻는 메서드
func tableView(UITableView, indentationLevelForRowAt: IndexPath)

// 특정 섹션의 헤더뷰 또는 푸터뷰를 요청하는 메서드
func tableView(UITableView, viewForHeaderInSection: Int)
func tableView(UITableView, viewForFooterInSection: Int)

// 특정 섹션의 헤더뷰 또는 푸터뷰의 높이를 물어보는 메서드
func tableView(UITableView, heightForHeaderInSection: Int)
func tableView(UITableView, heightForFooterInSection: Int)

// 테이블뷰가 편집모드에 들어갔음을 알리는 메서드
func tableView(UITableView, willBeginEditingRowAt: IndexPath)

// 테이블뷰가 편집모드에서 빠져나왔음을 알리는 메서드
func tableView(UITableView, didEndEditingRowAt: IndexPath?)
```
<br>

## **TavleViewDataSource**

- 테이블뷰 데이터 소스 객체는 **UITableViewDataSource** 프로토콜을 채택한다.
- 데이터 소스는 테이블 뷰를 생성하고 수정하는데 필요한 정보를 테이블뷰 객체에 제공한다.

![](https://imagedelivery.net/v7-TZByhOiJbNM9RaUdzSA/901ba151-12d4-43d6-f703-d4214a173300/public)

프로토콜 내에 메서드들이 선언되어 있는 모습 → cellForRowAt & numberOfRowsInSection 은 optional이 붙지 않았기 때문에 필수 구현 메서드이다
<br>

UITableViewDataSource 프로토콜의 주요 메서드

```swift
@required 
**// 특정 위치에 표시할 셀을 요청하는 메서드**
func tableView(UITableView, cellForRowAt: IndexPath) 
 
**// 각 섹션에 표시할 행의 개수를 묻는 메서드**
func tableView(UITableView, numberOfRowsInSection: Int)
 
@optional
// 테이블뷰의 총 섹션 개수를 묻는 메서드
func numberOfSections(in: UITableView)
 
// 특정 섹션의 헤더 혹은 푸터 타이틀을 묻는 메서드
func tableView(UITableView, titleForHeaderInSection: Int)
func tableView(UITableView, titleForFooterInSection: Int)
 
// 특정 위치의 행을 삭제 또는 추가 요청하는 메서드
func tableView(UITableView, commit: UITableViewCellEditingStyle, forRowAt: IndexPath)
 
// 특정 위치의 행이 편집 가능한지 묻는 메서드
func tableView(UITableView, canEditRowAt: IndexPath)

// 특정 위치의 행을 재정렬 할 수 있는지 묻는 메서드
func tableView(UITableView, canMoveRowAt: IndexPath)
 
// 특정 위치의 행을 다른 위치로 옮기는 메서드
func tableView(UITableView, moveRowAt: IndexPath, to: IndexPath)
```
<br>

**테이블뷰의 Delegate와 DataSource의 관계 표현**
![](https://imagedelivery.net/v7-TZByhOiJbNM9RaUdzSA/515532e3-d800-4db6-b709-b357e26b3800/public)

**func tableView(UITableView, cellForRowAt: IndexPath)** 

→ dequeReusableCell: 재사용 가능한 셀을 큐에서 빼낸다. 말그대로 실제로 재사용 가능한 큐에서 **특정 identifier**의 셀을 가져오는 메소드이다

iOS 기기는 메모리가 무한정 있는 것이 아니기 때문에 반복된 뷰를 생성할 때는 뷰를 재사용하여 메모리를 절약하는 것이 좋다.

따라서 다음과 같은 원리를 이용해 UITableViewCell 이나 UICollectionViewCell을 재사용 한다.

1. 테이블뷰 및 컬렉션뷰에서 셀을 표시하기 위해 데이터 소스에 뷰(셀) 인스턴스를 요청한다.
2. 데이터 소스는 요청마다 새로운 셀을 만드는 대신 **재사용 큐 (Reuse Queue)**에 재사용을 위해 대기하고있는 셀이 있는지 확인 후 있으면 그 셀에 새로운 데이터를 설정하고, 없으면 새로운 셀을 생성한다.
3. 테이블뷰 및 컬렉션뷰는 데이터 소스가 셀을 반환하면 화면에 표시한다.
4. 사용자가 스크롤을 하게 되면 일부 셀들이 화면 밖으로 사라지면서 다시 재사용 큐에 들어간다.
5. 위의 1번부터 4번까지의 과정이 계속 반복

![](https://imagedelivery.net/v7-TZByhOiJbNM9RaUdzSA/dd8ed8d8-473b-4d67-a3e0-a3c025a32d00/public)
<br>
<br>

# UITableViewCell
![](https://imagedelivery.net/v7-TZByhOiJbNM9RaUdzSA/e1f52305-638d-4863-a942-aa6ba06e5400/public)

셀의 구조는 위의 그림과 같이 컨텐츠 영역과 액세서리뷰 영역으로 나뉜다.

- 셀 콘텐츠: 주로 문자열, 이미지 혹은 고유 식별자 등이 입력된다.
- 액세서리뷰: 상세보기, 재정렬, 스위치 등과 같은 컨트롤 객체가 위치한다.

### Basic Style

UITableViewCell 클래스를 상속받는 기본 테이블뷰 셀은 **표준 스타일**을 이용할 수 있다. 

표준 스타일 UITableViewCell 클래스는 셀 콘텐츠에 세 가지 프로퍼티가 정의되어 있다.

- textLabel: UILabel: 주제목 레이블
- detailTextLabel: UILabel: 추가 세부 사항 표시를 위한 부제목 레이블
- imageView: UIImageView: 이미지 표시를 위한 이미지뷰

### Custom Style

UITableViewCell 클래스에서 기본 형태를 벗어나 다양한 애플리케이션의 요구를 충족시키기 위해 셀을 커스텀 할 수 있다. 셀을 커스텀 하면 이미지를 텍스트 오른쪽에 위치시키는 등 원하는 시각적 형태를 만들 수 있다.
<br>

## Cell Life Cycle

1. **awakeFromNib()**
    
    Interface Builder archive 또는 nib 파일이 생성된 후 초기화 작업을 준비하는 곳
    
    간단히 말해 셀을 가장 처음에 초기화 하는 작업이다.
    
2. **tableView(_:cellForRowAt)**
    
    TableView의 특정 위치에 삽입할 Cell에 대해 DataSource에 요청하는 메서드
    
    구현 시 테이블뷰의 dequeReusableCell(withIdentifier: for:) 메서드를 통해 지정된 indexPath로 적절하게 셀을 생성한다(메모리에 로드된다).
    
3. **tableView(_:willDisplay:forRowAt:)**
    
    Delegate가 셀 객체를 그리기 전에 호출되는 함수
    
    화면에 보여지기 직전에 작업을 수행함
    
4. **prefetch**
    
    UITableViewDataSourcePrefetching
    
    TableView와 CollectionView에 사용할 수 있는 UITableViewDataSourcePrefetching 프로토콜이다.
    
    디스플레이에 보여지는 셀 이외의 셀의 정보를 미리 호출하여 데이터를 받아올 수 있다.
    
    → 즉, 화면에 보이지 않는 나머지 셀 들의 정보를 받을 수 있다.
    
    필수적으로 구현해야 하는 함수:
    
    **prefetchRowsAt**
    
    - 셀에 필요한 데이터를 미리 받아오며 10개의 셀을 미리 받아온다.
    
    **cancelPrefetchingForRowsAt**:
    
    - prefetch가 필요하지 않은 셀들에 대해 작업을 취소하는 메서드
    - 일반적으로 스크롤 방향이 바뀔 떄 필요에 따라 데이터 로딩이 되지 못 한 것을 취소하는데 사용할 수 있고, 불필요한 작업을 취소하여 CPU 시간을 줄일 수도 있음
5. **tableView(_:didEndDisplaying:forRowAt:)**
    
    테이블뷰로부터 cell이 화면에 사라지면 호출되는 메서드
    
6. **prepareForReuse()**
    
    테이블뷰 Delegate에 의해 재사용 가능한 셀을 준비하는 메서드
    
    awakeFromNib에 의해 화면에 보이는만큼 셀의 갯수를 생성 → 그 이후 큐에 넣어졌던 셀을 재사용하므로 더 이상 셀을 생성하는 것이 아니라 재사용하는 메커니즘을 사용!
    
    <br>

+) **특정 셀에 특정 정보를 넣을 때 사용하는 IndexPath** 
![](https://imagedelivery.net/v7-TZByhOiJbNM9RaUdzSA/e3f52790-698a-4a74-5294-75830b081400/public)

indexPath의 row를 참조해야 하는 이유:  첫 번째 0은 **테이블 뷰의 section**에 대한 정보이고 두 번째 숫자는 **section의 행**에 대한 정보이다. 따라서 indexPath.row를 사용해야 행에 대한 정보인 두 번째 숫자를 참조할 수 있다. 
<br>
<br>

# Collection VIew

테이블 뷰와 거의 똑같다

- UICollectionViewDelegate, UICollecionViewDataSource 프로토콜 채택
- 컬렉션 뷰 생성 후, nib 파일로 셀 생성해서 컬렉션 뷰에 등록한다

## UICollectionViewDelegateFlowLayout

이 프로토콜은 컬렉션 뷰 내에서 셀들의 사이즈나 셀들 사이의 spacing을 정의해주며 프로토콜 내의 메서드들은 전부 선택적이다.

프로토콜 내의 메서드들
![](https://imagedelivery.net/v7-TZByhOiJbNM9RaUdzSA/a0914b51-b914-4072-7cb8-35824e038600/public)

