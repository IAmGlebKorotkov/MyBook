//
//  ChapterContentsModalView.swift
//  BookClub
//
//  Created by Zayata Budaeva on 23.03.2025.
//

import SwiftUI

struct ChapterContentsModalView: View {
    private let chapters = BookDetailsData.chapters
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Color.backgroundC
            VStack {
                ModalHeaderView(isPresented: $isPresented)
                chapterList
            }
        }
    }
}

extension ChapterContentsModalView {
    private var chapterList: some View {
        ScrollView {
            VStack(spacing: 24) {
                ForEach(chapters, id: \.id) { chapter in
                    ChapterCardView(chapter: chapter, showStatusIcon: false)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
