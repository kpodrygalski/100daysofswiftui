//
//  ContentView.swift
//  Day_25_RockPaperScissors
//
//  Created by Konrad Podrygalski on 05/10/2023.
//

// https://www.hackingwithswift.com/guide/ios-swiftui/2/3/challenge

import SwiftUI

struct ContentView: View {
    // 0: Rock, 1: Paper, 2: Scissors
    @State private var appChoice: Int = Int.random(in: 0..<3)
    @State private var playerScore: Int = 0
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    
    let moves: [String] = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        VStack {
            Text("Score: \(playerScore)")
                .font(.title)
            
            Spacer()
            
            Text("Select :")
                .font(.headline)
            
            HStack {
                ForEach(0..<3) { moveIndex in
                    Button(action: {
                        self.checkResult(playerMove: moveIndex)
                    }) {
                        Text(moves[moveIndex])
                            .font(.title)
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(5)
                    }
                }
            }
            .alert(alertTitle, isPresented: $showAlert) {
                Button("Continue", role: .cancel) {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func checkResult(playerMove: Int) {
        let appMove = appChoice
        // Stone -> Scissor, Scissors -> Papier, Paper -> Stone
        let winningMoves = [2, 0, 1]
        
        if appMove == playerMove {
            // Draw
            setupAlert(title: "Draw! 😛", message: "Score: \(playerScore)")
            showAlert = true
        } else if winningMoves[appMove] == playerMove {
            // Player win
            playerScore += 1
            setupAlert(title: "You win! 🥳", message: "Score: \(playerScore)")
            showAlert = true
        } else {
            // Player lose
            playerScore -= 1
            setupAlert(title: "You lose! 🥹", message: "Score: \(playerScore)")
            showAlert = true
        }
        
        appChoice = Int.random(in: 0..<3)
    }
    
    private func setupAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
    }
}

#Preview {
    ContentView()
}
