//
//  SearchAuthorGenre.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 22.03.2025.
//

import SwiftUI

struct SearchFirstPage: View {
    @Binding var isSearchButtonTapped: Bool
    var body: some View {
        VStack(spacing: 20.adaptive) {
            RecentView(isSearchButtonTapped: $isSearchButtonTapped)
            GenreView(isSearchButtonTapped: $isSearchButtonTapped)
            AuthorView(isSearchButtonTapped: $isSearchButtonTapped)
        }
        .background(.backgroundC)
    }
}
