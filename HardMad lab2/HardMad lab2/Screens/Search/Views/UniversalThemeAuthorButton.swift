//
//  SwiftUIView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 18.03.2025.
//

import SwiftUI

struct UniversalThemeAuthorButton: View {
    @Binding var textButton: String
    @Binding var isSearchButtonTapped: Bool
    var universalImage: Image?
    var iconImage: Image?
    var defaultImage: Image = Image(systemName: "person.circle.fill")
    var buttonType: String

    private var buttonWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        switch buttonType {
        case "Theme": return (screenWidth - 48.adaptive) / 2
        default: return screenWidth - 32.adaptive
        }
    }

    private var buttonHeight: CGFloat {
        switch buttonType {
        case "Theme": return 48.adaptive
        case "Author": return 72.adaptive
        default: return 56.adaptive
        }
    }

    var body: some View {
        Button(
            action: {
                isSearchButtonTapped.toggle()
            },
            label: {
                HStack {
                    switch buttonType {
                    case "Theme":
                        ThemeView(bookName: textButton)
                    case "Author":
                        AuthorView(
                            authorName: textButton,
                            authorImage: universalImage,
                            defaultImage: defaultImage
                        )
                    case "Recent":
                        RecentView(
                            reasonName: textButton,
                            recentImage: universalImage,
                            recentImageButton: iconImage,
                            defaultImage: defaultImage
                        )
                    default:
                        ThemeView(bookName: textButton)
                    }
                }
                .padding(10.adaptive)
                .frame(width: buttonWidth, height: buttonHeight, alignment: .leading)
                .background(Color.accentLightC)
                .cornerRadius(8.adaptive)
            }
        )
        .buttonStyle(PlainButtonStyle())
    }
}

extension UniversalThemeAuthorButton {
    struct ThemeView: View {
        var bookName: String

        var body: some View {
            Text(bookName)
                .font(.bodySmall.adaptive)
                .foregroundColor(.accentDarkC)
                .padding(.leading, 5.adaptive)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
    }

    struct AuthorView: View {
        var authorName: String
        var authorImage: Image?
        var defaultImage: Image

        var body: some View {
            HStack(spacing: 12.adaptive) {
                (authorImage ?? defaultImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48.adaptive, height: 48.adaptive)
                    .cornerRadius(24.adaptive)

                Text(authorName)
                    .font(.body.adaptive)
                    .foregroundColor(.accentDarkC)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
        }
    }

    struct RecentView: View {
        var reasonName: String
        var recentImage: Image?
        var recentImageButton: Image?
        var defaultImage: Image

        var body: some View {
            HStack(spacing: 12.adaptive) {
                (recentImage ?? defaultImage)
                    .resizable()
                    .frame(width: 20.adaptive, height: 20.adaptive)
                    .foregroundColor(.accentDarkC)

                Text(reasonName)
                    .font(.bodySmall.adaptive)
                    .foregroundColor(.accentDarkC)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                Spacer()

                (recentImageButton ?? defaultImage)
                    .resizable()
                    .frame(width: 20.adaptive, height: 20.adaptive)
                    .foregroundColor(.accentDarkC)
            }
        }
    }
}
