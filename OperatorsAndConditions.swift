// Arithmetic Operators:
var num1 = 10
var num2 = 13

print(num1 + num2)  // Addition
print(num1 - num2)  // Subtraction
print(num1 * num2)  // Multiplication
print(num1 / num2)  // Division


// Remainder Operator:

/*
 Swift has an operator allows us to calculate the remainder after
 a division. This is sometimes called modulo.
 */


var weeks = 465 / 7
print("There are \(weeks) weeks untill the event")
// return 66 weeks,

var weeks1: Double = 465 / 7
print("There are \(weeks) weeks untill the event")
// return 66.4285... weeks,

var weeks2 = 465 / 7
let days = 465 % 7 // days
print("There are \(weeks) weeks and \(days) days untill the event")


/*
 Tip: If your goal is to ask “does this number divide equally into
 some other number?” then Swift has an easier approach:
 */

let number = 465
let isMultiple = number.isMultiple(of: 7)


// String Concatenation:

var one = "Hello,"
var two = "World!"
var three = one + two
print(three)


// compound assignment operators:
var empty = 0
empty += 5 // score = score + 5
empty -= 5 // score = score - 5

// compare many types of data:

let firstName = "John"
let secondName = "Doe"

let firstAge = 40
let secondAge = 20

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)


/*
 Behind the scenes, Swift implements this in a remarkably
 clever way that actually allows it to compare a wide
 variety of things. For example, Swift has a special type
 for storing dates called Date, and you can compare dates
 using the same operators: someDate < someOtherDate.
 */

enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)
/*
 That will print “true”, because Swift small comes before
 large in the enum case list.
 */

/*----------------------------------------------------------------------*/


// Conditions

let score = 9001

if score > 9000 {
    print("It's over 9000!")
} else if score == 9000 {
    print("It's exactly 9000!")
} else {
    print("It's not over 9000!'")
}

// Checking mutiple conditions:

// Swift gives us && and || for checking multiple conditions,

var isOwner = true
var isAdmin = true
var isEditingEnabled = false

if isOwner == true || isAdmin == true {
    print("You can delete this Post")
}

if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}
/*
 you should almost certainly use parentheses to make the result clear.
 */


// Ternary operator:

/*
 The ternary operator lets us choose from one of two results based
 on a condition, and does so in a really concise way:
 */

let isAuthenticated = true
print(isAuthenticated ? "Welcome" : "Who are you?")

// Alternate:

if isAuthenticated {
    print("Welcome")
} else {
    print("Who are you?")
}

// Switch Case:

// ................................



// Range operators:

/*
 ..< is the half-open range that specifies “up to but excluding”
 and ... is the closed range operator that specifies “up to and
 including”. To make the distinction easier when talking, Swift
 regularly uses very specific language: “1 to 5” means 1, 2, 3,
 and 4, but “1 through 5” means 1, 2, 3, 4, and 5. 
 */

let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[0])
print(names[1...3])
/*
 That carries a small risk, though: if our array didn’t contain at
 least four items then 1...3 would fail. Fortunately, we can use a
 one-sided range to say “give me 1 to the end of the array”, like this:
 */
print(names[1...])

// .......

/*----------------------------------------------------------------------*/

