//
//  ContentView.swift
//  Day_20_GuessTheFlag
//
//  Created by Konrad Podrygalski on 27/09/2023.
//

// https://www.hackingwithswift.com/100/swiftui/20

import SwiftUI

struct ContentView: View {
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            
            VStack {
                Button("Delete selection", role: .destructive, action: executeDelete)
                
                Button("Button 1") {}
                    .buttonStyle(.bordered)
                
                Button("Button 2", role: .destructive) {}
                    .buttonStyle(.bordered)
                
                Button("Button 3") {}
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                
                Button("Button 4", role: .destructive) {}
                    .buttonStyle(.borderedProminent)
                
                Button {
                    print("Hello, World!")
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
                
                Spacer()

                Button("Show Alert") {
                    showAlert = true
                }
                .alert("Message", isPresented: $showAlert) {
                    Button("Delete", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Please read this")
                }
                
            }
        }
    }
    
    private func executeDelete() {
        print("Now deleting")
    }
}

#Preview {
    ContentView()
}
