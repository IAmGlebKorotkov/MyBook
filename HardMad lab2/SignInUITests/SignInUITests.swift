//
//  SignInUITests.swift
//  SignInUITests
//
//  Created by Gleb Korotkov on 23.03.2025.
//

import XCTest

class SignInUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testAllElementsAreDisplayed() {
        XCTAssertTrue(app.textFields["emailTextField"].exists, "Поле 'Почта' не найдено")
        XCTAssertTrue(app.secureTextFields["passwordTextField"].exists, "Поле 'Пароль' не найдено")
        XCTAssertTrue(app.buttons["loginButton"].exists, "Кнопка 'Войти' не найдена")
        XCTAssertTrue(app.images["BookWelcomeScreen 1"].exists, "Изображение 'BookWelcomeScreen 1' не найдено")
    }

    func testEmptyStateAndErrorHandling() {
        print(app.debugDescription)
        XCTAssertFalse(app.buttons["loginButton"].isEnabled, "Кнопка 'Войти' доступна при пустых полях")

        let emailTextField = app.textFields["emailTextField"]
        XCTAssertTrue(emailTextField.waitForExistence(timeout: 5), "Поле 'Почта' не найдено")
        emailTextField.tap()
        emailTextField.typeText("invalid-email")

        let passwordTextField = app.secureTextFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 5), "Поле 'Пароль' не найдено")
        passwordTextField.tap()
        passwordTextField.typeText("123")

        XCTAssertTrue(app.buttons["loginButton"].isEnabled, "Кнопка 'Войти' недоступна при заполненных полях")

        app.buttons["loginButton"].tap()
    }

    func testSuccessfulLoginAndNavigation() {
        let emailTextField = app.textFields["emailTextField"]
        XCTAssertTrue(emailTextField.waitForExistence(timeout: 5), "Поле 'Почта' не найдено")
        emailTextField.tap()
        emailTextField.typeText("user@example.com")

        let passwordTextField = app.secureTextFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 5), "Поле 'Пароль' не найдено")
        passwordTextField.tap()
        passwordTextField.typeText("password123")

        app.buttons["loginButton"].tap()
    }
}
