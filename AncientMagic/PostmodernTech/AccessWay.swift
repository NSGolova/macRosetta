//
//  AccessWay.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/25/21.
//

import Foundation

class AccessWay: ObservableObject {
    enum AccessType: Int {
        case phone
        case mail
        case telegram
        case website
    }
    
    let type: AccessType
    @Published var accessValue = ""
    @Published var accessCount = 0
    
    init(type: AccessType, value: String) {
        self.type = type
        self.accessValue = value
    }
    
    func use() {
        accessCount += 1
    }
}
