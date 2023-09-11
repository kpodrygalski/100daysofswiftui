import Cocoa

// https://www.hackingwithswift.com/quick-start/beginners/checkpoint-2

let items: [String] = ["Item One", "Item Two", "Item Three", "Item Four", "Item One", "Item Three", "Item One"]

// Number of items in the array
print(items.count)

// Number of unique items in the array
// Create Set from items array
let myItemsSet = Set(items)
print(myItemsSet.count)
