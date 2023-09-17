import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-6

enum GearDirection {
    case up, down
}

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 1 {
        didSet {
            print("\(model) gear is: \(currentGear)")
        }
    }
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
        
    mutating func changeGear(direction: GearDirection) {
        if direction == .up && currentGear < 10 {
            currentGear += 1
        } else if direction == .down && currentGear > 0 {
            currentGear -= 1
        }
    }
}

var car1 = Car(model: "Opel", numberOfSeats: 5)
car1.changeGear(direction: .up)
car1.changeGear(direction: .up)
car1.changeGear(direction: .up)
car1.changeGear(direction: .down)
car1.changeGear(direction: .down)

