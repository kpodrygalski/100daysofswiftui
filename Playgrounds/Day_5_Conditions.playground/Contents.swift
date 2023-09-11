import Cocoa

// https://www.hackingwithswift.com/100/swiftui/5
// MARK: How to check a condition is true or false

let score: Int      = 85
let speed: Int      = 88
let percentage: Int = 85
let age: Int        = 18

if score > 80 {
    print("Great job!")
}

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You are eligible to vote.")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName) ")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"
if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"
if name != "Anonymous" {
    print("Hello, \(name)")
}

var username = "taylorswift13"

// Do NOT use someString.count == 0 to check if string is empty!

if username.isEmpty {
    username = "Anonymous"
}

print("Welcome, \(username)")

// MARK: How to check multiple conditions
// (&& - AND) / (|| - OR) / (! - NOT)
let a = false
let b = false

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = false

if age >= 18 || hasParentalConsent {
    print("You can buy the game!")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport: TransportOption = .airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now.")
}

// MARK: How to use switch statements to check multiple conditions
enum Forecast {
    case sun, rain, wind, snow, storm
}

let forecast: Forecast = .snow

switch(forecast) {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled.")
case .storm:
    print("Stay at home!")
}

let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partidge in a pear tree")
}

// fallthrough

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partidge in a pear tree")
}

// MARK: How to use the ternary conditional operator for quick tests
let myAge = 27

// what ? true : false
let canVote = myAge >= 18 ? true : false
print(canVote)

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = Set(["Gaja", "Elise", "Kay", "Malia"])
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"

enum Theme {
    case light, dark, system
}

let theme: Theme = .dark
let background = theme == .dark ? "black" : "white"
print(background)
