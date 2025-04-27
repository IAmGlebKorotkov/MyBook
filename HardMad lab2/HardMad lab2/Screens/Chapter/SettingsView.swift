//
//  SettingsCardView.swift
//  BookClub
//
//  Created by Zayata Budaeva on 24.03.2025.
//

import SwiftUI

struct SettingsView: View {
    let title: String
    let sizeText: String
    var minusVar: () -> Void = {}
    var plusVar: () -> Void = {}

    var body: some View {
        HStack {
            textSettings
            Spacer()
            buttons
        }
    }
}

extension SettingsView {
    private var textSettings: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.body)
                .foregroundColor(.accentDarkC)

            Text(sizeText + " пт")
                .font(Font.custom("VelaSans-Bold", size: 16))
                .foregroundColor(.accentDarkC)
        }
    }

    private var buttons: some View {
        MinPlusButton(
            minusAction: minusVar,
            plusAction: plusVar
        )
    }
}
