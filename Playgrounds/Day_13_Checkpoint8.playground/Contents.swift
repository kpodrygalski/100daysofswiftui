import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-8
protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get }
    
    func printSaleSummary()
    
    
}

extension Building {
    func printSaleSummary() {
        print("NumberOfRooms: \(numberOfRooms) :: Price: $\(cost) :: Estate Agent: \(estateAgent)")
    }
}

struct House: Building {
    let numberOfRooms: Int
    var cost: Int
    var estateAgent: String
    
    func printSaleSummary() {
        print("This is a house with \(numberOfRooms) rooms, priced at $\(cost), sold by \(estateAgent).")
    }
    
    
}

struct Office: Building {
    let numberOfRooms: Int
    var cost: Int
    var estateAgent: String
    
    func printSaleSummary() {
        print("This is a office with \(numberOfRooms) rooms, priced at $\(cost), sold by \(estateAgent).")
    }
    
    
}

var house = House(numberOfRooms: 6, cost: 950_000, estateAgent: "James Smith")
let office = Office(numberOfRooms: 4, cost: 750_000, estateAgent: "Jane Doe")

house.cost = 900_000
print(house.cost)
