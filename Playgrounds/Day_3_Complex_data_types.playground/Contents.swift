import Cocoa

// https://www.hackingwithswift.com/100/swiftui/3
// MARK: How to store ordered data in arrays
var beatles = ["John", "Paul", "George", "Ringo"]
beatles.append("Abby")

let numbers = [4, 8, 15, 16, 23, 42]
print(numbers[2])

var temperatures = [25.3, 28.2, 26.4]
print(temperatures[2])

var scores = Array<Int>()
scores.append(100)
scores.append(200)
scores.append(75)
print(scores[0])

var names = [String]()
names.append("Joe")
names.append("James")

print(names.contains("Joe"))
print(names.count)

names.remove(at: 1)
print(names)

let cities = ["London", "Tokyo", "Rome", "New York"]
print(cities.sorted())
print(cities.reversed())

// MARK: How to store and find data in dictionaries
let employee = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

let hasGraduated = [
    "Eric": true,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

print(heights["LeBron James", default: 0])

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

// MARK: How to use sets for fast data lookup
let actors = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])

print(actors)

var locations = Set<String>()
locations.insert("Oslo")
locations.insert("New York")
locations.insert("Los Angeles")
locations.insert("Berlin")
print(locations)

// MARK: How to create and use enums
//enum Weekday {
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//}

// Shorter way
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = Weekday.friday

