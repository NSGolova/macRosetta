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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alex = Contact(name: "Alex", surname: "Testarini")
        alex.add(access: AccessWay(type: .mail, value: "alex@yopmail.com"))
        alex.add(access: AccessWay(type: .phone, value: "123-4567"))
        list.add(contact: alex)
        
        let john = Contact(name: "John", surname: "Samplov")
        john.add(access: AccessWay(type: .mail, value: "john@yopmail.com"))
        john.add(access: AccessWay(type: .telegram, value: "@jmlv"))
        john.add(access: AccessWay(type: .website, value: "https://samlov.org"))
        list.add(contact: john)
        
        let christin = Contact(name: "Christin", surname: "Testarini")
        christin.add(access: AccessWay(type: .mail, value: "christin@yopmail.com"))
        let christinPhone = AccessWay(type: .phone, value: "123-4567")
        christin.add(access: christinPhone)
        for _ in 0..<13 { christinPhone.use() }
        
        list.add(contact: christin)
    }

    @IBAction func handleNew(_ sender: Any) {
        guard let name = name,
              let surname = surname else { return }
        
        self.name = nil
        self.surname = nil
        
        list.add(contact: Contact(name: name, surname: surname))
    }
}

