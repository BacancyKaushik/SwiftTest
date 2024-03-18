//
//  AlertTests.swift
//  SwiftTestTests
//
//  Created by Kaushik on 18/03/24.
//

import XCTest
import ViewInspector
import SwiftUI

@testable import SwiftTest // Import your app's module

final class AlertTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    // Test case to verify dialog appearance
        func testDialogAppearance() {
            // Given
            let isActive = true

            // When
            let dialog = CustomDialog(isActive: .constant(isActive),
                                       title: "Test Dialog",
                                       message: "This is a test dialog.",
                                       buttonTitle: "Dismiss") { }

            // Then
            XCTAssertTrue(dialog.isActive)
        }

        // Test case to verify button action
        func testButtonAction() {
            // Given
            let isActive = true
            var actionExecuted = false

            // When
            let dialog = CustomDialog(isActive: .constant(isActive),
                                       title: "Test Dialog",
                                       message: "This is a test dialog.",
                                       buttonTitle: "Dismiss") {
                actionExecuted = true
            }

            // Simulate button tap
            dialog.action()

            // Then
            XCTAssertTrue(actionExecuted)
        }

        // Test case to verify animation
    func testAnimation() {
        // Given
        let isActive = true
        _ = CustomDialog(isActive: .constant(isActive),
                                   title: "Test Dialog",
                                   message: "This is a test dialog.",
                                   buttonTitle: "Dismiss") { }

        let expectation = XCTestExpectation(description: "Animation completed")

        // When
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Check the offset value after animation
            //XCTAssertEqual(dialog.offset, 0)
            expectation.fulfill()
        }

        // Wait for the animation completion
        wait(for: [expectation], timeout: 1.0)
    }

        // Test case to verify content
        func testDialogContent() {
            // Given
            let isActive = true
            let title = "Test Dialog"
            let message = "This is a test dialog."
            let buttonTitle = "Dismiss"

            // When
            let dialog = CustomDialog(isActive: .constant(isActive),
                                       title: title,
                                       message: message,
                                       buttonTitle: buttonTitle) { }

            // Then
            XCTAssertEqual(dialog.title, title)
            XCTAssertEqual(dialog.message, message)
            XCTAssertEqual(dialog.buttonTitle, buttonTitle)
        }
}
