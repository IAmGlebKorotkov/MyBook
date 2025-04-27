//
//  MinusPlusButtons.swift
//  BookClub
//
//  Created by Zayata Budaeva on 24.03.2025.
//

import SwiftUI

struct MinPlusButton: View {
    var minusAction: () -> Void = {}
    var plusAction: () -> Void = {}

    var body: some View {
        HStack(spacing: 16) {
            minusButton
            separator
            plusButton
        }
        .padding(.vertical, 7)
        .padding(.horizontal, 16)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.accentLightC))
    }
}

extension MinPlusButton {
    private var minusButton: some View {
        Button(action: minusAction) {
            Text("-")
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.accentDarkC)
        }
    }

    private var plusButton: some View {
        Button(action: plusAction) {
            Text("+")
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.accentDarkC)
        }
    }

    private var separator: some View {
        Rectangle()
            .fill(.accentMediumC)
            .frame(width: 1, height: 20)
    }
}
