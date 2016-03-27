//
//  DocumentableObject.swift
//  DocGenerator
//
//  Created by Alexey Golovenkov on 27.03.16.
//  Copyright © 2016 Alex & Igor. All rights reserved.
//

import Cocoa

/// Object that can be documented - class, method, enum etc.
class DocumentableObject: NSObject {
	
	/**
	Description of the object that can be sent to HTML generator
	
	- returns: Dictionary with all significant values
	*/
	func jsonDescription() -> [String: AnyObject] {
		return [:]
	}
}
