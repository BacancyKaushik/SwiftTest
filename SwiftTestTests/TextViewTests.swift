//
//  TextViewTests.swift
//  SwiftTestTests
//
//  Created by Kaushik on 18/03/24.
//

import XCTest
import ViewInspector

@testable import SwiftTest // Import your app's module

final class TextViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testTextViewContent() {
            let textView = TextView() // Make the TextView mutable
            
            // Check if the text fields are initially empty
            XCTAssertEqual(textView.$firstTXF.wrappedValue, "") // Access with $
            XCTAssertEqual(textView.$secondTXT.wrappedValue, "") // Access with $
        }

        func testFontChange() {
            let textView = TextView() // Make the TextView mutable
            
            // Change font of the first text view
            textView.fontFirstTXF = .custom("NotoSansCondensed-Medium", size: 20)
            XCTAssertEqual(textView.fontFirstTXF, .custom("NotoSansCondensed-Medium", size: 20))

            // Change font of the second text view
            textView.fontSecondTXF = .custom("FONTSPRINGDEMO-ProximaNovaExCnMediumRegular", size: 18)
            XCTAssertEqual(textView.fontSecondTXF, .custom("FONTSPRINGDEMO-ProximaNovaExCnMediumRegular", size: 18))
        }

    
}
