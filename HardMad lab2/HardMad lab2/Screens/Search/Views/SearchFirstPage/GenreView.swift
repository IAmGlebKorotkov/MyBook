//
//  GenreView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 18.03.2025.
//

import SwiftUI

struct GenreView: View {
    @Binding var isSearchButtonTapped: Bool
    let genres = [
        "Фантастика", "Детектив", "Роман", "Ужасы", "Фэнтези",
        "Исторический", "Научный", "Биография", "Поэзия"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16.adaptive) {
            Text("Жанры")
                .font(.header2)
                .foregroundColor(.accentDarkC)
                .padding(.leading, 8.adaptive)

            LazyVGrid(
                columns: [
                    GridItem(.flexible(minimum: 150.adaptive)),
                    GridItem(.flexible(minimum: 150.adaptive))
                ],
                spacing: 16.adaptive
            ) {
                ForEach(genres, id: \.self) { genre in
                    UniversalThemeAuthorButton(
                        textButton: .constant(genre), isSearchButtonTapped: $isSearchButtonTapped,
                        buttonType: "Theme"
                    )
                }
            }
        }
        .padding(.horizontal, 16.adaptive)
    }
}
