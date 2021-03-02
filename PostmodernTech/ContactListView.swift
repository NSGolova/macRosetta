//
//  ContactListView.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import SwiftUI

struct ContactsListView: View {
    
    @ObservedObject var list: ContactsList
    
    @State private var selectedContact: Contact?
    @State private var newName = ""
    @State private var newSurname = ""
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("name", text: $newName)
                    TextField("surname", text: $newSurname)
                }
                .padding(.all)
                .frame(width: 350.0)
                
                Button(action: {
                    list.add(contact: Contact(name: newName, surname: newSurname))
                    newName = ""
                    newSurname = ""
                   }) {
                    Text("Add new")
                }
                .padding(.leading)
                .frame(width: 50.0)
                .disabled(newName.count == 0 || newSurname.count == 0)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(list.onlineCount) online")
                        .padding(.bottom)
                    Text("Overal activity: \(list.accessCount)")
                }
                .padding(.trailing)
            }
            HStack {
                List(list.contacts, id: \.self, selection: $selectedContact) { contact in
                    ContactView(contact: contact)
                }
                VStack {
                    if let contact = selectedContact {
                        ContactDetailsView(contact: contact) {
                            list.remove(contact: contact)
                        }
                    } else {
                        Text("Select contact")
                            .frame(width: 350.0)
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
