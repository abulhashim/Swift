// Arrays:

/*
 An Array stores values of the same type
 in an ordered list.
 */

let john = "John Smith"
let age = "25"
let mail = "contact@johnsmith.com"
let address = "Street 06, IST, San Fransico, CA, USA"
var johnDetail = [john, age, mail, address]

johnDetail[0]   // Accessing data fron an array:

let fatherName = "Paul Edison"
johnDetail.append(fatherName) // Adding data to an array:
print(johnDetail)


var arr: [String] = [] // create an empty array
var array = [String]()   // Same as above
array = ["john", "david", "peter"]
var anotherArray = ["Chris", "chad"]

var bothArray = array + anotherArray
bothArray += ["cora"]  // Adding data to array
print(bothArray)

// Note: Declaring an array with 'let' make it mutable, ...

type(of: johnDetail)  // to check datatype

var threeDoubles = Array(repeating: 0.0, count: 3)

threeDoubles.count
threeDoubles.isEmpty

var shoppingList = [String]()
shoppingList = ["Eggs", "Milk"]
shoppingList.append("Flour")
shoppingList += ["Cheese", "Ketchup"]
shoppingList[0] = "Six Eggs"
shoppingList[2...4] = ["Bananas", "Apples"]

// insert(_:at:)
shoppingList.insert("Maple Syrup", at: 0)
// remove(at:)
shoppingList.remove(at: 0)
shoppingList.removeLast()

// iterating over an array:
for item in shoppingList {
    print(item)
}


// Enumerated Method:
/*
 If you need the integer index of each item
 as well as its value use the enumerated method,
 to iterete over the array instead.
 */
for (index, value) in shoppingList.enumerated() {
    print("item: \(index + 1), \(value)")
}


// Tuples:


var website = (name: "Apple", url: "http://www.apple.com")

var data = (name: "john", age: 30, isMarried: false)
print(data.name) // Accessing data from tuple


let http404Error = (404, "Not Found")

/* You can decompose a tuple's content into separate
 constants or variables which you then access as usual: */

let (statusCode, statusMessage) = http404Error;

print("The status Code is \(statusCode)");
print("The Status Message is \(statusMessage)");

/* if you only need some of the tuple's values ignore parts
 of the tuple with an underscore(_) when you decompose the tuple: */

let (justStatusCode, _) = http404Error;
print("Just Status Code is \(justStatusCode)")

//  Using index number:

print("The status Code is \(http404Error.0)");
print("The status Message is \(http404Error.1)");

// Name the individual elements in a tuple when the tuple is defined:

let http200Status = (statusCode: 200, description: "OK")
print("The status Code is \(http200Status.statusCode)");
print("The status Message is \(http200Status.description)");

/*------------------------------------------------------------*/


// Dictionaries:

var emptyDict = [String:String]()
emptyDict["statusCode"] = "OK"
emptyDict.count
emptyDict.isEmpty

var person = [
    "name": "John",
    "fatherName": "Paul Edison",
    "email": "john@example.com",
    "address": "Street 06, IST, San Fransico, CA, USA"
]

person["name"]  // Accessing data from dictionary
person["name"] = "John Doe" // Modify the name of the person
person["age"] = "30" // Add the age of the person


// updateValue(_:forKey:) method
var airports = [
    "XYZ": "Tornoto Pearson",
    "DUB": "Dubin"
]
airports.updateValue("Dublin Airport", forKey: "DUB")

airports["APL"] = "Apple International"
airports["APL"] = nil

airports.removeValue(forKey: "DUB")

// Iterating over a Dictionary:
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("AirportCode: \(airportCode)")
}

for airportName in airports.values {
    print("AirportName: \(airportName)")
}

let airportCodes = [String](airports.keys)
let AirportNames = [String](airports.values)


/*------------------------------------------------------------*/


// Sets:

/*
 A set stores distinct values of the same type 
 in a collection with no defined ordering.
 You can use a set instead of an array when the 
 order of items isn't important, or when you need 
 to ensure that an item only appears once.
 */

var person1 = Set<Character>()
person1.insert("a")
person1 = [] // that is now an empty set,

var favoriteGenres: Set<String> = [
    "Rock", "Classical", "Hip Hop"
]

var colors: Set = ["red", "green", "yellow"]
favoriteGenres.count
favoriteGenres.isEmpty
favoriteGenres.insert("Jazz")
favoriteGenres.remove("Rock")

if favoriteGenres.contains("Funck") {
    print("yes")
}

// Iterating over a Set:

for genre in favoriteGenres {
    print("\(genre)")
}

// to iterete over the values of a set in a specific
// order use the sorted() method.

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// Set Operations:

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [1, 2, 3, 45, 7]

/*
 Use union(_:) method to create a new set with 
 all of the values in both sets
 */

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

/*
 Use intersection(_:) method to create a new set with 
 only the values common to both sets
 */

oddDigits.intersection(evenDigits).sorted()
// []

/*
 Use substracting(_:) method to create a new set with 
 values not in the specified set.
 */

oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1,9]

/*
 Use symmetricDifference(_:) method to create a new set with 
 values in either sets, but not both.
 */

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1,2,9]

// Set Membership and Equality:

let houseAnimals: Set = ["Dog", "Cat"]
let farmAnimals: Set = ["Horse", "Chicken", "Goat", "Dog", "Cat"]
let cityAnimals: Set = ["Pigeon", "Mouse"]


/*
 Use the 'is equal' operator (==) to determine 
 whether the two sets contain all of the same values.
 */


/*
 Use the isSubset(of:)method to determine 
 whether all of the values of a set are
 contained in a specified set.
 */

houseAnimals.isSubset(of:farmAnimals)
// true

/*
 Use the isSuperset(of:)method to determine 
 whether a set contains all of the values
 in a specified set.
 */

farmAnimals.isSuperset(of:houseAnimals)
// true

/*
 Use the isStrictSubset(of:) or isStrictSuperset(of:) method
 to determine whether a set is a subset or superset, but not
 equal to a specified set.
 */


/*
 Use the is Disjoint(with:) method to determine
 whether two sets have no values in common.
 */

farmAnimals.isDisjoint(with:cityAnimals)
// true

/*------------------------------------------------------------*/
