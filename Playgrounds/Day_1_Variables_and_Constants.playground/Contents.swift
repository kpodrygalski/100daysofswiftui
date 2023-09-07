import Cocoa

// Dzień 1: https://www.hackingwithswift.com/100/swiftui/1
// MARK: How to create variables and constants

var greeting = "Hello, playground"

// Zmienne (Variables) - var.
// Utworzenie nowej zmiennej o nazwie name, która przechowuje wartość Ted.
var name = "Ted"

// Redeklaracja wartości zmiennej name.
name = "Rebecca"
name = "Keeley"


// Stałe (Constants) - let.
// Jeśli to możliwe, preferuje się używanie stałych.
let character = "Daphne"

// Błąd - nie możemy zmienić stałej.
//character = "Elise"

var playerName = "John"
print(playerName)

playerName = "James"
print(playerName)

playerName = "Tom"
print(playerName)

// MARK: How to create strings
let actor = "Keanu Reeves"
let filename = "hidden.txt"
let result = "🍃 Power of Swift 🪽"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// Tworzenie multi-line string.
let movie = """
A day in
the life of an
Apple enginner
"""

let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".txt"))

// MARK: How to store whole numbers
// Utworzenie stałej typu Int (liczba całkowita)
let score = 10

// Swift ignoruje _ w liczbach. Dzięki temu nasza liczba jest bardziej czytelna.
let reallyBig = 1_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2

var counter = 10
counter += 5 // Można zapisać to również jako: counter = counter + 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
print(520.isMultiple(of: 2))

// MARK: How to store decimal numbers
let someNumber = 0.1 + 0.2
print(someNumber)

let a = 1
let b = 2.0
let c = Double(a) + b

let double1 = 3.1
let dobule2 = 3131.3131
let double3 = 3.0
let int1 = 3

var rating = 5.0
rating *= 2

