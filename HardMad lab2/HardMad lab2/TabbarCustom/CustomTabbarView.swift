//
//  CustomTabbarView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 17.03.2025.
//

import SwiftUI

struct CustomTabbarView: View {
    @Binding var tabSelection: Int

    let tabbarItems: [String] = [
        "Library",
        "Search",
        "Play",
        "Bookmarks",
        "Log Out"
    ]

    var body: some View {
        ZStack {
            backgroundCapsule
            tabbarButtons
        }
        .padding(.horizontal)
    }

    private var backgroundCapsule: some View {
        Capsule()
            .frame(height: 64)
            .foregroundColor(Color(.accentDarkC))
            .shadow(radius: 2)
    }

    private var tabbarButtons: some View {
        HStack {
            ForEach(0..<tabbarItems.count, id: \.self) { index in
                tabButton(for: index)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(height: 64)
    }

    @ViewBuilder
    private func tabButton(for index: Int) -> some View {
        Button {
            tabSelection = index + 1
        } label: {
            VStack {
                iconView(for: index)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }

    @ViewBuilder
    private func iconView(for index: Int) -> some View {
        if tabbarItems[index] == "Play" {
            playButton
        } else {
            regularIcon(for: index)
        }
    }

    private var playButton: some View {
        ZStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(.secondaryC)
            Image("Play")
                .foregroundColor(.white)
        }
    }

    private func regularIcon(for index: Int) -> some View {
        Image(tabbarItems[index])
            .foregroundColor(index + 1 == tabSelection ? Color(.whiteC) : .accentMediumC)
    }
}

#Preview {
    CustomTabbarView(tabSelection: .constant(1))
        .padding()
}
