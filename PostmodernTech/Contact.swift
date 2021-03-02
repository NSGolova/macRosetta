//
//  Contact.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import Foundation
import KVOMagic

class Contact: PureWrapperOwner, Equatable, Identifiable, Hashable, ObservableObject {
    
    @Published var name: String?
    @Published var surname: String?
    var fullname: String? { name + " " + surname }
    
    @Published var online = false
    var id = UUID().uuidString
    
    @ObservableArray var accesses = [AccessWay]()
    @FromArray({ $0.map(\.accessCount).reduce(0, +) }, \Contact.$accesses) var accessCount
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        
        super.init()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(arc4random_uniform(200))) { [weak self] in
            self?.toggleOnline()
        }
    }
    
    func add(access: AccessWay) {
        guard !accesses.contains(access) else { return }
        accesses.append(access)
    }
    
    func remove(access: AccessWay) {
        accesses.removeAll { $0 == access }
    }
    
    private func toggleOnline() {
        online.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(arc4random_uniform(200))) { [weak self] in
            self?.toggleOnline()
        }
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
