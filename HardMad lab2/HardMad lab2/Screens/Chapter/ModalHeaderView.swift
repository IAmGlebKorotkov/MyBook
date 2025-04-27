//
//  ModalHeaderView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 25.03.2025.
//

import SwiftUI

struct ModalHeaderView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 2)
                .fill(.accentMediumC)
                .frame(width: 40, height: 4)
                .padding(.top, 8)
            ZStack {
                HStack {
                    BackButton(color: .accentDarkC) {
                        isPresented = false
                    }
                    Spacer()
                }

                Text("ОГЛАВЛЕНИЕ")
                    .font(.header2)
                    .foregroundColor(.accentDarkC)
            }
            .padding(.horizontal, 16)
            Divider()
                .frame(height: 0.1)
                .background(Color.accentMediumC)
                .padding(.vertical, -3)
        }
    }
}
