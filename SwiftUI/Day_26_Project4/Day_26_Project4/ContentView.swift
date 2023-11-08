//
//  ContentView.swift
//  Day_26_Project4
//
//  Created by Konrad Podrygalski on 06/11/2023.
//

// https://www.hackingwithswift.com/100/swiftui/26
// https://www.hackingwithswift.com/100/swiftui/27
// https://www.hackingwithswift.com/100/swiftui/28

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp       = defaultWakeTime
    @State private var sleepAmount  = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle   = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components    = DateComponents()
        components.hour   = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    DatePicker("Please enter a time",
                               selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .onChange(of: wakeUp) {
                        calculateBedTime()
                    }
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours",
                            value: $sleepAmount,
                            in: 4...12,
                            step: 0.25)
                    .onChange(of: sleepAmount) {
                        calculateBedTime()
                    }
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                
                Section {
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(1..<21) { num in
                            Text("\(num)").tag(num)
                        }
                    }
                    .onChange(of: coffeeAmount) {
                        calculateBedTime()
                    }
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
                Section {
                    Text(alertMessage.isEmpty ? "Not calculated yet." : alertMessage)
                        .font(.title2)
                } header: {
                    Text("Your ideal bedtime is")
                }
            }
            .navigationTitle("BetterRest")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
