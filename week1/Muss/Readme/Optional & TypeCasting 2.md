# Optional & TypeCasting

# 옵셔널

변수 안에 값이 확실히 있다는 것을 보장할 수 없으므로 옵셔널 값을 쓴다.

```swift
var test : Int?
test = nil
```

?를 붙이는 것은 값이 있을 수도 없을 수도 있다는 것을 명시해 준 것!
쉽게 생각해서 옵셔널 변수는 상자 안에 값이 들어가 있다고 생각할 수 있다.
안에 값이 있는지 확인해 줄 때는 옵셔널 바인딩과 강제 언래핑(Unwrapping)이 있다

## 옵셔널 바인딩 & 강제 언래핑(!)

```swift
var someValue: Int? = 30
if let value = someValue {
	print(value)
}else {
  print("nil")
}

var nilValue: Int = someValue!
```

위 코드의 상단과 같이 someValue에 값이 있는지 '노크'를 한 후, 값을 받는 것을 옵셔널 바인딩이라고 한다. 또한 if-let은 조건문이 하나가 아닌 ','를 통해 여러개를 붙일 수도 있다. 

+) 옵셔널 변수에 값을 지정해주지 않으면 자동으로 nil로 저장된다!

이와 달리 하단 코드에는 '!'를 써서 값이 있든 없든 강제로 값을 꺼내는데 이를 강제 언래핑이라고 한다. 만약 강제 언래핑을 했는데 nil 값이 나오면 런타임 오류가 날 수 있기 때문에 강제 언래핑을 할 때는 항상 옵셔널 값이 nil이 아니라는 것을 확실히 해야 한다.

## 옵셔널 체이닝

```swift
class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}

let muss = Person()
if let roomCount = muss.residence?.numberOfRooms{
    print("\(roomCount)")
}else {
    print("don't have rooms for you")
}
```

다음과 같이 하위 프로퍼티에 Optional값이 있는지 연속적으로 확인하면서 중간에 하나라도 nil이 발견된다면 nil을 반환하는 것이 옵셔널 체이닝 방식이다.

+) 위 코드의 muss.residence?.numberOfRooms가 nil을 반환할 수도 있기 때문에 따로 optional로 지정을 하지 않아도 여기서 roomCount의 타입은 옵셔널로 자동으로 지정된다.

# 타입 캐스팅

타입캐스팅은 인스턴스의 타입을 확인하거나, 인스턴스의 타입을 슈퍼클래스 또는 서브클래스 타입처럼 다루기 위해 사용한다.

Swift에서 타입 캐스팅은 "is"와 "as"라는 연산자로 구현할 수 있으며, 이 두 연산자는 값의 타입을 확인하거나, 값을 다른 타입으로 변환하는 간단하고 표현적인 방법을 제공한다.

애플에서 설명한 예제로 확인해보자

```swift
class MediaItem {
    var name: String
    init(name: String) { //초기 값(name)을 지정해주지 않아 init을 만들어주었다
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name) //상위 클래스를 참조할 때는 super
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "죽은 시인의 사회", director: "피터 위어"),
    Song(name: "창공", artist: "김준석"),
    Movie(name: "인터스텔라", director: "크리스토퍼 놀란"),
    Movie(name: "공범자들", director: "최승호")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
        
    } else if item is Song {
        songCount += 1
    }
}
print("Media library는 \(movieCount)개의 영화와  \(songCount)개의 노래가 있어요!")
//Media library는 3개의 영화와  1개의 노래가 있어요!
```

library 배열에는 Movie와 Song타입 인스턴스가 들어가고 자연스럽게 library 배열은 Mediaitem 타입의 배열이 된다.

Library 배열을 돌며 해당 인스턴스가 Movie타입인지, Song타입인지 "is"로 확인하고 있다.

## Downcasting/Upcasting

특정 클래스 타입의 상수 또는 변수는 하위 클래스의 인스턴스를 참조할 수 있다

이 경우에는 타입 캐스트 연산자 (ex. as? 또는 as!)를 사용하여 서브 클래스 타입으로 "다운캐스팅"을 시도할 수 있다.

조건부 형식인 ?은 다운캐스팅 하려는 타입의 Optional 값을 반환합니다.

강제 형식인 !은 강제 언래핑을 하여 값을 반환합니다.

그러니, 다운캐스팅이 항상 성공할 것이라는 확신이 들때만 강제형식인 !를 사용해야 한다. 이 형식은 잘못된 클래스 타입으로 다운캐스트 하려고 하면, **런타임 에러**를 발생시키기 때문!

```swift
for item in library {

    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
   }
}
```

item은 MediaItem의 인스턴스여서 Movie일 수도 있고, Song일 수도 있다

MediaItem이 슈퍼클래스였고, 지금 Movie와 Song클래스는 MediaItem의 서브클래스(자식클래스)이므로, 다운캐스팅이 가능한 것!

업캐스팅은 다운캐스팅과 반대로 특정 클래스의 객체를 상위 클래스의 객체로 형 변환시키는 것이라 생각하면 된다.