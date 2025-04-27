//
//  LibraryView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 19.03.2025.
//

import SwiftUI

struct ScrollLibraryBookView: View {
    @State private var images: [String] = ["BookWelcomeScreen 1", "BookWelcomeScreen 2", "BookWelcomeScreen 3"]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("НОВИНКИ")
                .font(.header2)
                .foregroundColor(.accentDarkC)
                .padding(.leading)
            InfiniteBookView(items: images, width: 256, spacing: 8, id: \.self) { item in
                Image(item)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 256, height: 256)
                    .cornerRadius(8)
            }
            .frame(height: 256)
        }
    }
}
