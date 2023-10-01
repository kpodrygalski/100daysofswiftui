//
//  ContentView.swift
//  Day_16_WeSplit
//
//  Created by Konrad Podrygalski on 22/09/2023.
//

// https://www.hackingwithswift.com/100/swiftui/16
// https://www.hackingwithswift.com/100/swiftui/17
// https://www.hackingwithswift.com/100/swiftui/18
// https://www.hackingwithswift.com/100/swiftui/24

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Double  = 20
    @State private var path: NavigationPath = NavigationPath()
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages: [Int] = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmountForCheck: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = Locale.current.currency?.identifier ?? "USD"
        return formatter
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            Form {
                Section {
                    TextField("Amount",
                              value: $checkAmount,
                              format: .currency(code: currencyFormatter.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    //                    Picker("Tip", selection: $tipPercentage) {
                    //                        ForEach (tipPercentages, id: \.self) {
                    //                            Text($0, format: .percent)
                    //                        }
                    //                    }
                    //                    .pickerStyle(.segmented)
                    TipPercentageView(tipPercentage: $tipPercentage)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson,
                         format: .currency(code: currencyFormatter.currencyCode ?? "PLN"))
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(totalAmountForCheck,
                         format: .currency(code: Locale.current.currency?.identifier ?? "PLN"))
                    .foregroundStyle(tipPercentage == 0 ? .red : .black)
                } header: {
                    Text("Total amount for check")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
