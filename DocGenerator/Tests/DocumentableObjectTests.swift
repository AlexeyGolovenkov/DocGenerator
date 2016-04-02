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
	
	func testObjectInitialization() {
		let namedOnlyObject = DocumentableObject(name: "name")
		XCTAssertTrue(namedOnlyObject.name == "name", "Wrong object name: \(namedOnlyObject.name)")
		XCTAssertNil(namedOnlyObject.briefDescription, "Description should be nil")
	}
	
    func testRootJson() {
		let object = DocumentableObject(name: "Testable object", brief: "Brief description");
		
		let jsonDescription = object.jsonDescription()
		
		XCTAssertNotNil(jsonDescription, "JSON should NOT be nil")
		XCTAssertTrue(jsonDescription.count == 2, "JSON contains \(jsonDescription.count) objects instead of 2")
		XCTAssertTrue((jsonDescription["brief"] as! String) == "Brief description", "Wrong value of name field: \(jsonDescription["name"])")
		XCTAssertTrue((jsonDescription["name"] as! String) == "Testable object", "Wrong value of brief field: \(jsonDescription["brief"])")
    }
	
	func testMethodJson() {
		let method = MethodObject()
		method.name = "firstMethod"
		method.briefDescription = "First method"
		method.returnType = "void"
		
		XCTAssertTrue(method.type == .Method, "Wrong object type: \(method.type?.title())")
		let jsonDescription = method.jsonDescription()
		XCTAssertTrue(jsonDescription.count == 5, "Wrong number of data objects: \(jsonDescription.count)")
		XCTAssertTrue((jsonDescription["brief"] as! String) == "First method", "Wrong description: \(jsonDescription["brief"])")
		XCTAssertTrue((jsonDescription["name"] as! String) == "firstMethod", "Wrong method name: \(jsonDescription["name"])")
		XCTAssertTrue((jsonDescription["type"] as! String) == "Method", "Wrong object type: \(jsonDescription["type"])")
		
		// TODO: test method with parameters
	}
}
