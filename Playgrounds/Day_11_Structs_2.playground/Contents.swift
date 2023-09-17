import Cocoa

// https://www.hackingwithswift.com/100/swiftui/11
// MARK: How to limit access to internal data using access control
// private - don't let anything outside the struct use this.
// private(set) - let anyone read this property, but only let my methods write it.
// fileprivate - don't let anything outside the current file use this.
// public - let anyone, anywhere use this.
struct BankAccount {
    private(set) var funds: Int = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 50)

if success {
    print("Withdraw money succesfully.")
} else {
    print("Failed to get the money.")
}

// MARK: Static properties and methods
// self - The current value of a struct
// Self - The current type of struct
struct School {
    static var studentCount: Int = 0
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print("Students count: \(School.studentCount)")

struct App {
    static let version: String = "1.3 beta 2"
    static let saveFilename: String = "settings.json"
    static let githubURL: String = "https://github.com/kpodrygalski"
}

print(App.version)
print(App.saveFilename)
print(App.githubURL)

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "aiousdjakls", password: "aousihdjknasd123#")
}

print(Employee.example)
