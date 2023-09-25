//
//  TipPercentageView.swift
//  Day_16_WeSplit
//
//  Created by Konrad Podrygalski on 25/09/2023.
//

import SwiftUI

struct TipPercentageView: View {
    @Binding var tipPercentage: Double
    
    var body: some View {
        VStack {
            Text("Tip Percentage")
                .font(.headline)
            
            Slider(value: $tipPercentage, in: 0...100, step: 1)
                .padding()
            
            Text("Selected tip: \(Int(tipPercentage) )%")
                .font(.headline)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TipPercentageView(tipPercentage: .constant(1))
}
