class UMC {
    var product: String = ""
}

let company: UMC = UMC()
company.product = "iOS-Study"
//dump(company)

let name: String = "Wonjune Choi"

print("나는 \(name) 입니다.")

let gName: String = "UMC"
let myName: String = "Choi Won June"
let age: Int = 23

var job: String = "iOS Programmer"
var height = 171.0
height = 171.5

var cat: (name:String, age:Int, size:String) = ("name",2,"big")

var names: Array<String> = ["Choi Won June", "ASD"]
//var names:[String]

var codeForName: Dictionary<String, Int> = Dictionary<String, Int>()

var codes: Set<String> = Set<String>()
let bird: Set<String> = ["Pizons", "Cock", "Turkey", "Eagle"]

enum School { case primary, elementary, middle, high}
