//
//  Search.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 21.03.2025.
//

extension CGFloat {
    var adaptive: CGFloat {
        UIScreen.main.bounds.width * self / 390
    }
}

extension Int {
    var adaptive: CGFloat {
        CGFloat(self).adaptive
    }
}
