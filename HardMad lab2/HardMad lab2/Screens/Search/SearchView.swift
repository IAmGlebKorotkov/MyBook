//
//  SearchView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 18.03.2025.
//

import SwiftUI

struct SearchView: View {
    @State private var isSearchButtonTapped = false
    @Binding var tabSelection: Int
    var body: some View {
        ScrollView {
            VStack(spacing: 20.adaptive) {
                CustomSearchView(isSearchButtonTapped: $isSearchButtonTapped)
                    .padding(.horizontal, 16.adaptive)
                if isSearchButtonTapped {
                    SearchResultView(tabSelection: $tabSelection)
                } else {
                    SearchFirstPage(isSearchButtonTapped: $isSearchButtonTapped)
                }
            }
        }
        .background(.backgroundC)
    }
}
