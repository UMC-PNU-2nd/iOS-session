
// Declaring Constants and Variables
// let: Constant / var: Variable
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

// Can declare mutiple constants or multiple variables on a single line, seperated by commas
var x = 0.0, y = 0.0, z = 0.0

// Type Annotations
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double


// Swift use string interpolation to include the name of a constant or variable
print("The current value of welcomeMessage is \(welcomeMessage)")

// Can access min and max values of each integer type with its min and max properties
// Int.min, Int.max also avaliable
let minValue = UInt8.min
let maxValue = UInt8.max
// Type Safety and Type Inference
/*
 Swift is a type-safe language. It encourages you to be clear about the types of values.
 */

let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int

let pi = 3 + 0.141592
// pi is inferred to be of type Double

// Integer and Floating-Point Conversion
let three = 3
let floatingPoint = 0.141592
let mathPi = Double(three) + floatingPoint

// Type Aliases -> Same as typedef
typealias AudioSample = UInt16

// Tuples
let http404Error: (Int, String) = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// http404Error.0 is also available

print("The status Message is \(statusMessage)")
// http404Error.1 is also available

let (justTheStatusCode, _) = http404Error

// Tuple Comparison
// Can compare two tuples if they have same type and same number of values
// Tuples are compared from left to right, one value at a time
print((1, "zebra", -1) < (2, "apple", -1))
print((3, "apple") < (3, "bird"))
print((4, "dog") == (4, "dog"))
// print(("blue", false) < ("purple", true))
// Error because < can't compare Boolean values
print(("blue", 1) < ("purple", 2))


// NIL
var serverResponseCode: Int? = 404
serverResponseCode = nil

// Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
print(type(of: convertedNumber))
// Result is Int?(=Optional Int)

// Nil-Coalescing Operator
let defaultColor = "red"
var userDefinedColor: String? // defaults to nil
var colorToUse = userDefinedColor ?? defaultColor
print("Color To Use: \(colorToUse)")

// Unary Minus Operator
let justThree = 3
let minusThree = -justThree
let plusThree = -minusThree
