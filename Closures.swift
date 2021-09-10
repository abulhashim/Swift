// Closures:

/* Swift lets us use functions just like any other type such as
 strings and integers. This means you can create a function and
 assign it to a variable, call that function using that variable,
 and even pass that function into other functions as parameters.
 
 Functions used in this way are called closures, and although They
 work like functions they are written a little differently. */

let driving = {
    print("I'm driving a car at now!")
}

/* That effectively creates a function without a name, and assigns
 that function to driving. You can now call driving() as if it were
 a regular function, like this: */

driving()

//  Accepting Parameters:
/*
 When you create closures,they don’t have a name or space to write
 any parameters.That doesn’t mean they can’t accept parameters,just
 that they do so in a different way:they are listed inside the ().
 
 To make a closure accept parameters, list them inside parentheses
 just after the opening brace, then write in so that Swift knows
 the main body of the closure is starting.
 */

let Driving = { (place: String) in
    print("I'm going to \(place) in my car")
}

/*
 One of the differences between functions and closures is that you
 don’t use parameter labels when running closures. So, to call
 driving() now we’d write this:
 */

Driving("London")


// Returning Values:
/*
 Closures can also return values, and they are written similarly to
 parameters: you write them inside your closure, directly before the
 in keyword, so we need to use -> String before in, then use return
 just like a normal function:
 */

let drive = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drive("California")

// Closures as Parameters:

/*
 Closures can be used just like strings and integers, you can pass
 them into functions.
 
 If we wanted to pass that closure into a function so it can be run
 inside that function, we would specify the parameter type as
 () -> Void, That means “accepts no parameters, and returns Void”,
 Swift’s way of saying “nothing”.
 */

func travel(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived")
}

travel(action: driving)  // driving is a closure,



// Trailing Closure Syntax:
/*
 If the last parameter to a function is a closure, Swift lets you
 use special syntax called trailing closure syntax. Rather than
 pass in your closure as a parameter, you pass it directly after
 the function inside braces.
 */

/* Because our travel() function's last parameter is a closure,
 we can call travel() using trailing closure syntax like this: */

travel() {
    print("I am driving a car.")
}

/* In fact, because there aren’t any other parameters, we can
 eliminate the parentheses entirely: */

travel {
    print("I'm driving in my car")
}



// Using closures as parameters when they accept parameters:
/*
 A closure you pass into a function can also accept its own parameters.
 
 We’ve been using () -> Void to mean “accepts no parameters and returns
 nothing”, but you can go ahead and fill the () with the types of any
 parameters that your closure should accept.
 */

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

/* Now when we call travel() using trailing closure syntax, our
 closure code is required to accept a string, */

travel { (place: String) in
    print("I'm goint to \(place)")
}


// Using closures as parameters when they return values:
/*
 We’ve been using () -> Void to mean “accepts no parameters and
 returns nothing”, but you can replace that Void with any type of
 data to force the closure to return a value.
 */

func travel(action: (String) -> String ) {
    print("I'm getting ready to go.")
    let description = action("Ohio")
    print(description)
    print("I arrived!")
}

travel {(place: String) -> String in
    return "I'm going to \(place) in my car"
}


// Shorthand Parameter Names:

/* We just made a travel() function. It accepts one parameter, which
 is a closure that itself accepts one parameter and returns a string.
 That closure is then run between two calls to print(). */

/* Swift knows the parameter to that closure must be a string,
 so we can remove it: */

travel {place -> String in
    return "I'm going to \(place) in my car"
}

/* It also knows the closure must return a string,
 so we can remove that: */

travel {place in
    return "I'm going to \(place) in my car"
}

/* Swift lets us remove the return keyword too: */

travel {place in
    "I'm going to \(place) in my car"
}


/* Swift has a shorthand syntax that lets you go even shorter.
 Rather than writing place in we can let Swift provide automatic
 names for the closure’s parameters. These are named with a dollar
 sign, then a number counting from 0. */

travel {
    "I'm going to \($0) in my car"
}


// Closure with Multiple parameters:

func travel(action: (String, Int) -> (String)) {
    print("I'm getting ready to go")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour.'"
}


// Returning closures from functions:
/*
 In the same way that you can pass a closure to a function, you
 can get closures returned from a function too.
 
 The syntax for this is a bit confusing a first, because it uses
 -> twice: once to specify your function’s return value, and a
 second time to specify your closure’s return value.
 */

func travelClosure() -> (String) -> Void {
    return {
        print( "I'm going to \($0) in my car")
    }
}

// We can now call travel() to get back that closure,
// then call it as a function:
let result = travelClosure()
result("Chicago")

// It’s technically allowable – although really not recommended!
// to call the return value from travel() directly:

let result2 = travel()("Chicago")


// Capturing values:
/*
 If you use any external values inside your closure, Swift captures
 them – stores them alongside the closure, so they can be modified
 even if they don’t exist any more.
 
 Closure capturing happens if we create values in travel() that get
 used inside the closure. For example, we might want to track how
 often the returned closure is called:
 */

func travel() -> (String) -> Void {
    var counter = 1
    
    return {
        print("\(counter). I'm going to \($0)")
    }
    counter += 1
}

/* Even though that counter variable was created inside travel(),
 it gets captured by the closure so it will still remain alive for
 that closure.
 
 So, if we call result(" ") multiple times, the counter will
 go up and up: */

result("Ohio")
result("Washington")
result("Ok-by-the-see")