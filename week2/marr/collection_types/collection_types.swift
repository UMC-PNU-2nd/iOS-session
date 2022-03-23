/*
 Collection Types
 
 Swift provides three primary collection types: array, set and dictionary.
 
 Array: Ordered collections of values
 Set: Unordered collections of unique values
 Dictionary: Unordered collections of unique values
 */

/*
 Mutability of Collections
 
 If your create collection and assign it to a variable, it will be mutable. This means that you can change the collection after it's created by adding, removing or changing its items. If you assign it to a constant, it'll be immutable.
 */

var someInts: [Int] = [] // same as :Array<Int>
//print("someInt has \(someInts.count) items.")

someInts.append(3)
someInts += [4, 5]
print(someInts)
someInts = []

/*
 Creating an Array with a default value
 */
var threeDoubles = Array(repeating: 0.0, count: 3)
//print(threeDoubles)

/*
 Creating an Array by Adding Two Arrays Together
 */
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
//print(sixDoubles)

/*
 Creating an Array with Literal
 */
var shoppingList: [String] = ["Eggs", "Milk"]
//print(shoppingList)

/*
 Accessing and Modifying an Array
 */

//print("The shopping list contains \(shoppingList.count) items.")
//print(shoppingList.isEmpty)
//shoppingList.append("Flour")
//shoppingList += ["Baking Powder"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
//print(shoppingList)
shoppingList[0...1] = ["Tomato", "Noodle"]
//print(shoppingList)
shoppingList[shoppingList.endIndex...] = ["Bananas", "Apples"]
print(shoppingList)
shoppingList.insert("Maple Syrup", at: 0)
//print(shoppingList)
let mapleSyrup = shoppingList.remove(at: 0)
//print(mapleSyrup)

let apples = shoppingList.removeLast()
//print(apples)

/*
 Iterating Over an Array
 */

for item in shoppingList {
//    print(item)
}

for (index, value) in shoppingList.enumerated() {
//    print("Item \(index + 1): \(value)")
}

/*
 Sets
 
 A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items isn't important, or when you need to ensure that an item only appears once.
 */

/*
 Hash values for Set Types
 
 A type must be hashable in order to be stored in a set - that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that's the same for all objects that compare equally.
 
 You can use your own custom types as set value types or dictionary key types by making them conform to the Hashable protocol from the standard library.
 */

var letters = Set<Character>()
letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// var favoriteGenres: Set = ["Rock", ...]

/*
 Accessing and Modifying a Set
 */
//print("I have \(favoriteGenres.count) favorite genres.")
//print(favoriteGenres.isEmpty)
favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print(removedGenre)
}

//print(favoriteGenres.contains("Funk"))

for genre in favoriteGenres.sorted(by: <) {
    print(genre)
}

/*
 Performing Set Operations
 */

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbes: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sorted())
print(oddDigits.intersection(evenDigits).sorted())
print(oddDigits.subtracting(singleDigitPrimeNumbes).sorted())
print(oddDigits.symmetricDifference(singleDigitPrimeNumbes).sorted())

/*
 Set Membership and Equality
 */
let houseAnimals: Set = ["Dog", "Cat"]
let farmAnimals: Set = ["Cow", "Chicken", "Sheep", "Dog", "Cat"]
let cityAnimals: Set = ["Pigeon", "Rat"]
print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: cityAnimals))

/*
 Dictionaries
 
 A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined orderinig. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary.
 
 Unlike items in an array, items in a dictionary don't have a specific order.
 */

var namesOfIntegrs: [Int: String] = [:]
namesOfIntegrs[16] = "sixteen"
namesOfIntegrs = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

/*
 Accessing and Modifying a Dictionary
 */

print("\(airports.count)")
print(airports.isEmpty)
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print(airportName)
}

airports["DUB"] = nil // removing from dictionary

if let removedValue = airports.removeValue(forKey: "DUB") {
    print(removedValue)
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values.sorted(by: <) {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = Array<String>(airports.values)
