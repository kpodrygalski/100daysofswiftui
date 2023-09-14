import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-4

enum SquareRootError: Error {
    case outOfBounds, noRoot
}

func findSquare(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 { throw SquareRootError.outOfBounds }
    
    for i in 1...100 {
        if i * i == number {
            return i
        } else if i * i > number {
            break
        }
    }
    
    throw SquareRootError.noRoot
}

do {
    let result = try findSquare(of: 36)
    print("\(result)")
} catch {
    print("There was an error: \(error)")
}
