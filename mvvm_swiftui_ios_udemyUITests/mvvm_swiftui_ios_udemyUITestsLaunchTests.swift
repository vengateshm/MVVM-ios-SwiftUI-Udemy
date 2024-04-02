//
//  mvvm_swiftui_ios_udemyUITestsLaunchTests.swift
//  mvvm_swiftui_ios_udemyUITests
//
//  Created by Vengatesh on 02/01/24.
//

import XCTest

final class mvvm_swiftui_ios_udemyUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
