// Structs:

/* Structs let us create our own data types out of
 several small types. */

struct sport {
    var name: String
}
/* That defines the type, so now we can create and use
 an instance of it, */


var play = sport(name: "Cricket")
print(play.name)

/* We made both name and tennis variable, so we can change
 them just like regular variables: */

play.name = "Tennis"

// Computed properties:
/*
 We just created a Sport struct, That has a name property that
 stores a String. These are called stored properties, because
 Swift has a different kind of property called computed property
 a property that runs code to figure out its value.
 
 We’re going to add another stored property to the Sport struct,
 then a computed property
 */

struct Sport {
    var name: String
    var isOlympicSport: Bool
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an OlympicSport"
        } else {
            return "\(name) is not an OlympicSport"
        }
    }
}

/* As you can see, olympicStatus looks like a regular String, but
 it returns different values depending on the other properties. */

let chessBoxing = Sport(name: "chessBoxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


// Property observers:
/* Property observers let you run code before or after
 any property changes. */

struct Progress {
    var task: String
    var amount: Int
}

var progress = Progress(task: "Loading Data", amount: 0)
progress.amount = 70
progress.amount = 85
progress.amount = 99

/* What we want to happen is for Swift to print a message every
 time amount changes, and we can use a didSet property observer
 for that. This will run some code every time amount changes: */

struct Progress2 {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% completed")
        }
    }
}

// Methods:

/* Structs can have functions inside them, and those functions
 can use the properties of the struct as they need to. Functions
 inside structs are called methods, but they still use the same
 func keyword. */

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

/* That method belongs to the struct, so we call it on instances
 of the struct like this: */

let london = City(population: 9_000_000)
print(london.collectTaxes())


// Mutating Methods:
/*
 If a struct has a variable property but the instance of the
 struct was created as a constant, that property can’t be
 changed – the struct is constant, so all its properties are
 also constant regardless of how they were created.
 
 The problem is that when you create the struct Swift has no
 idea whether you will use it with constants or variables,
 so by default it takes the safe approach: Swift won’t let you
 write methods that change properties unless you specifically
 request it.
 
 When you want to change a property inside a method, you need
 to mark it using the mutating keyword, like this:
 */

struct Person1 {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

/* Because it changes the property, Swift will only allow that
 method to be called on Person instances that are variables: */

var person = Person1(name: "Edison")
person.makeAnonymous()


// Properties and Methods of String:

/* We’ve used lots of strings so far, and it turns out they are
 structs – they have their own methods and properties we can
 use to query and manipulate the string. */

let string = "Hello, world!" // test String

/* You can read the number of characters in a string using
 its count property: */

print(string.count)

/* They have a hasPrefix() method that returns true if the
 string starts with specific letters: */

print(string.hasPrefix("Do"))

// You can uppercase a string by calling its uppercased() method:

print(string.uppercased())

/* And you can even have Swift sort the letters of the string
 into an array: */

print(string.sorted())

/* Strings have lots more properties and methods – try typing
 string. to bring up Xcode’s code completion options. */


// Properties and methods of arrays:

/* Arrays are also structs, which means they too have their
 own methods and properties we can use to query and manipulate
 the array. */

var toys = ["Woody"]

/* You can read the number of items in an array using its
 count property: */

print(toys.count)

// If you want to add a new item, use the append() method like this:

toys.append("Buzz")

/* You can locate any item inside an array using its firstIndex()
 method, like this: */

toys.firstIndex(of: "Buzz")
// That will return 1 because arrays count from 0.

// Swift sort the items of the array alphabetically:

print(toys.sorted())

// Finally, if you want to remove an item, use the remove(),

toys.remove(at: 0)

// Arrays have lots more properties and methods – try typing toys.


// Initializers:

/*
 Initializers are special methods that provide different ways to
 create your struct. All structs come with one by default, called
 their memberwise initializer – this asks you to provide a value
 for each property when you create the struct.
 */

struct User1 {
    var userName: String
}

// When we create one of those structs, we must provide a username:
var user1 = User1(userName: "twostraws")


// We can provide our own initializer to replace the default one.

struct User {
    var userName: String
    
    init() {
        userName = "Anonymous"
        print("Creating a new user!")
    }
}

/*
 You don’t write func before initializers, but you do need to make
 sure all properties have a value before the initializer ends.
 
 Now our initializer accepts no parameters, we need to create the
 struct like this:
 */
var user = User()
user.userName = "twostraws"


// Referring to the current instance:

/*
 Inside methods you get a special constant called self, which
 points to whatever instance of the struct is currently being
 used. This self value is particularly useful when you create
 initializers that have the same parameter names as your property.
 
 For example, if you create a Person struct with a name property,
 then tried to write an initializer that accepted a name parameter
 self helps you distinguish between the property and the parameter
 self.name refers to the property,whereas name refers to parameter.
 */

struct Person2 {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// Lazy Properties:

/* As a performance optimization, Swift lets you create some
 properties only when they are needed. */

struct FamilyTree {
    init() {
        print("Creating a Family Tree")
    }
}


/* We might use that FamilyTree struct as a property inside a
 Person struct, like this: */

struct Person {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed1 = Person(name: "Ed")

/* But what if we didn’t always need the family tree for a
 particular person? If we add the lazy keyword to the familyTree
 property, then Swift will only create the FamilyTree struct when
 it’s first accessed: */

/* So, if you want to see the “Creating family tree!” message,
 you need to access the property at least once: */

print(ed1.familyTree)


// Static Properties and Methods:

/*
 All the properties and methods we’ve created so far have belonged
 to individual instances of structs, which means that if we had a
 Student struct we could create several student instances each with
 their own properties and methods:
 */

struct Student0 {
    var name : String
    
    init(name: String) {
        self.name = name
    }
}

/* You can also ask Swift to share specific properties and methods
 across all instances of the struct by declaring them as static. */ //

struct Student {
    static var classSize = 0
    var name : String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

/* Because the classSize property belongs to the struct itself
 rather than instances of the struct, we need to read it using
 Student.classSize: */

print(Student.classSize)

// Access Control:

/*
 Access control lets you restrict which code can use properties
 and methods. This is important because you might want to stop
 people reading a property directly.
 
 Once that person has been created, we can make their id be private
 so you can’t read it from outside the struct – trying to write
 ed.id simply won’t work.
 
 Just use the private keyword, like this:
 */


struct PersonID1 {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
}

// Now only methods inside Person can read the id property:

struct PersonID {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func getId() -> String {
        return "My social security code is \(id)"
    }
}

let ed2 = PersonID(id: "123765")

/* Another common option is public, which lets all other code use
 the property or method. */