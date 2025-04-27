//
//  SearchButtonTappedView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 22.03.2025.
//

import SwiftUI

struct SearchResultView: View {
    @Binding var tabSelection: Int
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                    ForEach(BookType.bookSearchResult, id: \.title) { book in
                        Button(
                            action: {
                                tabSelection = 3
                            },
                            label: {
                                BookFavorite(
                                    title: book.title,
                                    name: book.author,
                                    image: book.image
                                )
                            }
                        )
                    }
                }
            }
            .padding(.leading, 16)
        }
    }
}
