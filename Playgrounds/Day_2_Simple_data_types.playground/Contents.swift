import Cocoa

// https://www.hackingwithswift.com/100/swiftui/2

// MARK: How to store truth with Booleans
let filename = "london_uk.jpg"
print(filename.hasSuffix(".jpg"))

let number = 8
print(number.isMultiple(of: 3))

// Zmienne typu Bool (Prawda / Fałsz)
let goodDogs = true
let gameOver = false
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

isAuthenticated.toggle()
print(isAuthenticated)
isAuthenticated.toggle()
print(isAuthenticated)

// MARK: How to join strings together
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

// String interpolation \(variableName)
print("\(people) gonna \(action)")

let name = "Taylor"
let age = 26
let message = "Hello, my name is: \(name) and I'm \(age) years old."
 
print("5 x 5 = \(5*5)")
