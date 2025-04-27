//
//  BackButton.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 25.03.2025.
//

import SwiftUI

struct BackButton: View {
    let color: Color
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(.arrowLeft)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                Text("Назад")
                    .font(.system(size: 17, weight: .regular))
            }
            .foregroundColor(color)
        }
    }
}
