//
//  Bookmarks.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 23.03.2025.
//

import SwiftUI

struct NowReadBookView: View {
    @Binding var isNavigatingToChapter: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextButton(isNavigatingToChapter: $isNavigatingToChapter)
            BookView()
        }
    }
}

extension NowReadBookView {
    struct TextButton: View {
        @Binding var isNavigatingToChapter: Bool

        var body: some View {
            HStack {
                Text("ЧИТАЕТЕ СЕЙЧАС")
                    .font(.header2)
                    .foregroundColor(.accentDarkC)
                    .padding(.leading, 16.adaptive)

                Spacer()

                Button(
                    action: {
                        isNavigatingToChapter = true
                    },
                    label: {
                        ZStack {
                            Color.clear
                            Image(systemName: "play")
                                .foregroundColor(.white)
                        }
                        .frame(width: 16, height: 16)
                    }
                )
                .frame(width: 34, height: 34)
                .background(.accentDarkC)
                .clipShape(Circle())
                .accessibilityIdentifier("loginButton")
            }
            .padding(.trailing, 16.adaptive)
        }
    }

    struct BookView: View {
        var body: some View {
            HStack(spacing: 16.adaptive) {
                Image("BookWelcomeScreen 1")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(4)
                    .frame(height: 126)

                VStack(alignment: .center, spacing: 4.adaptive) {
                    Spacer()
                    AttributedText(
                        text: "КОД ДА ВИНЧИ",
                        font: UIFont(name: "AlumniSans-Bold", size: 24)!,
                        lineHeight: 24,
                        color: UIColor(Color.accentDarkC)
                    )
                    AttributedText(
                        text: "Пролог",
                        font: UIFont(name: "VelaSans-Bold", size: 14)!,
                        lineHeight: 14 * 1.5,
                        color: UIColor(Color.accentDarkC)
                    )
                    ProgressLineView(progress: 0.5, width: 0.8)
                        .frame(height: 4)
                    Spacer()
                }
                .frame(maxHeight: 126)
            }
            .padding(.leading, 16.adaptive)
        }
    }
}

struct ProgressLineView: View {
    var progress: CGFloat
    var width: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: geometry.size.width * width, height: 4)
                    .foregroundColor(.accentMediumC)

                Capsule()
                    .frame(width: geometry.size.width * progress, height: 4)
                    .foregroundColor(.accentDarkC)
            }
        }
        .frame(height: 4)
    }
}
