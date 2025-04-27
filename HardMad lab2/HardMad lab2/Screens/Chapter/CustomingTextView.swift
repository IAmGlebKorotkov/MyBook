//
//  ChapterCustomTextView.swift
//  BookClub
//
//  Created by Zayata Budaeva on 24.03.2025.
//

import SwiftUI

struct CustomingTextView: UIViewRepresentable {
    let text: String
    let fontSize: CGFloat
    let lineHeightMultiple: CGFloat
    @Binding var dynamicHeight: CGFloat

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.paragraphSpacing = 0
        paragraphStyle.alignment = .left

        let baseFont = UIFont(name: "Georgia", size: fontSize) ?? .systemFont(ofSize: fontSize)
        let italicFont = UIFont(name: "Georgia-Italic", size: fontSize) ?? .italicSystemFont(ofSize: fontSize)

        let attributedText = NSMutableAttributedString()
        var remainingText = text[...]

        while let match = findItalic(in: remainingText) {
            let before = String(remainingText[..<match.range.lowerBound])
            attributedText.append(NSAttributedString(string: before, attributes: [
                .font: baseFont,
                .paragraphStyle: paragraphStyle
            ]))

            let italic = String(match.text)
            attributedText.append(NSAttributedString(string: italic, attributes: [
                .font: italicFont,
                .paragraphStyle: paragraphStyle
            ]))

            remainingText = remainingText[match.range.upperBound...]
        }

        attributedText.append(NSAttributedString(string: String(remainingText), attributes: [
            .font: baseFont,
            .paragraphStyle: paragraphStyle
        ]))

        uiView.attributedText = attributedText

        DispatchQueue.main.async {
            let fittingWidth = uiView.bounds.width
            uiView.textContainer.size = CGSize(width: fittingWidth, height: .greatestFiniteMagnitude)
            let size = uiView.sizeThatFits(CGSize(width: fittingWidth, height: .greatestFiniteMagnitude))

            if abs(size.height - dynamicHeight) > 1 {
                dynamicHeight = size.height
            }
        }
    }

    private func findItalic(in text: Substring) -> (text: Substring, range: Range<String.Index>)? {
        let patterns = [
            "(?s)\\*(.*?)\\*",
            "(?s)_(.*?)_"
        ]

        for pattern in patterns {
            if let range = text.range(of: pattern, options: .regularExpression) {
                let match = text[range]
                let trimmed = match.dropFirst().dropLast()
                return (text: trimmed, range: range)
            }
        }
        return nil
    }
}
