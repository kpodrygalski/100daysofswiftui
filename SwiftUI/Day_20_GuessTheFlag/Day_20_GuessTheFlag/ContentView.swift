//
//  ContentView.swift
//  Day_20_GuessTheFlag
//
//  Created by Konrad Podrygalski on 27/09/2023.
//

// https://www.hackingwithswift.com/100/swiftui/20
// https://www.hackingwithswift.com/100/swiftui/21

import SwiftUI

struct ContentView: View {
    @State private var showScoreAlert: Bool = false
    @State private var scoreTitle: String = ""
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer: Int = Int.random(in: 0...2)
    @State private var scores: Int = 0
    
    var body: some View {
        ZStack {
            // Background
            RadialGradient(stops:
                            [.init(color: Color(red: 0.1, green: 0.1, blue: 0.20), location: 0.3),
                             .init(color: Color(red: 0, green: 0.30, blue: 0.35), location: 0.3)],
                           center: .top,
                           startRadius: 200,
                           endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.teal)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of:")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(.buttonBorder)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(scores)")
                    .foregroundStyle(.teal)
                    .font(.title.bold())
                    
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showScoreAlert) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(scores)")
        }
    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scores += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showScoreAlert = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
