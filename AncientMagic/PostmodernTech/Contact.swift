//
//  Contact.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/20/21.
//

import Foundation
import Combine
import SwiftUI

@propertyWrapper
class ObservableArray<T>: ObservableObject where T: ObservableObject  {

    @Published var wrappedValue = [T]() {
        didSet {
            observeChildrenChanges()
        }
    }
    var cancellables = [AnyCancellable]()

    public init(wrappedValue: [T]) {
        self.wrappedValue = wrappedValue
        
        observeChildrenChanges()
    }

    func observeChildrenChanges() {
        wrappedValue.forEach({
            let cancellable = $0.objectWillChange.sink { _ in
                self.objectWillChange.send()
            }

            self.cancellables.append(cancellable)
        })
    }
    
    public var projectedValue: ObservableArray<T> {
        self
    }
}

class Contact: Equatable, Identifiable, Hashable, ObservableObject {
    @Published var name: String?
    @Published var surname: String?
    var fullname: String? { name + " " + surname }
    @Published var online = false
    @ObservableArray var accesses = [AccessWay]()
    var id = UUID().uuidString
    @Published var accessCount = 0
    
    private var fullNameObserver: AnyCancellable?
    private var accessesObserver: AnyCancellable?
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
 
        accessesObserver = $accesses.objectWillChange.sink { [weak self] _ in
            guard let self = self else { return }

            self.accessCount = self.accesses.map(\.accessCount).reduce(0, +)
        }
        
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
