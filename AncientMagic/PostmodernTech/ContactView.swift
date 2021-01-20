//
//  ContactView.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import SwiftUI

struct ContactView: View {
    
    var contact: Contact

    var body: some View {
        VStack(alignment: .leading) {
            Text(contact.name ?? "No name")
                .multilineTextAlignment(.leading)
            Text(contact.surname ?? "")
                .multilineTextAlignment(.leading)

            Spacer()
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        ContactView(contact: Contact(name: "Alex", surname: "Testarini"))
        ContactView(contact: Contact(name: "John", surname: "Samplov"))
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
