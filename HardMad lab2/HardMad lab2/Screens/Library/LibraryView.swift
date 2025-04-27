//
//  BookLisrLibraryView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 20.03.2025.
//

import SwiftUI

struct LibraryView: View {
    @Binding var tabSelection: Int
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16.adaptive) {
                Text("БИБЛИОТЕКА")
                    .font(.header1)
                    .foregroundColor(.secondaryC)
                    .padding(.leading, 16.adaptive)
                ScrollLibraryBookView()
                BookLibraryScrollView(tabSelection: $tabSelection)
            }
        }
        .background(.backgroundC)
    }
}
