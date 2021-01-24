//
//  ContactDetailsView.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/24/21.
//

import SwiftUI

struct ContactDetailsView: View {
    
    @ObservedObject var contact: Contact

    var body: some View {
        Text(contact.fullname ?? "")
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .multilineTextAlignment(.center)
        Form {
            TextField("name", $contact.name)
            TextField("surname", $contact.surname)
        }
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactDetailsView(contact: Contact(name: "Alex", surname: "Testarini"))
            ContactDetailsView(contact: Contact(name: "John", surname: "Samplov"))
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
