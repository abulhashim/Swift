// Arrays:


let john = "John Smith"
let age = 25
let mail = "contact@johnsmith.com"
let address = "Street 06, IST, San Fransico, CA, USA"
var johnDetail: Any = [john, age, mail, address]

johnDetail[0]   // Accessing data fron an array:

let fatherName = "Paul Edison"
johnDetail.append(fatherName) // Adding data to an array:
print(johnDetail)


var array: [String] = [] // create an empty array
var array = [String]()   // Same as above
array = ["john", "david", "peter"]
var anotherArray = ["Chris", "chad"]

var bothArray = array + anotherArray
bothArray += ["cora"]  // Adding data to array
println(bothArray)

// Note: Declaring an array with let make it mutable, ...

type(of: johnDetail)  // to check datatype



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


// Dictionaries:


var person = [
    "name": "John",
    "fatherName": "Paul Edison",
    "email": "john@example.com",
    "address": "Street 06, IST, San Fransico, CA, USA"
]

person["name"]  // Accessing data from dictionary
person["name"] = "John Doe" // Modify the name of the person
person["age"] = "30" // Add the age of the person