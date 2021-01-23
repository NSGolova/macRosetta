//
//  ContactsList.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/18/21.
//

import Foundation

class ContactsList: NSObject {
    @objc dynamic private(set) var contacts = [Contact]()
    
    func add(contact: Contact) {
        guard !contacts.contains(contact) else { return }
        
        contacts.append(contact)
    }
    
    func remove(contact: Contact) {
        contacts.removeAll { $0 == contact }
    }
}
