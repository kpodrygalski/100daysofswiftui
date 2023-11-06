//
//  StepperView.swift
//  Day_26_Project4
//
//  Created by Konrad Podrygalski on 06/11/2023.
//

import SwiftUI

struct StepperView: View {
    @State private var sleepAmount: Double = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours",
                value: $sleepAmount,
                in: 4...12,
                step: 0.25)
        .padding()
    }
}

#Preview {
    StepperView()
}
