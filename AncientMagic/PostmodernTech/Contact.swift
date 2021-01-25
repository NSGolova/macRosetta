//
//  Contact.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import Foundation
import Combine

class Contact: Equatable, Identifiable, Hashable, ObservableObject {
    @Published var name: String?
    @Published var surname: String?
    @Published var fullname: String?
    @Published var online = false
    
    @Published var accessCount = 0
    
    @Published var accesses = [AccessWay]()
    
    var id = UUID().uuidString
    
    private var fullNameObserver: AnyCancellable?
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        
        fullNameObserver = Publishers.CombineLatest($name, $surname).sink { [weak self] in
            self?.fullname = $0 + " " + $1
        }
        
//        Publishers.CombineLatest($accesses.acce)
 
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(arc4random_uniform(200))) { [weak self] in
            self?.toggleOnline()
        }
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
        hasher.combine(surname)
    }
}
