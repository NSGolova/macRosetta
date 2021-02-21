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
    open override class func allowsReverseTransformation() -> Bool { true }
    
    private var namesMap: [AccessWay.AccessType: String] = [
        .mail: "Mail address",
        .phone: "Phone number",
        .telegram: "Telegram",
        .website: "Personal website"
    ]

    open override func transformedValue(_ value: Any?) -> Any? {
        if let list = value as? NSArray {
            return list.compactMap({ number -> String? in
                guard let rawInt = (number as? NSNumber)?.intValue,
                      let type = AccessWay.AccessType(rawValue: rawInt) else { return nil }
                
                return namesMap[type]
            })
        }
        
        guard let rawInt = (value as? NSNumber)?.intValue,
              let type = AccessWay.AccessType(rawValue: rawInt) else { return "" }
        
        return namesMap[type]
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let name = value as? String else { return nil }
        
        return namesMap.first { $0.value == name }?.key.rawValue
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
