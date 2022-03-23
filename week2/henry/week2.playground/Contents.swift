import UIKit

/* 1. 변수와 상수 선언*/
// 1.1 상수
let name: String = "henry"
let swift = "Swift"

// 1.2 변수
var year: Int = 2022
var y = 2022

year = 2023

print(year)

/* 2. 함수만들기 */
func sum(a: Int, b: Int) -> Int {
    return a + b
}

// print(sum(a:1, b:2 ))

func multiply(a: Int, b:Int) -> Int {
    a * b
}

//print(multiply(a: 10, b: 10))

/* 3. 이름 짓기*/
// 3.1 Lower Camel Case - 인스턴스 / 메소드 / 함수
//(시작은소문자 나머지단어시작은 대문자)
let viewController = UIViewController()

// 3.2 Upper Camel Case - 구조체 / 클래스 / 프로토콜 등 선언
// -시작도 대문자 나머지도 대문자 시작

struct Person {
    let a: Int
    let b: Int
}
// 클래스는 자동으로 초기화함수 생성을 안해준다.
class Operator {
    let a: Int
    let b: Int
    
    init(a: Int, b: Int){
        self.a = a
        self.b = b
    }
}
//구체적인선언은 해당 프로토콜을 채택한 객체가 직접 구현 ( 그림만짠다
protocol Flyable {
    func fly()
    
}
