//
//  AnotherTempContentView.swift
//  Day_23_Project3
//
//  Created by Konrad Podrygalski on 30/09/2023.
//

import SwiftUI

struct WaterMar: ViewModifier {
    let text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct CapsuleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(WaterMar(text: text))
    }
}

struct AnotherTempContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Test Modifier")
//                .modifier(Title())
                .titleStyle()
            
            Color.blue.frame(width: 300, height: 200)
                .watermarked(with: "Hello, World!")
            
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            CapsuleText(text: "Second")
                .foregroundStyle(.orange)
        }
    }
}

#Preview {
    AnotherTempContentView()
}
