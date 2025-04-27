//
//  BookDetailsContents.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 24.03.2025.
//

import SwiftUI

struct BookChapterContents: View {
    private let chapters = BookDetailsData.chapters

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("ОГЛАВЛЕНИЕ")
                .font(.header2)
                .foregroundColor(.accentDarkC)
            VStack(spacing: 24) {
                ForEach(chapters, id: \.id) { chapter in
                    ChapterCardView(chapter: chapter, showStatusIcon: true)
                }
            }
        }
    }
}
