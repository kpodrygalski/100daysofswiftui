//
//  FlagImage.swift
//  Day_20_GuessTheFlag
//
//  Created by Konrad Podrygalski on 01/10/2023.
//

// https://www.hackingwithswift.com/100/swiftui/24

import SwiftUI

struct FlagImage: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(.buttonBorder)
            .shadow(radius: 5)
    }
}

#Preview {
    FlagImage(imageName: "US")
}
