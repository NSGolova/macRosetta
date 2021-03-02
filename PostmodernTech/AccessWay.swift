//
//  AccessWay.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/25/21.
//

import Foundation

class AccessWay: Equatable, Identifiable, Hashable, ObservableObject {
    enum AccessType: Int, CaseIterable, Identifiable {
        case phone
        case mail
        case telegram
        case website
        
        var id: String {
            switch self {
            case .mail: return "Mail address"
            case .phone: return "Phone number"
            case .telegram: return "Telegram"
            case .website: return "Personal website"
            }
        }
        
        static var allValues: [AccessType] {
            [.mail, .phone, .telegram, .website]
        }
    }
    
    let type: AccessType
    @Published var accessValue = ""
    @Published var accessCount = 0
    var id = UUID().uuidString
    
    init(type: AccessType, value: String) {
        self.type = type
        self.accessValue = value
    }
    
    func use() {
        accessCount += 1
    }
    
    static func == (lhs: AccessWay, rhs: AccessWay) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension AccessWay.AccessType {
    private static var namesMap: [AccessWay.AccessType: String] = [
        .mail: "Mail address",
        .phone: "Phone number",
        .telegram: "Telegram",
        .website: "Personal website"
    ]
    
    var stringValue: String {
        Self.namesMap[self]!
    }
    
    static func from(string: String) -> AccessWay.AccessType {
        namesMap.first { $0.value == string }!.key
    }
}
