//
//  ChapterScreen.swift
//  BookClub
//
//  Created by Zayata Budaeva on 23.03.2025.
//

import SwiftUI

struct ChapterView: View {
    private let chapterData = ChapterTextData.codeDaVinciProlog
    @State private var showContentsModal = false
    @State private var showSettingsModal = false
    @State private var fontSize: Int = 14
    @State private var lineHeightMultiple: CGFloat = 1.3
    @State private var textHeight: CGFloat = .zero

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        content
            .sheet(isPresented: $showContentsModal) {
                ChapterContentsModalView(isPresented: $showContentsModal)
                    .presentationDragIndicator(.hidden)
            }
    }
}

extension ChapterView {
    private var content: some View {
        ZStack {
            Color.backgroundC

            VStack {
                header
                chapterText
            }

            if showSettingsModal {
                settingsModal
            }
        }
    }

    private var header: some View {
        ZStack {
            HStack {
                BackButton(color: .accentDarkC) {
                    dismiss()
                }
                Spacer()
            }

            chapterTitle
        }
        .padding(.horizontal, 16)
    }

    private var chapterText: some View {
        ScrollView {
            text
                .padding(.horizontal, 16)
                .padding(.top, 8)
        }
        .safeAreaInset(edge: .bottom) {
            bottomToolBar
                .ignoresSafeArea()
                .frame(height: 105)
                .background(.accentDarkC)
        }
    }

    private var chapterTitle: some View {
        VStack {
            Text(chapterData.title)
                .font(.header2)
                .foregroundColor(.accentDarkC)

            Text(chapterData.chapter)
                .font(.bodySmall)
                .foregroundColor(.accentDarkC)
        }
        .frame(maxWidth: .infinity)
    }

    private var text: some View {
        CustomingTextView(
            text: chapterData.text,
            fontSize: CGFloat(fontSize),
            lineHeightMultiple: lineHeightMultiple,
            dynamicHeight: $textHeight
        )
        .frame(height: textHeight)
    }

    private var bottomToolBar: some View {
        ChapterTabBarView(
            onLeftArrowTapped: {},
            onContentTapped: {
                showContentsModal = true
            },
            onRightArrowTapped: {},
            onToolsTapped: {
                showSettingsModal = true
            },
            onPlayTapped: {}
        )
        .background(.accentDarkC)
    }

    private var settingsModal: some View {
        VStack {
            Spacer()
            ChapterSettingsView(
                present: $showSettingsModal,
                fontSize: $fontSize,
                lineHeight: $lineHeightMultiple
            )
            .frame(height: 200)
            .padding(.bottom, 20)
            .transition(.move(edge: .bottom))
            .zIndex(1)
        }
        .ignoresSafeArea()
    }
}
