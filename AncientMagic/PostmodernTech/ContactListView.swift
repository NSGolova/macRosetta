//
//  ContactListView.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import SwiftUI

struct ContactsListView: View {
    @ObservedObject var list = ContactsList()
    @State var selectedContact = Set<Contact>()
    
    @State private var name: String = "" {
        didSet {
            selectedContact.first?.name = name
        }
    }
    @State private var surname: String = "" {
        didSet {
            selectedContact.first?.surname = surname
        }
    }
    
    @State private var newName: String = ""
    @State private var newSurname: String = ""
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("name", text: $newName)
                    TextField("surname", text: $newSurname)
                }.padding(.all).frame(width: 350.0)
                
                Button(action: {
                       list.add(contact: Contact(name: newName, surname: newSurname))
                   }) {
                    Text("Add new")
                }.padding(.leading).frame(width: 50.0)
                Spacer()
            }
            HStack {
                List(list.contacts, id: \.self, selection: $selectedContact) { contact in
                    ContactView(contact: contact)
                }
                VStack {
                    Text(selectedContact.first?.fullname ?? "")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                    Form {
                    TextField( selectedContact.first?.name ?? "", text: $name)
                    TextField(selectedContact.first?.surname ?? "", text: $surname)
                    
                        
                    }
                }
            }
            
        }
    }
}


struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
