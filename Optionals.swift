// Handling Missing Data:
/*
We’ve used types such as Int to hold values like 5.
But if you wanted to store an age property for users,
what would you do if you didn’t know someone’s age?

Swift’s solution is called optionals, and you can make
optionals out of any type. An optional integer might
have a number like 0 or 40, but it might have no value
at all it might literally be missing,which is nil in Swift.

To make a type optional, add a question mark after it.
For example, we can make an optional integer like this:
*/

var age: Int? = nil
/* That doesn’t hold any number – it holds nothing. But if
we later learn that age, we can use it: */
age = 19

// Unwrapping Optionals:
/*
Optional strings might contain a string like “Hello” or they
might be nil – nothing at all.

Because of this, trying to read name.count is unsafe and Swift
won’t allow it. Instead, we must look inside the optional and
see what’s there – a process known as unwrapping.

A common way of unwrapping optionals is with if let syntax, which
unwraps with a condition. If there was a value inside the optional
then you can use it, but if there wasn’t the condition fails.
*/

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped) Letters")
} else {
    print("Missing Name")
    
}