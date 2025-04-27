//
//  BookDetails.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 24.03.2025.
//

import SwiftUI

struct BookDetailsView: View {
    var bookImage: Image
    var bookName: String
    var bookAuthor: String
    var chapterCount: Int

    private let imageHeight: CGFloat = 380
    private let gradientHeight: CGFloat = 190

    @State private var isNavigatingToChapter = false
    @Binding var tabSelection: Int
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .top) {
            Color.backgroundC
                .edgesIgnoringSafeArea(.all)

            BookImage(bookImage: bookImage, imageHeight: imageHeight, safeAreaTop: safeAreaTop())

            HStack {
                BackButton(color: .whiteC) {
                    tabSelection = 1
                }
                .padding(.top, 66)
                .padding(.leading, 16)
                .contentShape(Rectangle())
                Spacer()
            }
            .zIndex(1)

            bookDetailsScrollView
        }
        .background(Color.backgroundC)
        .edgesIgnoringSafeArea(.top)
        .fullScreenCover(isPresented: $isNavigatingToChapter) {
            ChapterView()
                .ignoresSafeArea()
                .padding(.top, 4)
                .background(Color.backgroundC)
        }
    }

    private func safeAreaTop() -> CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    }
}

extension BookDetailsView {
    private var bookDetailsScrollView: some View {
        ScrollView {
            VStack(spacing: -32) {
                GradientView(imageHeight: imageHeight, gradientHeight: gradientHeight)
                VStack(spacing: 12) {
                    HStack(spacing: 8) {
                        Button(
                            action: {
                                isNavigatingToChapter = true
                        },
                            label: {
                                bookDetailsButton(
                                    backColor: Color.accentDarkC,
                                    foreColor: Color.whiteC,
                                    text: "Читать",
                                    icon: Image(.play),
                                    width: 179
                                )
                            }
                        )

                        bookDetailsButton(
                            backColor: Color.accentLightC,
                            foreColor: Color.accentDarkC,
                            text: "В избранное",
                            icon: Image(.bookmarks),
                            width: 169
                        )
                    }
                    .padding(.top, -42)
                    VStack(alignment: .leading, spacing: 16) {
                        BookDetailsTextView(
                            bookName: bookName,
                            bookAuthor: bookAuthor
                        )
                        BookDetailsProgressView()
                        BookChapterContents()
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                .background(Color.backgroundC)
            }
            .padding(.top, 44)
        }
    }

    private func bookDetailsButton(backColor: Color, foreColor: Color, text: String, icon: Image,
                                   width: CGFloat) -> some View {
        HStack(spacing: 8) {
            icon
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(foreColor)
            Text(text)
                .font(Font.custom("VelaSans-Bold", size: 17))
                .foregroundColor(foreColor)
        }
        .frame(width: width.adaptive, height: 50)
        .background(backColor)
        .cornerRadius(12)
    }

    struct BookImage: View {
        var bookImage: Image
        var imageHeight: CGFloat
        var safeAreaTop: CGFloat

        var body: some View {
            GeometryReader { geo in
                bookImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: imageHeight + safeAreaTop)
                    .offset(y: -safeAreaTop)
            }
            .frame(height: imageHeight)
            .clipped()
        }
    }

    struct GradientView: View {
        var imageHeight: CGFloat
        var gradientHeight: CGFloat

        var body: some View {
            VStack {
                Spacer()
                    .frame(height: imageHeight - gradientHeight)

                LinearGradient(
                    gradient: Gradient(colors: [.clear, .backgroundC]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: gradientHeight)
            }
        }
    }
}
