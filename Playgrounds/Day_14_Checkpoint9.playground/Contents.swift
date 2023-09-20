import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-9

func getRandomNumber(from array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

getRandomNumber(from: nil)
getRandomNumber(from: [1, 2, 3, 4, 5])
