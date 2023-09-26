//
//  ContentView.swift
//  Day_19_Challenge1
//
//  Created by Konrad Podrygalski on 26/09/2023.
//

// https://www.hackingwithswift.com/100/swiftui/19

import SwiftUI

struct ContentView: View {
    private let units: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedInputUnit = "Celsius"
    @State private var selectedOutputUnit = "Fahrenheit"
    @State private var inputValue = ""
    @State private var path: NavigationPath = NavigationPath()
    
    var conversionResult: Double {
        if let inputTemperature = Double(inputValue) {
            let inputUnit = selectedInputUnit.lowercased()
            let outputUnit = selectedOutputUnit.lowercased()
            
            switch inputUnit {
            case "celsius":
                switch outputUnit {
                case "celsius":
                    return inputTemperature
                case "fahrenheit":
                    return (inputTemperature * 9/5) + 32
                case "kelvin":
                    return inputTemperature + 273.15
                default:
                    return 0
                }
            case "fahrenheit":
                switch outputUnit {
                case "celsius":
                    return (inputTemperature - 32) * 5/9
                case "fahrenheit":
                    return inputTemperature
                case "kelvin":
                    return (inputTemperature - 32) * 5/9 + 273.15
                default:
                    return 0
                }
            case "kelvin":
                switch outputUnit {
                case "celsius":
                    return inputTemperature - 273.15
                case "fahrenheit":
                    return (inputTemperature - 273.15) * 9/5 + 32
                case "kelvin":
                    return inputTemperature
                default:
                    return 0
                }
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            Form {
                Section {
                    Picker("Choose Input Unit", selection: $selectedInputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Choose Temperature Input Unit")
                }
                
                Section {
                    Picker("Choose Output Unit", selection: $selectedOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Choose Temperature Output Unit")
                }
                
                Section {
                    TextField("Enter Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Enter Temperature Value")
                }
                
                Section {
                    Text("Result: \(conversionResult.formatted())")
                } header: {
                    Text("Result of Conversion")
                }
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
