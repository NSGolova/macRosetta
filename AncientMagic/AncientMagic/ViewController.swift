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
    
    @IBOutlet var nameField: NSTextField!
    var contact: Contact? {
        didSet {
            contact?.observe(\.name) { [weak self] contact, _ in
                guard let self = self,
                      let name = contact.name else { return }
                self.nameField.stringValue = name
            }
        }
    }

    @IBAction func handleNew(_ sender: Any) {
        guard let name = name,
              let surname = surname else { return }
        
        self.name = nil
        self.surname = nil
        
        list.add(contact: Contact(name: name, surname: surname))
    }
}

