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

@objc(TypeToNameTransformer)
class TypeToNameTransformer: ValueTransformer {
    open override class func transformedValueClass() -> AnyClass { NSString.self }
    open override class func allowsReverseTransformation() -> Bool { false }

    open override func transformedValue(_ value: Any?) -> Any? {
        guard let rawInt = (value as? NSNumber)?.intValue,
              let type = AccessWay.AccessType(rawValue: rawInt) else { return "" }
        
        switch type {
        case .mail:
            return "Mail address:"
        case .phone:
            return "Phone number:"
        case .telegram:
            return "Telegram:"
        case .website:
            return "Personal website:"
        }
    }
}

@objc(TypeToButtonTitleTransformer)
class TypeToButtonTitleTransformer: ValueTransformer {
    open override class func transformedValueClass() -> AnyClass { NSString.self }
    open override class func allowsReverseTransformation() -> Bool { false }

    open override func transformedValue(_ value: Any?) -> Any? {
        guard let rawInt = (value as? NSNumber)?.intValue,
              let type = AccessWay.AccessType(rawValue: rawInt) else { return "" }
        
        switch type {
        case .mail:
            return "Send"
        case .phone:
            return "Call"
        case .telegram:
            return "Open app"
        case .website:
            return "Go"
        }
    }
}
