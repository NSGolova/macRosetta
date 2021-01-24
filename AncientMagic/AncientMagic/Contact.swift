//
//  Contact.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/18/21.
//

import Foundation
import KVOMagic

class Contact: ArrayOwner {
    @objc dynamic var name: String?
    @objc dynamic var surname: String?
    
    @Computed2({ $0 + " " + $1 }, self, \.name, \.surname) @objc dynamic var fullname
    
    @objc dynamic private(set) var online = true
    @objc dynamic private(set) var accesses = [AccessWay]()
    
    @Computed({ $0.accesses.map(\.accessCount).reduce(0, +) }, self, .arrayKVO + #keyPath(accesses.accessCount)) @objc dynamic var accessCount
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        super.init()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(arc4random_uniform(200))) { [weak self] in
            self?.toggleOnline()
        }
    }
    
    func add(access: AccessWay) {
        guard !accesses.contains(access) else { return }
        
        accesses.append(access)
    }
    
    func remove(access: AccessWay) {
        accesses.removeAll { $0 == access }
    }
    
    private func toggleOnline() {
        online.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(arc4random_uniform(200))) { [weak self] in
            self?.toggleOnline()
        }
    }
}
