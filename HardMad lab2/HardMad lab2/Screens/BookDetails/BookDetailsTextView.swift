//
//  SwiftUIView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 24.03.2025.
//

import SwiftUI

struct BookDetailsTextView: View {
    var bookName: String
    var bookAuthor: String
    let description = """
    Секретный код скрыт в работах Леонардо да Винчи...

    Только он поможет найти христианские святыни, дающие немыслимые власть и могущество...

    Ключ к величайшей тайне, над которой человечество билось веками, наконец может быть найден...
    """

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                Text(bookName)
                   .font(.header1)
                   .foregroundColor(.accentDarkC)

                Text(bookAuthor)
                   .font(.bodyC)
                   .foregroundColor(.accentDarkC)
            }
            Text(description)
                .font(.bodyC)
                .foregroundColor(.accentDarkC)
        }
    }
}
