//
//  AccessWays.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/23/21.
//

import Foundation

class AccessWay: NSObject {
    @objc
    enum AccessType: Int {
        case phone
        case mail
        case telegram
        case website
    }
    
    @objc dynamic let type: AccessType
    @objc dynamic var accessValue = ""
    @objc dynamic var accessCount = 0
    
    init(type: AccessType, value: String) {
        self.type = type
        self.accessValue = value
    }
    
    @objc func use() {
        accessCount += 1
    }
}
