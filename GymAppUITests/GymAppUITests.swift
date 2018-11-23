//
//  GymAppUITests.swift
//  GymAppUITests
//
//  Created by Bryan Albrecht on 21.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import XCTest

class GymAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBMICalculator() {
        let testHeight = 180;
        let testWeight = 100;
        let expectedValue = 30.8641975308642;
        
        let app = XCUIApplication()
        app.buttons["BMI Calculator Button"].tap()
        app.textFields["BMI Calculator Height TextBox"].tap()
        app.typeText(String(testHeight))
        app.textFields["BMI Calculator Weight TextBox"].tap()
        app.typeText(String(testWeight))
        app.buttons["BMI Calculator Calculate Button"].tap()
        let result = app.textFields["BMI Calculator Result TextBox"].value as? String
        XCTAssertNotNil(result)
        let resultDouble = Double(result!)!
        XCTAssertEqual(resultDouble,expectedValue,accuracy: 0.00001)
    }
}
