import Cocoa

// https://www.hackingwithswift.com/100/swiftui/4
// MARK: How to use type annotations
let surname: String = "Lasso"
let playerName: String = "Rivss"
let luckyNumber: Int = 8
var score: Int = 0
var isAuthenticated: Bool = false

var artists: [String] = ["Ghost Brigade", "Insomnium", "Katatonia", "Sirenia"]
// var teams: [String] = []
var teams = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .dark

let username: String
username = "rivss"
print(username)

