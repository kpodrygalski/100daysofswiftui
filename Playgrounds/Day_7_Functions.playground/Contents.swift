import Cocoa

// https://www.hackingwithswift.com/100/swiftui/7

// MARK: How to reuse code with functions
func showWelcomeMessage() {
    print("Welcome!")
    print("This is my Swift / SwiftUI Bootcamp course.")
    print("Have a nice day!")
}

showWelcomeMessage()

func greetings(name: String) {
    print("Hello, how are you \(name)?")
}

greetings(name: "James")

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Elise")

// MARK: How to return values from functions
func rollDice() -> Int {
    Int.random(in: 1...6)
}

let roll = rollDice()
print("You roll: \(roll)")

func areLettersIdentical(of stringOne: String, and stringTwo: String) -> Bool {
    stringOne.sorted() == stringTwo.sorted()
}

let result = areLettersIdentical(of: "TEST", and: "TEST")
print(result)

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(pow(a, 2) + pow(b, 2))
}

let c = pythagoras(a: 3, b: 4)
print("C: \(c)")

// MARK: How to return multiple values from functions
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

let (firstName, lastName) = getUser()
print("FirstName: \(firstName)\nLastName: \(lastName)")

func getAddress() -> (String, String, Int) {
    ("New York", "Some Street", 27)
}

let address = getAddress()
print("Address: \(address.0) \(address.1) \(address.2)")

// MARK: How to customize parameter labels
func rollDiceV2(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    return rolls
}

let myRolls = rollDiceV2(sides: 6, count: 12)
print(myRolls)

let lyric = "I see a red door and I want it painted black."
print(lyric.hasPrefix("I see"))

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let text = "HELLO, WORLD"
let isUppercased = isUppercase(text)

let number = Int.random(in: 1...20)
func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(for: number)
