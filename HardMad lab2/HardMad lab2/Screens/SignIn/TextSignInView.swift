//
//  TextSignInView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 15.03.2025.
//

import SwiftUI

struct TextSignInView: View {
    private func dynamicFontSize(baseSize: CGFloat) -> CGFloat {
        let baseScreenWidth: CGFloat = 430
        let screenWidth = UIScreen.main.bounds.width
        return (screenWidth / baseScreenWidth) * baseSize
    }

    var body: some View {
        VStack(alignment: .leading) {
            AttributedText(
                text: "ОТКРОЙ ДЛЯ СЕБЯ",
                font: UIFont(name: "AlumniSans-Bold", size: dynamicFontSize(baseSize: 48))!,
                lineHeight: dynamicFontSize(baseSize: 48),
                color: UIColor(Color.accentLightC)
            )
            .accessibilityIdentifier("titleText")
            .padding(.top)

            AttributedText(
                text: "КНИЖНЫЙ\nМИР",
                font: UIFont(name: "AlumniSans-Bold", size: dynamicFontSize(baseSize: 96))!,
                lineHeight: dynamicFontSize(baseSize: 76.8),
                color: UIColor(Color.secondaryC)
            )
            .accessibilityIdentifier("subtitleText")
            .padding(.bottom)
        }
    }
}
