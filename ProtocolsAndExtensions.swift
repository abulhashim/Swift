// Protocols:
/*
 Protocols are a way of describing what properties and
 methods something must have. You then tell Swift which
 types use that protocol – a process known as adopting
 or conforming to a protocol.
 */

protocol identifiable {
    var id: String { get set }
}

/*
 We can’t create instances of that protocol it’s a
 description of what we want, rather than something we
 can create and use directly. But we can create a struct
 that conforms to it:
 */

struct user: identifiable {
    var id: String
}

/*
 Finally, we’ll write a displayID() function that accepts
 any Identifiable object:
 */

func displayID(thing: identifiable) {
    print("My user id is \(thing.id)")
}

// Protocol inheritance:

/*
 One protocol can inherit from another in a process known
 as protocol inheritance. Unlike with classes, you can
 inherit from multiple protocols at the same time before
 you add your own customizations on top.
 */

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

/* We can now create a single Employee protocol that brings
 them together in one protocol. We don’t need to add anything
 on top, so we’ll just write open and close braces: */

protocol employee: Payable, NeedsTraining, HasVacation { }


// Extensions:
/*
 Extensions allow you to add methods to existing types, to
 make them do things they weren’t originally designed to do.
 
 For example, we could add an extension to the Int type so
 that it has a squared() method that returns the current
 number multiplied by itself:
*/

extension Int {
    func Squared() -> Int {
        return self * self
    }
}

/* To try that out, just create an integer and you’ll see
 it now has a squared() method. */

let number = 6
print(number.Squared())

/* Swift doesn’t let you add stored properties in extensions,
 so you must use computed properties instead. */

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let num = 8
print(num.isEven)

// Protocol Extensions:
/*
 Protocols let you describe what methods something should have,
 but don’t provide the code inside. Extensions let you provide
 the code inside your methods, but only affect one data type
 you can’t add the method to lots of types at the same time.
 
 Protocol extensions solve both those problems: they are like
 regular extensions, except rather than extending a specific
 type like Int you extend a whole protocol so that all
 conforming types get your changes.
 */

let pythons = ["Eric", "Graham", "John", "Michael", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

/*
 Swift’s arrays and sets both conform to a protocol called
 Collection, so we can write an extension to that protocol to
 add a summarize() method to print the collection neatly.
 */

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        for name in self {
            print(name)
        }
    }
}

// Both Array and Set will now have that method,

print(pythons.summarize())
print(beatles.summarize())


// Protocol-Oriented Programming:
/*
 Protocol extensions can provide default implementations for
 our own protocol methods. This makes it easy for types to
 conform to a protocol, and allows a technique called POP,
 “protocol-oriented programming” – crafting your code around
 protocols and protocol extensions.
 */

protocol identifier {
    var id: String { get set }
    func identify()
}

/* We could make every conforming type write their own identify()
 method, but protocol extensions allow us to provide a default: */

extension identifier {
    func identify() {
        print("My ID is \(id)")
    }
}

struct User: identifier {
    var id: String
}

/* Now when we create a type that conforms to Identifiable
it gets identify() automatically: */

let twoStraws = User(id: "twostraws")
twoStraws.identify()
