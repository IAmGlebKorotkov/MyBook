//
//  AuthorView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 18.03.2025.
//

import SwiftUI

struct AuthorView: View {
    @Binding var isSearchButtonTapped: Bool
    let authorDisc: [String: Image] = [
        "Братья Стругацкие": Image(.brotherStrug),
        "Дэн Браун": Image(.denBraun)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Авторы")
                    .font(.header2)
                    .foregroundColor(.accentDarkC)
                    .padding(.leading, 8)

                LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                    ForEach(Array(authorDisc), id: \.key) { (name, image) in
                        UniversalThemeAuthorButton(
                            textButton: .constant(name), isSearchButtonTapped: $isSearchButtonTapped,
                            universalImage: image,
                            buttonType: "Author"
                        )
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}
