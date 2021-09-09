// Functions:
/*
 Functions let us re-use code, which means we can write a
 function to do something interesting then run that function
 from lots of places. Repeating code is generally a bad idea,
 and functions help us avoid doing that.
 */

func printHelp() {
    let message = """
                Welcome to MyApp!

    Run this app inside a directory of images and
    MyApp will resize them all into thumbnails.
"""
    print(message)
}

printHelp() // Function Calling,

// Prameters:
/*
 Functions become more powerful when they can be customized
 each time you run them. Swift lets you send values to a
 function that can then be used inside the function to change
 the way it behaves. 
 */

func square(number: Int) {
    print(number * number) 
}

/* To make your own functions accept parameters, give each
 parameter a name, then a colon, then tell Swift the type of
 data it must be. All this goes inside the parentheses after
 your function name.
 
 That tells Swift we expect to receive an Int, and it should
 be called number. This name is used both inside the function
 when you want to refer to the parameter, but also when you run
 the function, */

square(number: 3)

// Values sent into functions this way are called parameters.


// Returning Values:

/*
 As well as receiving data, functions can also send back data.
 To do this, write a dash then a right angle bracket after your
 function’s parameter list, then tell Swift what kind of data
 will be returned.
 
 Inside your function, you use the return keyword to send a value
 back if you have one. Your function then immediately exits, sending
 back that value – no other code from that function will be run.
 */

func Square(num: Int) -> Int {
    return num * num
}

Square(num: 5)


// Parameter Labels:

/*
 Swift lets us provide two names for each parameter: one to be
 used externally when calling the function, and one to be used
 internally inside the function. This is as simple as writing
 two names, separated by a space.
 */

func sayHello(to name: String) {
    print("Hello,\(name)")
}

sayHello(to: "Saim")

// Omitting Parameter Lables:

/*
 You might have noticed that we don’t actually send any
 parameter names when we call print() – we say print("Hello")
 rather than print(message: "Hello").
 
 You can get this same behavior in your own functions by using
 an underscore, _, for your external parameter name, like this:
 */

func greet(_ person: String) {
    print("Hello \(person)")
}

greet("Sarim")

/*
 This can make some code more natural to read, but generally it’s
 better to give your parameters external names to avoid confusion. 
 */

// Default Parameters:
/* You can give your own parameters a default value just by writing
 an = after its type followed by the default you want to give it. */

func greetNicely(_ person: String, nicely: Bool = true) {
    if nicely == false {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greetNicely("Haris")
// Can be call by two ways,
greetNicely("Harris", nicely: false)


// Variadic functions:

/* Some functions are variadic, which is a fancy way of saying they
 accept any number of parameters of the same type. */

// You can make any parameter variadic by writing ... after its type.

func Squares(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

Squares(numbers: 2,4,6,8)


// Writing Throwing Functions:

/*
 Sometimes functions fail because they have bad input, or because
 something went wrong internally. Swift lets us throw errors from
 functions by marking them as throws before their return type, then
 using the throw keyword when something goes wrong.
 
 First we need to define an enum that describes the errors we can
 throw. These must always be based on Swift’s existing Error type.
 */

enum PasswordError: Error {
    case obvious
}

func passwordChecker(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}


// Running Throwing Functions:

/*
 Swift doesn’t like errors to happen when your program runs, which
 means it won’t let you run an error-throwing function by accident.
 
 Instead, you need to call these functions using three new keywords:
 do starts a section of code that might cause problems, try is used
 before every function that might throw an error, and catch lets you
 handle errors gracefully.
 
 If any errors are thrown inside the do block, execution immediately
 jumps to the catch block.
 */

do {
    try passwordChecker("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

/* When that code runs, “You can’t use that password” is printed,
 but “That password is good” won’t be – that code will never be
 reached, because the error is thrown. */

// inout Parametrs:

/*
 All parameters passed into a Swift function are constants,so you 
 can’t change them. If you want, you can pass in one or more
 parameters as inout, which means they can be changed inside your
 function, and those changes reflect in the original value outside
 the function.
 */

func doubleInPlace(number: inout Int) {
    number *= 2
}

/*
 To use that, you first need to make a variable integer – you can’t
 use constant integers with inout, because they might be changed. You
 also need to pass the parameter to doubleInPlace using an ampersand,
 &, before its name, which is an explicit recognition that you’re aware
 it is being used as inout.
 */

var myNum = 10
doubleInPlace(number: &myNum)
