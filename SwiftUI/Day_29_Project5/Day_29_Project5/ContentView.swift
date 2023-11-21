//
//  ContentView.swift
//  Day_29_Project5
//
//  Created by Konrad Podrygalski on 19/11/2023.
//

// https://www.hackingwithswift.com/100/swiftui/29
// https://www.hackingwithswift.com/100/swiftui/30
// https://www.hackingwithswift.com/100/swiftui/31

import SwiftUI

struct ContentView: View {
    @State private var usedWords: [String]  = []
    @State private var rootWord: String     = ""
    @State private var newWord: String      = ""
    @State private var errorTitle: String   = ""
    @State private var errorMessage: String = ""
    @State private var showingError: Bool   = false
    @State private var score: Int           = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Score: \(score)")
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                ToolbarItem {
                    Button(action: startGame, label: {
                        Text("Reset")
                    })
                }
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) { } message: {
                Text(errorMessage)
            }
        }
    }
    
    private func addNewWord() {
        let answer = newWord
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already.", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible.", message: "You can't spell that word from '\(rootWord)'")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized.", message: "You can't just make them up, you know!")
            return
        }
                
        guard isShorterThanThreeLetters(word: answer) else {
            wordError(title: "Word is too short.", message: "Please provide word longer then 2 characters.")
            return
        }
        
        guard rootWord != answer else {
            wordError(title: "Your word and root word is the same.", message: "Enter diffrent word then: '\(rootWord)'")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
        score += answer.count
    }
    
    private func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords.removeAll()
                score = 0
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    private func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range   = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word,
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    private func wordError(title: String, message: String) {
        errorTitle   = title
        errorMessage = message
        showingError = true
    }
    
    private func isShorterThanThreeLetters(word: String) -> Bool {
        return word.count >= 3
    }
    
}

#Preview {
    ContentView()
}
