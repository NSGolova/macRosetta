//
//  Contact.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/18/21.
//

import Foundation

class Contact: NSObject {
    
    @objc dynamic var name: String?
    @objc dynamic var surname: String?
    
    @objc dynamic var fullname: String? {
        guard let name = name,
              let surname = surname else {
            return nil
        }
        return name + " " + surname
    }
    
    @objc class func keyPathsForValuesAffectingFullname() -> Set<String> {
        [#keyPath(name), #keyPath(surname)]
    }
    
    @objc dynamic private(set) var online = false
    @objc dynamic private(set) var accesses = [AccessWay]()
    
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
