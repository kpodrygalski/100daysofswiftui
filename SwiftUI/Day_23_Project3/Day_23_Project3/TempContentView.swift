//
//  TempContentView.swift
//  Day_23_Project3
//
//  Created by Konrad Podrygalski on 30/09/2023.
//

import SwiftUI

struct TempContentView: View {
//    @State private var useRedText: Bool = false
//    let title = Text("This is title.").font(.title)
    var title: some View {
        Text("This is title.").font(.title)
    }
    
    let subtitle = Text("This is subtitle.").font(.subheadline)
    
    @ViewBuilder var groups: some View {
        Text("Group 1")
        Text("Group 2")
        Text("Group 3")
    }
    
    var body: some View {
        VStack {
            title
                .foregroundStyle(.blue)
            subtitle
                .foregroundStyle(.gray)
            
            VStack {
                groups
            }
        }
        
//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title)
//        VStack {
//            Button("Hello, World") {
//                print(type(of: self.body))
//            }
//            .frame(width: 200, height: 200)
//            .background(.red)
//            
//            Text("Some Text")
//                .font(.footnote)
//                .fontWeight(.semibold)
//                .foregroundColor(Color.yellow)
//                .lineLimit(5)
//                .padding()
//                .background(.red)
//                .padding()
//                .background(.green)
//                .padding()
//                .background(.blue)
//
//            Button("Click me") {
//                useRedText.toggle()
//            }
//            .foregroundStyle(useRedText ? .red : .blue)
//        }
    }
}

#Preview {
    TempContentView()
}
