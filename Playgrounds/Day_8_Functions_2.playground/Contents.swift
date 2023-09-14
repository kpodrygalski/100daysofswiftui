import Cocoa

// https://www.hackingwithswift.com/100/swiftui/8

// MARK: How to provide default values for parameters
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTables(for: 8)
printTimesTables(for: 5, end: 25)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// MARK: How to handle errors in functions
enum PasswordError: Error {
    case short, obvious
}

func validatePassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let password = "12345"

do {
    let result = try validatePassword(password)
    print("Password rating: \(result)")
} catch {
    print("There was an error: \(error.localizedDescription)")
}
