//
//  BookDetailsProgressView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 24.03.2025.
//

import SwiftUI

struct BookDetailsProgressView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("ПРОЧИТАНО")
                .font(.header2)
                .foregroundColor(.accentDarkC)
            ProgressLineView(progress: 0.5, width: 1)
                .frame(height: 4)
        }
    }
}

#Preview {
    BookDetailsProgressView()
}
