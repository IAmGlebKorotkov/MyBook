//
//  FavoriteBookView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 24.03.2025.
//

import SwiftUI

struct FavoriteBookView: View {
    @Binding var tabSelection: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextView()
            BookScrollFavorite(tabSelection: $tabSelection)
        }
    }
}

extension FavoriteBookView {
    struct TextView: View {
        var body: some View {
            HStack {
                Text("ИЗБРАННЫЕ КНИГИ")
                    .font(.header2)
                    .foregroundColor(.accentDarkC)
                    .padding(.leading, 16.adaptive)
            }
            .padding(.trailing, 16.adaptive)
        }
    }

    struct BookScrollFavorite: View {
        @Binding var tabSelection: Int

        var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 8) {
                    ForEach(BookType.bookFavorite, id: \.title) { book in
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
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.leading, 16)
            }
        }
    }
}

struct BookFavorite: View {
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
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: 126, alignment: .leading)
    }
}
