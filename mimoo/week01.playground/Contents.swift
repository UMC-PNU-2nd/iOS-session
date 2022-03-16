import UIKit

// 상수
let name: String = "MiMoo"
let name2 = "MiMoo2"

// 변수
var year: Int = 2022
var year2 = 2022

year = 2023
print(year)

// 함수
func sum(a: Int, b: Int) -> Int {
    return a+b
}

func mul(a: Int, b: Int) -> Int {
    a*b
}

var years: Array<Int> = [2022, 2000, 2002, 2005]
var sortedyears: Array<Int> = years.sorted(by: { (a: Int, b: Int) -> Bool in
  return a < b
})

print(sortedyears)

/*
 Camel Case
 Lower: instance, method, function
 Upper: struct, class, protocol
*/

struct MyStruct {
    let a: Int
    let b: Int
}

class Operator {
    let a: Int
    let b: Int
    
    init(a: Int, b:Int){
        self.a = a
        self.b = b
    }
}

protocol Flyable {
    func fly()
}

protocol Person {
    func eat()
}

class Student: Person {
    func eat() {
        print("Student is eating...")
    }
}

class Teacher: Person {
    func eat() {
        print("Teacher is eating...")
    }
}

var st: Student = Student()
st.eat()
