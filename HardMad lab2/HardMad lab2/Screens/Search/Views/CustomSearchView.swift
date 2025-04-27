//
//  CustomSearchView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 18.03.2025.
//

import SwiftUI

struct CustomSearchView: View {
    @State private var searchText: String = ""
    @Binding var isSearchButtonTapped: Bool

    var body: some View {
        HStack(spacing: 10.adaptive) {
            if !isSearchButtonTapped {
                Button(
                    action: {
                        isSearchButtonTapped.toggle()
                    },
                    label: {
                        Image(.search)
                            .resizable()
                            .frame(
                                width: 20.adaptive,
                                height: 20.adaptive
                            )
                            .foregroundColor(.accentMediumC)
                    }
                )
            }
            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    Text("Поиск по книгам")
                        .foregroundColor(.accentMediumC)
                        .padding(5.adaptive)
                }

                TextField("", text: $searchText)
                    .foregroundColor(.black)
                    .padding(5.adaptive)
            }
            Spacer()
            if isSearchButtonTapped {
                Button(
                    action: {
                        isSearchButtonTapped.toggle()
                        searchText = ""
                    },
                    label: {
                        Image(.close)
                            .resizable()
                            .frame(
                                width: 20.adaptive,
                                height: 20.adaptive
                            )
                            .foregroundColor(.accentMediumC)
                    }
                )
                .padding(.trailing, 10.adaptive)
            }
        }
        .padding(.leading, 20.adaptive)
        .frame(maxWidth: .infinity)
        .frame(height: 44.adaptive)
        .background(Color(.whiteC))
        .cornerRadius(10.adaptive)
        .overlay(
            RoundedRectangle(cornerRadius: 10.adaptive)
                .stroke(Color.accentMediumC, lineWidth: 1)
        )
    }
}
