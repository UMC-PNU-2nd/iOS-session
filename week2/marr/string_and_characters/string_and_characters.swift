
/* String Literals */

let someString = "Some string literal value"

/* Multiline String Literals */
let quotation = """
"Was it a cat I saw?",
Alice said.
"""
//print(quotation)

/*
 using backslash inside multistring
 If I want to make source cod easier to read, but don't want the line breaks to be part of string's value
*/
let softWrappedQuotation = """
"Was it a cat I saw?", \
Alice said.
"""
//print(softWrappedQuotation)

/* Initializing an Empty String */
var emptyString = "" // using literal
var anotherEmptyString = String() // using initializer -> equivalent as uppper one

if emptyString.isEmpty {
    print("Nothing to see")
}

/* String Mutability */
var variableString = "Horse"
variableString += " and carriage"

/*
 Swift's String type is value type.
 If you create a new String value, that String value is copied when it's passed to a function or method.
 */

var origin = "origin"
var copied = origin
origin = "modified"
print(copied) // Deep copy

/* Working with Characters */
for character in "Dog!" {
    print(character)
}
let exclamationMark: Character = "!" // swift uses double-quoted string literal

/*
 String values can be constructed by passing an array of Character values
 as an argument to its initializer
 */
let catCharacters: [Character] = ["C", "a", "t"]
let catString = String(catCharacters)
print(catString)

/*
 You can append Character value to String variable with append() method
 */
var welcome = "Welcome"
welcome.append("!")
print(welcome)

/* String Interpolation */

let multiplier = 3
//let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)
//print(#"\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"#)

/* Unicode: Hangul Representation */
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
print(precomposed)
print(decomposed) // Both if these representations qualify as a single Character value

/* Counting Characters */
let numberString = "123456789"
print("Length of someString: \(numberString.count)")

/*
 String concatenation and modification may not always affect a string's character count. Especially UNICODE...
 
 Extended grapheme clusters can be composed of multiple Unicode scalars. This means that different characters - and different representation of the same character - can require different amounts of memory to store. Because of this, characters in Swift don't each take up the same amount of memory to store.
 
 Because of this, characters in Swift don't each take up the same amount of memory within a string's representation. As a result, the number of characters in a string can't be calculated without iterating through the string to determine its extended grapheme cluster boundaries.
 */
var word = "안"
print("the length of word in \(word) is \(word.count)")
word += "\u{11AB}\u{11AB}" // ㄴ
print("the length of word in \(word) is \(word.count)")


/*
 String Indices
 
 Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the String.
 
 Swift strings can't be indexed by integer values.
 */

let greeting = "Guten Tag!"
print(greeting[greeting.startIndex]) // G
print(greeting[greeting.index(before: greeting.endIndex)]) // !
print(greeting[greeting.index(after: greeting.startIndex)]) // u
print(greeting[greeting.index(greeting.startIndex, offsetBy: 7)]) // a
// greeting[greeting.endIndex] -> ERROR
// greeting.index(after: greeting.endIndex) -> ERROR

print(word[word.startIndex])
print(word[word.index(after: word.startIndex)])

/* Indices property */
for index in greeting.indices {
    // Access all of indeces of individual characters in string
    print("\(greeting[index])", terminator: " ")
}
print()

/*
 Inserting and Removing
 
 You can use the insert, remove, removeSubrange on any type that conforms to the RangeReplaceableCollection protocol. This includes String, Array, Dictionary, and Set.
 */

var hello = "hello"
hello.insert("!", at: hello.endIndex) // hello!
hello.insert(contentsOf: " there", at: hello.index(before: hello.endIndex)) // hello there!
// at: hello.endIndex -> hello! there

hello.remove(at: hello.index(before: hello.endIndex)) // hello there
let range = hello.index(hello.endIndex, offsetBy: -6)..<hello.endIndex
hello.removeSubrange(range) // hello

/*
 Substrings
 
 Like strings, each substring has a region of memory where the characters that make up the substring are stored. The difference between strings and substrings is that, as a performance optimization, a substring can reuse part of the memory that's used to store the original string, or part of the memory that's used to store another substring.
 
 So substrings aren't suitable for long-term storage.
 */
var greetings = "Hello, world!"
let index = greetings.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greetings[..<index] // Hello
// Convert the result to a String for long-term storage
let newString = String(beginning)

/*
 Comparing Strings
 */
let firstQuotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
print(firstQuotation == sameQuotation) // true

/*
 Prefix and Suffix Equality
 */
let romeoAndJuliet = "Act 1 Scene 1: Verona, A public place"
print(romeoAndJuliet.hasPrefix("Act 1")) // true
print(romeoAndJuliet.hasPrefix("Scene 1")) // false
print(romeoAndJuliet.hasSuffix("place")) // true

/*
 UTF-8 Representation
 */

for codeUnit in "Hello".utf8 {
    print("\(codeUnit) ", terminator: "")
}
print()

