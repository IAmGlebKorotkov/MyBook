//
//  ChapterSettingsModalView.swift
//  BookClub
//
//  Created by Zayata Budaeva on 24.03.2025.
//

import SwiftUI

struct ChapterSettingsView: View {
    @Binding var present: Bool
    @Binding var fontSize: Int
    @Binding var lineHeight: CGFloat

    var body: some View {
        ZStack {
            Color.backgroundC
            VStack(spacing: 24) {
                header
                settingsCards
                Spacer()
            }
            .padding(.top, 30)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.backgroundC)
                    .shadow(color: .black.opacity(0.25), radius: 20, y: -5)
            )
        }
    }
}

extension ChapterSettingsView {
    private var header: some View {
        HStack {
            Text("НАСТРОЙКИ")
                .font(.header2)
                .foregroundColor(.accentDarkC)
            Spacer()
            Button {
                present = false
            } label: {
                Image(.close)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.accentDarkC)
            }
        }
        .padding(.top, 8)
    }

    private var settingsCards: some View {
        VStack(spacing: 16) {
            SettingsView(
                title: "Размер шрифта",
                sizeText: "\(fontSize)",
                minusVar: { fontSize = max(10, fontSize - 1) },
                plusVar: { fontSize += 1 }
            )

            SettingsView(
                title: "Расстояние между строками",
                sizeText: String(format: "%.1f", lineHeight),
                minusVar: {
                    lineHeight = max(0.7, lineHeight - 0.1)
                },
                plusVar: {
                    lineHeight = min(3.0, lineHeight + 0.1)
                }
            )
        }
    }
}
