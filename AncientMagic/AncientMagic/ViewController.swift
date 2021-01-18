//
//  ViewController.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/17/21.
//

import Cocoa

class ViewController: NSViewController {
    
    @objc dynamic var name: String?
    @objc dynamic var surname: String?
    
    @objc dynamic let list = ContactsList()

    @IBAction func handleNew(_ sender: Any) {
        guard let name = name,
              let surname = surname else { return }
        
        self.name = nil
        self.surname = nil
        
        list.add(contact: Contact(name: name, surname: surname))
    }
}

