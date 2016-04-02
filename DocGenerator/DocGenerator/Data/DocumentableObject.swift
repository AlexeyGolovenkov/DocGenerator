//
//  DocumentableObject.swift
//  DocGenerator
//
//  Created by Alexey Golovenkov on 27.03.16.
//  Copyright © 2016 Alex & Igor. All rights reserved.
//

import Cocoa

/**
Possible types of the object
*/
enum DocumentableObjectType {
	case Class
	case Enum
	case Method
	case MethodParameter
	case Protocol
	// TODO: Add new types
	
	func title () -> String {
		switch self {
		case .Class:
			return "Class"
		case .Protocol:
			return "Protocol"
		case .Method:
			return "Method"
		case .Enum:
			return "Enum"
		case .MethodParameter:
			return "Parameter"
		}
	}
}

/// Object that can be documented - class, method, enum etc.
class DocumentableObject: NSObject {
	
		/// Title of the object
	var name: String?
	
		/// Type of the object
	var type: DocumentableObjectType?
	
		/// Short decription of the object
	var briefDescription: String?
	
	// - MARK: Initialization
	
	override init() {
		super.init()
	}
	
	init(name: String, brief: String? = nil) {
		super.init()
		self.name = name
		self.briefDescription = brief
	}
	
	
	// - MARK: Public methods
	
	/**
	Description of the object that can be sent to HTML generator
	
	- returns: Dictionary with all significant values
	*/
	func jsonDescription() -> [String: AnyObject] {
		var json : [String: AnyObject] = [:]
		
		if self.name != nil {
			json[generatorTagName] = self.name!
		}
		
		if self.briefDescription != nil {
			json[generatorTagBrief] = self.briefDescription!;
		}
		
		if self.type != nil {
			json[generatorTagType] = self.type!.title()
		}
		
		return json
	}
}
