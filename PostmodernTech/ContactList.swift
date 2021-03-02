//
//  ContactList.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import Foundation
import KVOMagic

class ContactsList: PureWrapperOwner, ObservableObject {
    @ObservableArray var contacts = [Contact]()
    
    @FromArray({ $0.filter(\.online).count }, \ContactsList.$contacts) var onlineCount
    @FromArray({ $0.map(\.accessCount).reduce(0, +) }, \ContactsList.$contacts) var accessCount
    
    func add(contact: Contact) {
        guard !contacts.contains(contact) else { return }
        
        contacts.append(contact)
    }
    
    func remove(contact: Contact) {
        contacts.removeAll { $0 == contact }
    }
    
}
