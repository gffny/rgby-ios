//
//  TestRgbyCchAPI.swift
//  rgby-iosTests
//
//  Created by John D. Gaffney on 12/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import XCTest
@testable import rgby_ios

class TestRgbyDataAPI: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetCoach() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let coach = api.getCoach()
        XCTAssertNotNil(coach)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
