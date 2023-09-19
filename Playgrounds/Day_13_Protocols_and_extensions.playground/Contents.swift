import Cocoa

// https://www.hackingwithswift.com/100/swiftui/13
// MARK: How to create and use protocols

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol CanBeElectric {
    var isElectric: Bool { get set }
}

struct Car: Vehicle {
    let name: String
    var currentPassengers: Int
    

    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a diffrent vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car(name: "Car", currentPassengers: 1)
commute(distance: 100, using: car)

struct Bike: Vehicle {
    let name: String
    var currentPassengers: Int
    
    func estimateTime(for distance: Int) -> Int {
        distance / 20
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bike(name: "Bike", currentPassengers: 1)
commute(distance: 110, using: bike)

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)

// MARK: How to use opaque return types
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

let num1 = getRandomNumber()
let num2 = getRandomBool()

// MARK: How to create and use protocol extensions
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests: [String] = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello() -> String
}

extension Person {
    func sayHello() -> String {
        return "Hi, I'm \(name)!"
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
print(taylor.sayHello())
