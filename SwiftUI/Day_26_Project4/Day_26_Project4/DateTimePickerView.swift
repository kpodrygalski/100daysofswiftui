//
//  DateTimePickerView.swift
//  Day_26_Project4
//
//  Created by Konrad Podrygalski on 06/11/2023.
//

import SwiftUI

struct DateTimePickerView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        
        VStack {
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time:. shortened))
            
            DatePicker("Please enter a time",
                       selection: $wakeUp,
                       in: Date.now...)
            .labelsHidden()
        }
    }
    
    private func exampleDates() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
//        let now = Date.now
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = now...tomorrow
    }
}
#Preview {
    DateTimePickerView()
}
