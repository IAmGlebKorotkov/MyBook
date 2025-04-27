//
//  ScrollView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 15.03.2025.
//

import SwiftUI

struct ScrollBookView: View {
    @State private var images: [String] = ["BookWelcomeScreen 1", "BookWelcomeScreen 2", "BookWelcomeScreen 3"]

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                InfiniteCarouselView(items: images, width: 172, spacing: 8, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(4)
                        .accessibilityIdentifier("carouselImage_\(item)")
                }
                .frame(height: 270)
            }
            .padding(.top, 97)
        }
    }
}
