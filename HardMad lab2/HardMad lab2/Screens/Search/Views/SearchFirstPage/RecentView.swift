//
//  RecentView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 18.03.2025.
//

import SwiftUI

struct RecentView: View {
    @Binding var isSearchButtonTapped: Bool
    let recent = [
        "Android", "IOS"
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Недавние запросы")
                    .font(.header2)
                    .foregroundColor(.accentDarkC)
                    .padding(.leading, 8)

                LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                    ForEach(recent, id: \.self) { genre in
                        UniversalThemeAuthorButton(textButton: .constant(genre), isSearchButtonTapped:
                                                    $isSearchButtonTapped, universalImage:
                                                    Image(.history), iconImage: Image(.close), buttonType: "Recent")
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}
