//
//  QuotesListView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 24.03.2025.
//

import SwiftUI

struct QuotesListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextView()
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 8) {
                ForEach(BookType.quoteFavorite, id: \.quote) { quote in
                    QuoteView(
                        quote: quote.quote,
                        book: quote.book,
                        author: quote.author
                    )
                }
            }
            .padding(.leading, 16)
        }
    }
}

extension QuotesListView {
    struct TextView: View {
        var body: some View {
            HStack {
                Text("ЦИТАТЫ")
                    .font(.header2)
                    .foregroundColor(.accentDarkC)
                    .padding(.leading, 16.adaptive)
            }
            .padding(.trailing, 16.adaptive)
        }
    }
}
