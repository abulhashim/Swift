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
