//
//  ReadNowView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 23.03.2025.
//

import SwiftUI

struct BookMarkView: View {
    @State private var isNavigatingToChapter = false
    @Binding var tabSelection: Int
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16.adaptive) {
                Text("ЗАКЛАДКИ")
                    .font(.header1)
                    .foregroundColor(.secondaryC)
                    .padding(.leading, 16.adaptive)

                NowReadBookView(isNavigatingToChapter: $isNavigatingToChapter)

                FavoriteBookView(tabSelection: $tabSelection)
                QuotesListView()
                Spacer()
            }
        }
        .background(.backgroundC)
        .fullScreenCover(isPresented: $isNavigatingToChapter) {
            ChapterView()
                .ignoresSafeArea()
                .padding(.top, 4)
                .background(Color.backgroundC)
        }
    }
}
