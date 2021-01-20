//
//  MyObject.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/17/21.
//

import Foundation

class MyObject: NSObject {
    @objc dynamic var property = "test"
    
    @objc dynamic var property1 = "test"
    @objc dynamic var property2 = "test"
    
    @objc dynamic var property1and2: String { property1 + property2 }
    
    @objc class func keyPathsForValuesAffectingProperty1and2() -> Set<String> {
        [#keyPath(property1), #keyPath(property2)]
    }
}

class MyObjectOwner: NSObject {
    @objc dynamic var myObject = MyObject()
    
    var myObjectObserver: AnyObject?
    override init() {
        myObjectObserver = myObject.observe(\.property, options: [.new, .old]) { myObject, change in
//            let newValue = change.newValue
//            let oldValue = change.oldValue
            
            // Do observing
        }
    }
    deinit {
        myObjectObserver = nil
    }
}
