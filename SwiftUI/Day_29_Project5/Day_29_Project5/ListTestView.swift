//
//  ListTestView.swift
//  Day_29_Project5
//
//  Created by Konrad Podrygalski on 19/11/2023.
//

import SwiftUI

struct ListTestView: View {
    private let people: [String] = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
//        List(people, id: \.self) {
//            Text("Dynamic Row: \($0)")
//        }
        
        List {
            Text("Static Row 1")
            
            ForEach(people, id: \.self) {
                Text("\($0)")
            }
            
            Text("Static Row 2")
        }
        
//        List {
//            Section("Section 1") {
//                Text("Static Row 1")
//                Text("Static Row 2")
//            }
//            
//            Section("Section 2") {
//                ForEach(0..<5) {
//                    Text("Dynamic Row: \($0)")
//                }
//            }
//            
//            Section("Section 3") {
//                Text("Static Row 3")
//                Text("Static Row 4")
//            }
//        }
//        .listStyle(.plain)
    }
}

#Preview {
    ListTestView()
}
