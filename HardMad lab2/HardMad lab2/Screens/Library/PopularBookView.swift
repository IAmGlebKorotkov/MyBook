//
//  PopularBookView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 23.03.2025.
//

import SwiftUI

struct PopularBookView: View {
    var title: String
    var name: String
    var image: String

    var body: some View {
        VStack(spacing: 8.adaptive) {
            Image(image)
                .resizable()
                .scaledToFit()
                .cornerRadius(4)
                .frame(height: 175)
            AttributedText(
                text: title,
                font: UIFont(name: "AlumniSans-Bold", size: 14)!,
                lineHeight: 14,
                color: UIColor(Color.accentDarkC)
            )
            AttributedText(
                text: name,
                font: UIFont(name: "VelaSans-Regular", size: 10)!,
                lineHeight: 10,
                color: UIColor(Color.accentDarkC)
            )
            Spacer()
        }
    }
}
