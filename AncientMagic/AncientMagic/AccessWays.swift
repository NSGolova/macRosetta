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
    @objc dynamic var name: String {
        switch type {
        case .mail:
            return "Mail address"
        case .phone:
            return "Phone number"
        case .telegram:
            return "Telegram"
        case .website:
            return "Personal website"
        }
    }
    @objc dynamic var accessValue = ""
    @objc dynamic var accessCount = 0
    
    init(type: AccessType, value: String) {
        self.type = type
        self.accessValue = value
    }
    
    func access() {
        accessCount += 1
    }
}
