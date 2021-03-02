//
//  ContactsList.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/18/21.
//

import Foundation
import KVOMagic

class ContactsList: ArrayOwner {
    @objc dynamic private(set) var contacts = [Contact]()
    @Computed({ $0.contacts.map(\.accessCount).reduce(0, +) }, self, .arrayKVO + #keyPath(contacts.accessCount)) @objc dynamic var accessCount
    @Computed({ $0.contacts.filter(\.online).count }, self, .arrayKVO + #keyPath(contacts.online)) @objc dynamic var onlineCount
    
    @objc
    func add(contact: Contact) {
        guard !contacts.contains(contact) else { return }
        
        contacts.append(contact)
    }
    
    @objc
    func remove(contact: Contact) {
        contacts.removeAll { $0 == contact }
    }
}
