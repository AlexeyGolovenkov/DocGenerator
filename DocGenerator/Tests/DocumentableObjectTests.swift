//
//  Tests.swift
//  Tests
//
//  Created by Alexey Golovenkov on 26.03.16.
//  Copyright © 2016 Alex & Igor. All rights reserved.
//

import XCTest

@testable import DocGenerator

class DocumentableObjectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJson() {
        let object = DocumentableObject.init()
		object.briefDescription = "Brief description"
		object.name = "Testable object"
		
		let data = object.jsonDescription()
		
		XCTAssertNotNil(data, "JSON should NOT be nil")
		XCTAssertTrue(data.count == 2, "JSON contains \(data.count) objects instead of 2")
		XCTAssertTrue((data["name"] as! String) == "Brief description", "Wrong value of name field: \(data["name"])")
		XCTAssertTrue((data["brief"] as! String) == "Testable object", "Wrong value of brief field: \(data["brief"])")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
