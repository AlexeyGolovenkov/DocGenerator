//
//  MethodParameter.swift
//  DocGenerator
//
//  Created by Alexey Golovenkov on 02.04.16.
//  Copyright © 2016 Alex & Igor. All rights reserved.
//

import Cocoa

class MethodParameter: DocumentableObject {

	var valueType: String = "void"
	
	override init() {
		super.init()
		
		self.type = .MethodParameter
	}
	
	override func jsonDescription() -> [String : AnyObject] {
		var json = super.jsonDescription()
		
		json[generatorTagType] = valueType
		
		return json
	}
}
