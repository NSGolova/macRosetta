//
//  ContactList.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import Foundation
import Combine
import SwiftUI

class ContactsList: ObservableObject {
    @ObservableArray var contacts = [Contact]()
    
    @Published var onlineCount = 0
    @Published var accessCount = 0
    
    private var contactsObserver: AnyCancellable?
    
    init() {
        contactsObserver = $contacts.objectWillChange.sink { [weak self] _ in
            guard let self = self else { return }

            self.accessCount = self.contacts.map(\.accessCount).reduce(0, +)
            self.onlineCount = self.contacts.filter(\.online).count
        }
    }
    
    func add(contact: Contact) {
        guard !contacts.contains(contact) else { return }
        
        contacts.append(contact)
    }
    
    func remove(contact: Contact) {
        contacts.removeAll { $0 == contact }
    }
    
}
