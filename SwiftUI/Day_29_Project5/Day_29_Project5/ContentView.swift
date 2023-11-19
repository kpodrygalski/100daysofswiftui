//
//  ContentView.swift
//  Day_29_Project5
//
//  Created by Konrad Podrygalski on 19/11/2023.
//

// https://www.hackingwithswift.com/100/swiftui/29

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
    }
    
    private func testStrings() {
//        let input = """
//                    a
//                    b
//                    c
//                    """
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        Misspelled word
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, 
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
    
    private func testBundles() {
//        if let fileURL = Bundle.main.url(forResource: "someFile", withExtension: "txt") {
//            if let fileContents = try? String(contentsOf: fileURL) {
//                
//            }
//        }
    }
    
}

#Preview {
    ContentView()
}
