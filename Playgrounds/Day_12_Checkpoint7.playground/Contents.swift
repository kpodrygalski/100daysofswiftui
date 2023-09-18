import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-7

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {
        print("Speaking...")
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof! Woof!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    override func speak() {
        print("Meow!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corgi says: Woooof!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle says: Wooof woof wooof!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian cat says: Meeeeeow!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion says: Roar!")
    }
}
