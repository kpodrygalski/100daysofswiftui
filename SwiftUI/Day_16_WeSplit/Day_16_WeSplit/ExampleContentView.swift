//
//  ExampleContentView.swift
//  Day_16_WeSplit
//
//  Created by Konrad Podrygalski on 22/09/2023.
//

import SwiftUI

struct ExampleContentView: View {
    @State private var tapCount: Int = 0
    @State private var path: NavigationPath = NavigationPath()
    @State var name: String
    let students: [String] = ["Harry", "Sarah", "Elise", "Jon"]
    @State private var selectedStudent = "Elise"
    
    var body: some View {
        NavigationStack(path: $path) {
            Form {
                Section {
                    Text("Tap count: \(tapCount)")
                }
                
                Section {
                    TextField("Enter your name: ", text: $name)
                    
                    if !name.isEmpty {
                        Text("Hello, \(name)")
                    }
                    
                    Button(action: {
                        tapCount += 1
                    }, label: {
                        Text("Tap")
                    })
                }
                
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach (students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ExampleContentView(name: "")
}
