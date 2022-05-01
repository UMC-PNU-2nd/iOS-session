# Navigation Bar에 Search Bar 넣기

동적인 서치바(클릭했을 때 취소 버튼 보이는 등)가 필요하지 않다면 단순히 left/rightBarButtonItem에 서치바와 취소 버튼을 넣어주면 된다.

내가 구현하고 싶은 건 서치바를 클릭했을 때 애니매이션과 함께 취소 버튼이 보이고 키보드가 자동으로 뜨게 하는 것

→ UISearchController를 사용한다

## UISearchController

정의: search bar와의 상호 작용을 기반으로 검색 결과 표시를 관리하는 ViewController

(UIViewController를 상속한다)

```swift
self.navigationItem.searchController = searchController
```

searchController라는 프로퍼티에 우리가 만든 searchController를 넣어주면 된다

### SearchController initialize

```swift
private func setUpNavigationBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
```

처음 searchController를 정의해 줄 때 searchResults:(type - UIViewController)에는 검색어를 입력했을 때의 화면을 지정해줄 수 있다

ex) 검색어 추천 기능 테이블 뷰
<br>

<center>
<img src="https://velog.velcdn.com/images/enchantee/post/8be90346-d059-4d1c-94e1-412ef437965a/image.png" width=50%>
</center>
<br>

또한 searchController내에 쓸 수 있는 다양한 프로퍼티들도 존재한다
[iOS ) NavigationBar에 SearchBar넣기 / UISearchController (1)](https://zeddios.tistory.com/1196)

