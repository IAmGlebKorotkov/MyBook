//
//  FontExtension.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 17.03.2025.
//

import SwiftUI

extension Font {
    static let title = Font.custom("AlumniSans-Bold", size: 96)
    static let header1 = Font.custom("AlumniSans-Bold", size: 48)
    static let header2 = Font.custom("AlumniSans-Bold", size: 24)
    static let header3 = Font.custom("AlumniSans-Bold", size: 14)

    static let bodyC = Font.custom("VelaSans-Regular", size: 16)
    static let bodySmall = Font.custom("VelaSans-Regular", size: 14)
    static let footnote = Font.custom("VelaSans-Regular", size: 10)

    static let text = Font.custom("georgia", size: 14)
    static let quote = Font.custom("georgia", size: 16)
}

extension Font {
    var adaptive: Font {
        let baseSize: CGFloat
        switch self {
        case .header2: baseSize = 20
        case .bodySmall: baseSize = 14
        case .body: baseSize = 16
        default: baseSize = 16
        }
        return Font.system(
            size: baseSize * UIScreen.main.bounds.width / 390,
            weight: self.weight
        )
    }

    private var weight: Weight {
        switch self {
        case .header2: return .semibold
        default: return .regular
        }
    }
}
