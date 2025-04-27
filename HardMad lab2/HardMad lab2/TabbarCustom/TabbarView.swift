//
//  TabbarCustomView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 17.03.2025.
//

import SwiftUI

struct TabbarView: View {
    @State private var tabSelection = 1

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height

                if tabSelection != 3 {
                    viewForSelectedTab()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                    VStack {
                        Spacer()
                        CustomTabbarView(tabSelection: $tabSelection)
                            .accessibilityIdentifier("TabbarView")
                    }
                    .padding(.bottom, (screenHeight > 650 ? 5 : 16))
                } else {
                    BookDetailsView(
                        bookImage: Image("BookWelcomeScreen 2"),
                        bookName: "КОД ДА ВИНЧИ",
                        bookAuthor: "Дэн Браун",
                        chapterCount: 7,
                        tabSelection: $tabSelection
                    )
                    .transition(.identity)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    @ViewBuilder
    private func viewForSelectedTab() -> some View {
        switch tabSelection {
        case 1: LibraryView(tabSelection: $tabSelection)
        case 2: SearchView(tabSelection: $tabSelection)
        case 4: BookMarkView(tabSelection: $tabSelection)
        case 5: SignInView()
        default: EmptyView()
        }
    }
}
