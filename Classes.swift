// Classes:

/* Classes are similar to structs in that they allow you
 to create new types with properties and methods, */

/*
 The first difference between classes and structs is that
 classes never come with a memberwise initializer. This means
 if you have properties in your class, you must always create
 your own initializer.
 */ 

class Horse {
    var name: String
    var breed: String
    
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

var khail = Horse(name: "Khail", breed: "Poodle")

// Classe Inheritance:

/*
 The second difference between classes and structs is that you
 can create a class based on an existing class – it inherits all
 the properties and methods of the original class, and can add its
 own on top.
 
 This is called class inheritance or subclassing, the class you
 inherit from is called the “parent” or “super” class, and the new
 class is called the “child” class.
 */

class Poodle0: Horse {
    // It will inherit the same properties and initializer
    // as Horse by default,
}


// However, we can also give Poodle its own initializer.

class Poodle2: Horse {
    init (name: String) {
        super.init (name: name, breed: "Poodle")
    }
}

/* For safety reasons, Swift always makes you call super.init()
 from child classes – just in case the parent class does some
 important work when it’s created. */

// OverRiding Methods:

/* Child classes can replace parent methods with their own
 implementations – a process known as overriding. */

class Dog {
    func makeNoise() {
        print("Woof!")
    }
}


/*
 Swift requires us to use override func rather than just func
 when overriding a method – it stops you from overriding a
 method by accident, and you’ll get an error if you try to
 override something that doesn’t exist on the parent class:
 */


class Poodle: Dog {
    override func makeNoise() {
        print("yip!")
    }
}

let poppy = Poodle()
poppy.makeNoise()

// Final Class:

/*
 Although class inheritance is very useful – and in fact large
 parts of Apple’s platforms require you to use it – sometimes you
 want to disallow other developers from building their own class
 based on yours.
 
 Swift gives us a final keyword just for this purpose: when you
 declare a class as being final, no other class can inherit from
 it. This means they can’t override your methods in order to change
 your behavior – they need to use your class the way it was written.
 
 To make a class final just put the final keyword before it,like this:
 */

final class Horse2 {
    var name: String
    var breed: String
    
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Copying Methods:

/* The third difference between classes and structs is how they
 are copied. When you copy a struct, both the original and the
 copy are different things – changing one won’t change the other.
 When you copy a class, both the original and the copy point to
 the same thing, so changing one does change the other. */

class Singer0 {
    var name = "Chris"
}

var singer = Singer0()
print(singer.name)

/* Now let’s create a second variable from the first one
 and change its name: */

var singerCopy = singer
singerCopy.name = "Justin"

/* Because of the way classes work, both singer and singerCopy
 point to the same object in memory, so when we print the singer
 name again we’ll see “Justin Bieber”: */
print(singer.name)

/* On the other hand, if Singer were a struct then we
 would get “Taylor Swift” printed a second time, */


// Deinitializers:

/* The fourth difference between classes and structs is that
 classes can have deinitializers – code that gets run when an
 instance of a class is destroyed. */

class Person {
    var name = "John Smith"
    
    init () {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    /* Deinitializer: This will be called when
     the Person instance is being destroyed: */ 
    
    deinit {
        print("\(name) is no more!")
    }
}

/* We’re going to create a few instances of the Person class
 inside a loop, because each time the loop goes around a new
 person will be created then destroyed: */

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


// Mutability:

/*
 The final difference between classes and structs is the way
 they deal with constants. If you have a constant struct with
 a variable property, that property can’t be changed because
 the struct itself is constant.
 
 However, if you have a constant class with a variable property,
 that property can be changed. Because of this, classes don’t
 need the 'mutating' keyword with methods that change properties;
 that’s only needed with structs.
 
 This difference means you can change any variable property on
 a class even when the class is created as a constant – this is
 perfectly valid code:
 */

class Singer1 {
    var name = "Tylor Swift"
}

let tylor = Singer1()
tylor.name = "David"

/* If you want to stop that from happening you need to make
 the property constant: */

class Singer {
    let name = "Tylor Swift"
}
