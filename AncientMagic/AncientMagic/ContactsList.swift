//
//  ContactsList.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/18/21.
//

import Foundation

class ContactsList: NSObject {
    @objc dynamic var contacts = [Contact(name: "Alex", surname: "Testarini"),
                                  Contact(name: "John", surname: "Samplov")]
    
    func add(contact: Contact) {
        contacts.append(contact)
    }
    
    func remove(contact: Contact) {
        contacts.removeAll { $0 == contact }
    }
    
}
