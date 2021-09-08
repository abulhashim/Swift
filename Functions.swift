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
    print("Hello, "\(name)")
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