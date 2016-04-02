//
//  ClassObject.swift
//  DocGenerator
//
//  Created by Alexey Golovenkov on 02.04.16.
//  Copyright © 2016 Alex & Igor. All rights reserved.
//

import Cocoa

/// Documented class
class ClassObject: DocumentableObject {

	 /// Array of methods of the class
	var methods: [MethodObject] = [] // TODO: Change type
	
	override init() {
		super.init()
		
		self.type = .Class
	}
	
	override func jsonDescription() -> [String : AnyObject] {
		var json = super.jsonDescription()
		
		json[generatorTagParamList] = methodsJson()
		
		return json
	}
	
	// - MARK: Private methods
	private func methodsJson() -> [[String: AnyObject]] {
		var json: [[String: AnyObject]] = []
		
		for method in methods {
			json.append(method.jsonDescription())
		}
		
		return json
	}
}
