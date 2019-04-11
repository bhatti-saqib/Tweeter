//
//  TweeterTests.swift
//  TweeterTests
//
//  Created by Saqib Bhatti on 10/04/2019.
//  Copyright © 2019 Saqib Bhatti. All rights reserved.
//

import XCTest
@testable import Tweeter

class TweeterTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTextInputIsThere() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let post = storyboard.instantiateInitialViewController() as! PostViewController
        let _ = post.tweetTextView
        XCTAssertEqual("Please enter something", post.tweetTextView.text.count > 0)
    }


}
