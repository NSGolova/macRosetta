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
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}
