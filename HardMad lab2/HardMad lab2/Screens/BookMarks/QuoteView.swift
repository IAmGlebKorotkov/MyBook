//
//  QuoteView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 24.03.2025.
//

import SwiftUI

struct QuoteView: View {
    var quote: String
    var book: String
    var author: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(quote)
                .font(.system(size: 16, weight: .regular, design: .serif))
                .italic()
                .foregroundColor(.blackC)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)

            HStack(spacing: 4) {
                Text(book)
                    .font(.bodySmall)
                    .foregroundColor(.accentDarkC)

                Text("•")
                    .font(.system(size: 12))
                    .foregroundColor(.accentDarkC)

                Text(author)
                    .font(.bodySmall)
                    .foregroundColor(.accentDarkC)
            }
        }
        .frame(maxWidth: 350.adaptive, alignment: .leading)
        .padding(10.adaptive)
        .background(Color.accentLightC)
        .cornerRadius(8.adaptive)
        .padding(.trailing, 16)
    }
}
