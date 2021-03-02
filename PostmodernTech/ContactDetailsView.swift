//
//  ContactDetailsView.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/24/21.
//

import SwiftUI

struct ContactDetailsView: View {
    
    @ObservedObject var contact: Contact
    var removeHandler: () -> Void
    
    @State var accessValue = ""
    @State var accessType = AccessWay.AccessType.mail

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(contact.fullname ?? "")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                Spacer()
                Button(action: self.removeHandler) {
                    Image("RemoveIcon")
                        .frame(width: 36.0, height: 36.0, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray))
                }
                .padding([.top, .trailing])
                .buttonStyle(PlainButtonStyle())
            }
            Form {
                HStack {
                    Text("name:")
                    TextField("name", $contact.name)
                    Spacer()
                }
                HStack {
                    Text("surname:")
                    TextField("surname", $contact.surname)
                    Spacer()
                }
            }.padding(.all, 4.0)
            Spacer()
            HStack {
                TextField("value", text: $accessValue)
                Picker("", selection: $accessType) {
                    ForEach(AccessWay.AccessType.allCases) { type in
                        Text(type.id).tag(type)
                    }
                }
                Button(action: {
                    contact.add(access: AccessWay(type: accessType, value: accessValue))
                    accessValue = ""
                   }) {
                    Text("Add")
                }
                .padding(.trailing)
            }.padding(.all, 4.0)
            List(contact.accesses, id: \.self) { access in
                AccessView(access: access) {
                    contact.remove(access: access)
                }
            }
        }
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactDetailsView(contact: Contact(name: "Alex", surname: "Testarini")) {}
            ContactDetailsView(contact: Contact(name: "John", surname: "Samplov")) {}
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
