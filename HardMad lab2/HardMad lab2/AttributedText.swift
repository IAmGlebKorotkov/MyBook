//
//  AttributedText.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 20.03.2025.
//

import SwiftUI

struct AttributedText: UIViewRepresentable {
    var text: String
    var font: UIFont
    var lineHeight: CGFloat
    var color: UIColor

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.clipsToBounds = false
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight

        let baselineOffset = (lineHeight - font.lineHeight) / 2

        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .font: font,
                .foregroundColor: color,
                .paragraphStyle: paragraphStyle,
                .baselineOffset: baselineOffset
            ]
        )

        uiView.attributedText = attributedString
    }
}
