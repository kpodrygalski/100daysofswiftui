import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-5

let luckyNumbers: [Int] = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let numbers = luckyNumbers
    .filter { !$0.isMultiple(of: 2) }
    .sorted()
    .map { return "\($0) is lucky number"}

print(numbers)
