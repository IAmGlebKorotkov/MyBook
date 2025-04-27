//
//  ChapterToolBarView.swift
//  BookClub
//
//  Created by Zayata Budaeva on 23.03.2025.
//

import SwiftUI

struct ChapterTabBarView: View {
    var onLeftArrowTapped: () -> Void
    var onContentTapped: () -> Void
    var onRightArrowTapped: () -> Void
    var onToolsTapped: () -> Void
    var onPlayTapped: () -> Void

    var body: some View {
        ZStack {
            Color.accentDarkC
            allButtons
        }
        .frame(height: 74)
    }

    private var leftButtons: some View {
        HStack(spacing: 24) {
            toolBarButton(image: .previous, action: onLeftArrowTapped)
            toolBarButton(image: .contents, action: onContentTapped)
            toolBarButton(image: .next, action: onRightArrowTapped)
            toolBarButton(image: .settings, action: onToolsTapped)
        }
    }

    private var playButton: some View {
        Button(action: onPlayTapped) {
            ZStack {
                Circle()
                    .fill(Color.accentLightC)
                    .frame(width: 50, height: 50)

                Image(.play)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.accentDarkC)
            }
        }
    }

    private func toolBarButton(image: ImageResource, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.whiteC)
        }
    }

    private var allButtons: some View {
        HStack {
            leftButtons
            Spacer()
            playButton
        }
        .padding(.leading, 25)
        .padding(.trailing, 16)
        .padding(.top, -32)
    }
}
