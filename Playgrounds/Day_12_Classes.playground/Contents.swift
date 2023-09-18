import Cocoa

// https://www.hackingwithswift.com/100/swiftui/12
// MARK: How to create your own classes
class Game {
    var score: Int = 0 {
        didSet {
            print("Score is now: \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// MARK: How to make one class inherit from another
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("[OVERRIDE] I work \(hours) hours a day.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meeting for \(hours) hours.")
    }
}

let jim = Developer(hours: 8)
let tim = Manager(hours: 10)

jim.work()
tim.work()

let sarah = Developer(hours: 8)
sarah.printSummary()

// MARK: How to add initializers for classes
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let car = Car(isElectric: true, isConvertible: false)

// MARK: How to copy classes
// Class are reference type.
class User {
    var username: String = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()

user2.username = "TEST"
print("user1 name: \(user1.username)")
print("user2 name: \(user2.username)")

// MARK: How to create a deinitializer for a class
class Phone {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Phone \(name): DEINIT")
    }
}

for i in 1...3 {
    let phone = Phone(name: "Phone_\(i)")
    print("Phone \(phone.name): In loop.")
}

// MARK: How to work with variables inside classes
class Item {
    var name = "Item"
}

let item = Item()
item.name = "New Item"
