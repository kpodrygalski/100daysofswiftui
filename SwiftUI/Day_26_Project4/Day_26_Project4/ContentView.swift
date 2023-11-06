//
//  ContentView.swift
//  Day_26_Project4
//
//  Created by Konrad Podrygalski on 06/11/2023.
//

// https://www.hackingwithswift.com/100/swiftui/26

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            StepperView()
            Spacer()
            DateTimePickerView()
        }
    }
}

#Preview {
    ContentView()
}
