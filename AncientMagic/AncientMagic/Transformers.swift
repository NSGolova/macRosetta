//
//  Transformers.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/20/21.
//

import Cocoa

@objc(OnlineColorTransformer)
class OnlineColorTransformer: ValueTransformer {
    open override class func transformedValueClass() -> AnyClass { NSColor.self }
    open override class func allowsReverseTransformation() -> Bool { false }

    open override func transformedValue(_ value: Any?) -> Any? {
        return (value as? NSNumber)?.boolValue == true ? NSColor.green : NSColor.red
    }
}
