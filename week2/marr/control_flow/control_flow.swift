/*
 Control Flow
 
 Swift provides a variety of control flow statements. These include while loops to perform task multiple times; if, guard, and switch statments to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code.
 
 Swift also provides a for-in loop that makes easy to iterate over arrays, dictionaries, ranges, strings and other sequences.
 
 Swift's switch statement is considerably more powerful than its counterpart in many C-like languages. Cases can match many different patterns, including interval matches, tuples and casts to a specific type. Matched values ina switch case can be bound to temporary constants or variables for use within the case's body, and complex matching conditions can be expressed with a where clause for each case.
 */

/*
 For-In Loops
 
 You use the for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.
 */

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello,\(name)!")
}

let numberOfLegs = ["Spider": 8, "Ant": 6, "Cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

/*
 You can also use for-in loops with numeric ranges. This example prints the first few entries.
 */

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

/*
 If you dont't need each value from a sequence, you can ignore the values by using an underscore in place of variable name.
 */

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)

/*
 In some situations, you might not want to use closed ranges, which include both endpoints.
 */

let minutes = 60
for tickMark in 0..<minutes {
//    print(tickMark)
}

/*
 Some users might want fewer tick marks in their UI.
 Use the stride(from:, to: ,by: ) function to skip the unwanted marks.
 
 to: -> open range
 through: -> closed range
 */

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
//    for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
//    print(tickMark)
}

/*
 While Loops
 
 A while loop performs a set of statements until a condition becomes false. These kinds of loops are best userd when the number of iterations isn't known before the first iteration begins. Swift provieds two kinds of while loops.
 
 while evaluates its condition at the start of each pass through the loop.
 repeat-while evaluates its condition at the end of each pass through the loop
 */

var index = 1
var finalIndex = 5
while index < finalIndex {
    print("Current Index: \(index)")
    index += 1
}

repeat {
    print("Current Index: \(index)")
} while index < finalIndex

/*
 Conditional Statements
 
 Swift provieds two ways to add conditional branches to your code: the if statement and the switch statement. Typically, you use the if statement to evaluate simple conditions with only a few possible outcomes. The switch statement is better suited to more complex conditions with multiple possible permutations and is useful in situations where pattern matching can help select an appropriate code branch to execute.
 */

/*
 Switch
 
 A switch statement considers a value and compares it against several possible matching patterns. It then execute an appropriate block of code, based on the first pattern that matches successfully. A switch statement provides an alternative to the if statement to the if statement for responding to multiple potential states.
 
 Switch statements must be exhaustive!
 */

let someCharacter = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

/*
 No Implicit Fallthrough
 
 In constrast with switch statements in C and Objective-C, switch statements in Swift don't fall through the bottom of each case and into the next one by default.
 
 Although break isn't required in Swift, you can use a break statement to match and ignore a particular case.
 */

let anohterCharacter = "a"
switch anohterCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

/*
 Interval Matching
 
 Values in switch cases can be checked for their inclusion in an interval.
 */

let approximateCount = 62
let natualCount: String
switch approximateCount {
case 0:
    natualCount = "no"
case 1..<5:
    natualCount = "a few"
case 5..<12:
    natualCount = "several"
default:
    natualCount = "many"
}
print(natualCount)

/*
 Tuples in Switch
 
 You can use tuples to test multiple values in the same switch statement. Each element of the tuple can be tested against a different value or interval of values. Alternatively, use the underscore charater (_).
 */

let somePoint = (1, 1)
let boxRange = -2...2
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case(_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (boxRange, boxRange):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

/*
 Value Bindings
 
 A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case. This behavior is known as value binding, because the values are bound to temporary constants or variables within the case's body.
 */

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

/*
 Where
 
 A switch case can use a where clauses to check for additional conditions.
 */

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let(x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let(x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

/*
 Compound Cases
 
 Multiple switch cases that share the same body can be combined by writing several patterns after case, with a comma between each of the patterns.
 */

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

/*
 Control Transfer Statements
 
 Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another.
 */

/*
 Continue
 
 The continue statement tells a loop to stop what it's doing and start again at the beginning of the next iteration through the loop.
 */

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)

/*
 Labeled Statements
 
 In Swift, you can nest loops and conditional statements inside other loops and conditional statements to create complex control flow structures. However, loop and conditional statements can both use the break statement to end their execution prematurely. Therefore, it's sometimes useful to be explicit about which loop or conditional statement you want a break statement to terminate.
 */

var i = 0
var j = 0
firstLoop: while i < 1 {
    print("firstLoop Start")
    secondLoop: while j < 1 {
        print("secondLoop Start")
        break firstLoop
        print("secondLoop End")
    }
    print("firstLoop End")
}

/*
 Early Exit
 
 A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed.
 
 Unlike an if statement, a guard statement always has an else clause
 */
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

/*
 Checking API Availability
 
 You use an availability condition in an if or guard statement to conditionally execute a block of code, depending on whether the APIs you want to use are available at runtime.
 */

if #available(iOS 15.4, macOS 10.12, *) {
    print(1)
}  else {
    
}
