//
//  BookScrollView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 21.03.2025.
//

import SwiftUI

struct BookLibraryScrollView: View {
    @Binding var tabSelection: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 16.adaptive) {
            Text("ПОПУЛЯРНЫЕ КНИГИ")
                .font(.header2)
                .foregroundColor(.accentDarkC)
                .padding(.leading, 8.adaptive)

            LazyVGrid(
                columns: [
                    GridItem(.flexible(minimum: 112.adaptive)),
                    GridItem(.flexible(minimum: 112.adaptive)),
                    GridItem(.flexible(minimum: 112.adaptive))
                ],
                spacing: 16.adaptive
            ) {
                ForEach(BookType.bookLibrary, id: \.title) { book in
                    Button(
                        action: {
                            tabSelection = 3
                        },
                        label: {
                            PopularBookView(
                                title: book.title,
                                name: book.author,
                                image: book.image
                            )
                        }
                    )
                }
            }
        }
        .padding(.horizontal, 16.adaptive)
    }
}
