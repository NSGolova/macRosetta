//
//  ContactList.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import Foundation

class ContactsList: ObservableObject {
    @Published var contacts = [Contact(name: "Alex", surname: "Testarini"),
                               Contact(name: "John", surname: "Samplov")]
    
    func add(contact: Contact) {
        contacts.append(contact)
    }
    
    func remove(contact: Contact) {
        contacts.removeAll { $0 == contact }
    }
    
}
