//
//  MethodObject.swift
//  DocGenerator
//
//  Created by Alexey Golovenkov on 02.04.16.
//  Copyright © 2016 Alex & Igor. All rights reserved.
//

import Cocoa

/// Documented method of class/protocol
class MethodObject: DocumentableObject {

	 /// Type the method returns
	var returnType: String?
	var parameters: [MethodParameter] = []
	
	// - MARK: Initializators 
	
	override init() {
		super.init()
		
		self.type = .Method
	}
	
	convenience init(name: String, returnType: String, brief: String? = nil) {
		self.init()
		self.name = name
		self.returnType = returnType
		self.briefDescription = brief
	}

	// - MARK: Public methods
	
	override func jsonDescription() -> [String : AnyObject] {
		var json = super.jsonDescription()
		
		if returnType != nil {
			json[generatorTagReturnType] = returnType
		}
		json[generatorTagParamList] = parametersJson()
		
		return json
	}
	
	// - MARK: Service methods
	
	func parametersJson() -> [[String: AnyObject]] {
		var json: [[String: AnyObject]] = []
		
		for parameter in parameters {
			json.append(parameter.jsonDescription())
		}
		return json
	}
}
