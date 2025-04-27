//
//  UniversalInputView.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 15.03.2025.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    @State private var path = NavigationPath()

    var totalHeight: CGFloat

    private var isLoginEnabled: Bool {
        !email.isEmpty && !password.isEmpty
    }

    private var loginForm: some View {
        VStack(spacing: 4) {
            TextFieldView(
                email: $email,
                password: $password,
                isPasswordVisible: $isPasswordVisible,
                totalHeight: totalHeight * (88 / 751)
            )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.accentMediumC, lineWidth: 1)
            )
            .frame(height: totalHeight * (88 / 751))

            Button(
                action: {
                    path.append(Path.info)
                },
                label: {
                    Text("Войти")
                        .font(.headline)
                        .foregroundColor(isLoginEnabled ? .black : .accentLightC)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isLoginEnabled ? Color(.whiteC) : Color(.accentMediumC))
                        .cornerRadius(12)
                        .frame(height: totalHeight * (50 / 751))
                }
            )
            .accessibilityIdentifier("loginButton")
            .padding(.top, 28)
            .disabled(!isLoginEnabled)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            print("LoginScreen height: \(totalHeight)")
        }
    }

    var body: some View {
        NavigationStack(path: $path) {
            loginForm
                .navigationDestination(for: Path.self) { value in
                    switch value {
                    case .info:
                        TabbarView()
                            .navigationBarHidden(true)
                            .accessibilityIdentifier("TabbarView")
                    }
                }
        }
    }
}

extension LoginScreen {
    enum Path {
        case info
    }

    struct TextFieldView: View {
        @Binding var email: String
        @Binding var password: String
        @Binding var isPasswordVisible: Bool
        var totalHeight: CGFloat

        var body: some View {
            VStack(spacing: 0) {
                customTextField(
                    title: "Почта",
                    placeholder: "Введите почту",
                    text: $email,
                    hasClearButton: true,
                    height: totalHeight / 2
                )
                    .accessibilityIdentifier("emailTextField")

                Divider()
                    .background(Color.accentMediumC)

                customTextField(
                    title: "Пароль",
                    placeholder: "Введите пароль",
                    text: $password,
                    isSecure: true,
                    hasVisibilityToggle: true,
                    height: totalHeight / 2
                )
                .accessibilityIdentifier("passwordTextField")
            }
            .padding(.horizontal, 16)
        }

        func customTextField(
            title: String,
            placeholder: String,
            text: Binding<String>,
            isSecure: Bool = false,
            hasClearButton: Bool = false,
            hasVisibilityToggle: Bool = false,
            height: CGFloat
        ) -> some View {
            VStack {
                HStack {
                    Text(title)
                        .font(.bodySmall)
                        .foregroundColor(.accentMediumC)
                        .frame(width: 100, alignment: .leading)

                    Spacer()

                    Group {
                        if isSecure && !isPasswordVisible {
                            SecureField(placeholder, text: text)
                                .foregroundColor(.accentLightC)
                                .font(.bodySmall)
                                .autocapitalization(.none)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .accessibilityIdentifier("passwordTextField")
                        } else {
                            TextField(placeholder, text: text)
                                .foregroundColor(.accentLightC)
                                .font(.bodySmall)
                                .autocapitalization(.none)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .accessibilityIdentifier("emailTextField")
                        }
                    }

                    if hasClearButton && !text.wrappedValue.isEmpty {
                        Button(
                            action: { text.wrappedValue = "" },
                            label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.accentLightC)
                            }
                        )
                        .accessibilityIdentifier("clearEmailButton")
                    }

                    if hasVisibilityToggle && !text.wrappedValue.isEmpty {
                        Button(
                            action: { isPasswordVisible.toggle() },
                            label: {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.accentLightC)
                            }
                        )
                        .accessibilityIdentifier("togglePasswordVisibilityButton")
                    }
                }
                .frame(height: height)
            }
        }
    }
}
