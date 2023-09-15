import Cocoa

// https://www.hackingwithswift.com/100/swiftui/10
// MARK: How to create your own structs
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let intoTheBlackLight = Album(title: "Into The Black Light", artist: "Ghost Brigade", year: 2018)

red.printSummary()
intoTheBlackLight.printSummary()

struct Employee {
    // Properties
    let name: String
    var vacationRemaining: Int

    // Methods
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Vacation remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enought days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 7)
print("Vacation remaining: \(archer.vacationRemaining)")

// MARK: How to compute property values dynamically
struct EmployeeTwo {
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken: Int = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var jessy = EmployeeTwo(name: "Jessy Smith")
jessy.vacationTaken += 4
jessy.vacationRemaining = 5
print(jessy.vacationAllocated)

// MARK: How to take action when a property changes
struct Game {
    var score: Int = 0 {
        didSet {
            print("[Old Score]: \(oldValue) :: [New Score]: \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 15

print("---------------------------------------------")

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)\n")
            print("New value will be: \(newValue)\n")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.\n")
            print("Old value was: \(oldValue)\n")
        }
    }
}

var app = App()
app.contacts.append("Contact 1")
app.contacts.append("Contact 2")
app.contacts.append("Contact 3")

// MARK: How to create custom initializers
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print("PlayerNumber: \(player.number)")
