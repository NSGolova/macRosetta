//
//  Contact.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import Foundation

class Contact: Equatable, Identifiable, Hashable, ObservableObject {
    @Published var name: String?
    @Published var surname: String?
    
    var fullname: String? {
        guard let name = name,
              let surname = surname else {
            return nil
        }
        return name + " " + surname
    }
    
    @Published var online = false
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(arc4random_uniform(200))) { [weak self] in
            self?.toggleOnline()
        }
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        lhs.fullname == rhs.fullname
    }
    
    func toggleOnline() {
        online.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(arc4random_uniform(200))) { [weak self] in
            self?.toggleOnline()
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(surname)
    }
}
