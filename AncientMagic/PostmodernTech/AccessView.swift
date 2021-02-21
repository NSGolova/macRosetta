//
//  AccessView.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/25/21.
//

import SwiftUI

struct AccessView: View {
    
    @ObservedObject var access: AccessWay
    var removeHandler: () -> Void

    var body: some View {
        HStack() {
            Text(access.type.id)
            Text(access.accessValue)
            Spacer()
            Text("\(access.accessCount)")
            Button(action: {
                access.use()
               }) { () -> Text in
                switch access.type {
                case .mail:
                    return Text("Send")
                case .phone:
                    return Text("Call")
                case .telegram:
                    return Text("Open app")
                case .website:
                    return Text("Go")
                }
            }
            Button(action: self.removeHandler) {
                Image("RemoveIcon")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.all, 4.0)
    }
}

struct AccessView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccessView(access: AccessWay(type: .mail, value: "john@yopmail.com")) { }
            AccessView(access: AccessWay(type: .phone, value: "343-23-34")) { }
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
