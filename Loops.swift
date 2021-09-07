// For in loop:

/* for loop: it will loop over arrays and ranges, and each time
 the loop goes around it will pull out one item and assign to a constant. */

for index in 1...3 {
    print(index)
}

let num = 1...2

for index in num {
    print("Hello!")
}

// iterete over an array:
let colors = ["Red", "Green", "Blue", "Brown"]
for color in colors {
    print(color)
}
// iterete over a dictionary:
let numOfLegs = ["Spider": 8, "Ant": 6, "Cat": 4]
for (animalName, legCount) in numOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

/* If you don’t use the constant that for loops give you, you should use
an underscore instead so that Swift doesn’t create needless values: */

for _ in 1...3 {
    print("UnderScore")
}


for i in 1...5 {
    print("\(i) times 5 is \(i * 5)")
}

let base = 3
let power = 10
let answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power)is \(answer)")

/* In some situations you might not want to use closed ranges which
include both end points, Use Half-open range Operator: */

let minutes = 60
for tickMark in 0..<minutes {
    // render the tickMark each minute (60 times)
}

/* Some users might want fewer tick marks in their UI. They could prefer
one mark every minutes instead.Use stride(from:to:by:) function to skip
the unwanted marks */

let minuteInterval = 50
for tickMark in stride(from: 0, to: minutes, by:minuteInterval) {
    // render the tickMark every 5 minutes (0,5,10 ...)
}


/* Closed ranges are also available, by using stride(from:through:to:) */
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tickMark every 3 hours.
}


// While Loop:

/*
A second way of writing loops is using while: give it a condition to
check,and its loop code will go around and around until the condition fails.
*/

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or Not, Here i Come")



// Repeat loop:

/*
The third way of writing loops is not commonly used, it’s identical to a
while loop except the condition to check comes at the end.
*/

repeat {
    print(number)
    number += 1
} while number <= 20
print("Ready or Not, Here i Come")

/*
Because the condition comes at the end of the repeat loop the code
inside the loop will always be executed at least once, whereas
while loops check their condition before their first run.
*/

while false {
    print("This is false")
    // Xcode Warn us this code could not be executed.
} 

repeat {
    print("This is false")
} while false // Runs perfectly


// Exiting the loop:

/*
You can exit a loop at any time using the break keyword. To try this
out, let’s start with a regular while loop that counts down for a
rocket launch:
*/

var countDown = 10

while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("Blast off!")

/*
In this case, the astronaut in command gets bored part-way through
the countdown and decides to skip the remainder and launch straight away:
*/

while countDown >= 0 {
    print(countDown)
    if countDown == 5 {
        print("I'm bored. Let's go now!")
        break
    }
}

print("Blast off!")

/*
With that change, as soon as countDown reaches 4 the astronaut’s
message will be printed, and the rest of the loop gets skipped.
*/


// Nested Loop and Exiting Multiple Loops:

for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j): is \(product)")
    }
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j): is \(product)")

        if product == 50 {
            print("Enough")
            break outerLoop
        }
    }
}

/*
As you’ve seen, the break keyword exits a loop. But if you just
want to skip the current item and continue on to the next one,
you should use continue instead.
*/

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}


// infinite Loop:

/*
It’s common to use while loops to make infinite loops: loops that
either have no end or only end when you’re ready. All apps on your
iPhone use infinite loops, because they start running, then continually
watch for events until you choose to quit them.

To make an infinite loop, just use true as your condition.
true is always true, so the loop will repeat forever.
*/

var counter = 0
while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}

