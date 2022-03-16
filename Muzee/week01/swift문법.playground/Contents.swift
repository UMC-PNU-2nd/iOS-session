import UIKit

/* 1. 변수와 상수 선언 */
// 1.1 상수
let name: String = "Uno"
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

print(sum(a: 1, b: 2))

func multiply(a: Int, b: Int) -> Int {
    a*b
}

print(multiply(a: 10, b: 10))

/* 3. 이름 짓기 */
// 3.1 Lower Camel Case - Instance / Method / Function
// - 시작은 소문자 나머지 단어의 시작은 대문자
let viewController = UIViewController()

// 3.2 Upper Camel Case - structure / Class / Protocol
// - 시작과 나머지 단어 모두 대문자

struct Person {
    let a: Int
    let b: Int
}

class Operator {
    let a: Int
    let b: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

protocol Flyable {
    func fly()
}
