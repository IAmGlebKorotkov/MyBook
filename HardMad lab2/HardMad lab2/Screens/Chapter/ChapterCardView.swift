//
//  ChapterCardView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 25.03.2025.
//

import SwiftUI

struct ChapterCardView: View {
    @State private var isNavigatingToChapter = false
    let chapter: Chapter
    var showStatusIcon: Bool = true

    var body: some View {
        HStack {
            chapterTitle
            Spacer()
            if showStatusIcon {
                chapterStatusIcon
            }
        }
        .fullScreenCover(isPresented: $isNavigatingToChapter) {
                ChapterView()
                    .ignoresSafeArea()
                    .padding(.top, 4)
                    .background(Color.backgroundC)
            }
    }
}

extension ChapterCardView {
    private var chapterTitle: some View {
        Text(chapter.title)
            .font(chapter.nowReading ? Font.custom("VelaSans-Bold", size: 16) : .body)
            .foregroundColor(Color.accentDarkC)
    }

    @ViewBuilder
    private var chapterStatusIcon: some View {
        if chapter.read {
            Image(.read)
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.accentMediumC)
        } else if chapter.nowReading {
            Button(
                action: {
                    isNavigatingToChapter = true
                },
                label: {
                    Image(.readingNow)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.accentDarkC)
                }
            )
        }
    }
}
