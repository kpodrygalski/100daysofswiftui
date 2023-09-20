import Cocoa

// https://www.hackingwithswift.com/100/swiftui/14
// MARK: How to handle missing data with optionals
let opposities = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposities["Peach"]

if let marioOpposite = opposities["Mario"] {
    print("Mario's opposite is: \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let number = number {
    print(square(number: number))
}

// MARK: How to unwrap optionals with guard
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Number is nil.")
        return
    }
    
    print("\(number) x \(number) = \(number * number)")
}

// MARK: How to handle multiple optionals using optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

// MARK: How to handle function failure with optionals
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 123) {
    print("User: \(user)")
}

let user = (try? getUser(id: 123)) ?? "Anonymous"
print(user)
