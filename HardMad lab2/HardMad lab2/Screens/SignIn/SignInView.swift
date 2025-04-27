//
//  ContentView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 14.03.2025.
//

import SwiftUI

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

struct SignInView: View {
    @State private var value: CGFloat = 0
    @State private var isKeyboardVisible: Bool = false
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in

                let screenHeight = geometry.size.height
                if screenHeight > 650 {
                    ScrollBookView()
                        .ignoresSafeArea()
                }

                TextSignInView()
                    .padding(.vertical, screenHeight * (screenHeight > 650 ? 0.432 : 0.352))
                    .padding(.leading, 16)

                LoginScreen(totalHeight: screenHeight)
                    .ignoresSafeArea()
                    .padding(.horizontal, 16)
                    .padding(.vertical, screenHeight * (screenHeight > 650 ? 0.75 : 0.71))
                    .offset(y: -value)
                    .onAppear {
                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                                               object: nil, queue: .main) { notification in
                            guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                                    as? CGRect else {
                                print("Could not get keyboard frame")
                                return
                            }

                            self.value = keyboardFrame.height * 0
                            self.isKeyboardVisible = true
                        }

                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                                               object: nil, queue: .main) { _ in
                            self.isKeyboardVisible = false
                            self.value = 0
                        }
                    }
            }
            .background(Color.accentDarkC)
        }
    }
}
