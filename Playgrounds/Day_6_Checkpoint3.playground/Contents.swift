import Cocoa

var numbers = [Int]()

// Fill array with numbers from 1 to 100
for i in 1...100 {
    numbers.append(i)
}

// For solution
for number in numbers {
    if number % 15 == 0 {
        print("\(number) - FizzBuzz")
    } else if number % 5 == 0 {
        print("\(number) - Buzz")
    } else if number % 3 == 0 {
        print("\(number) - Fizz")
    } else {
        print("\(number)")
    }
}

print()

// isMultipleOf solution
for number in numbers {
    if number.isMultiple(of: 15) {
        print("\(number) - FizzBuzz")
    } else if number.isMultiple(of: 5) {
        print("\(number) - Buzz")
    } else if number.isMultiple(of: 3) {
        print("\(number) - Fizz")
    } else {
        print("\(number)")
    }
}

