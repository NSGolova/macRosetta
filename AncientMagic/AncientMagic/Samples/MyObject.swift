//
//  MyObject.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/17/21.
//

import Foundation

class MyObject: NSObject {
    @objc dynamic var property = "test"
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
