//
//  BookSearchResult.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 22.03.2025.
//

import SwiftUI

struct BookSearchResult: View {
    var title: String
    var name: String
    var image: String

    var body: some View {
        HStack(spacing: 16.adaptive) {
            Image(image)
                .resizable()
                .scaledToFit()
                .cornerRadius(4)
                .frame(height: 126)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.header2)
                    .foregroundColor(.accentDarkC)
                Text(name)
                    .font(.bodySmall)
                    .foregroundColor(.accentDarkC)
            }
            .frame(maxHeight: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: 126, alignment: .leading)
    }
}
