//
//  ContentView.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import SwiftUI

struct ContentView: View {
    
    var list: ContactsList = {
        let list = ContactsList()
    
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
        
        return list
    }()
    
    var body: some View {
        ContactsListView(list: list)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
