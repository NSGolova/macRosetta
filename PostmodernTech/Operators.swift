//
//  Operators.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/24/21.
//

import Foundation
import Combine
import SwiftUI

extension Optional where Wrapped == String {
    static func + (left: String?, right: String?) -> String? {
        return left != nil && right != nil ? left! + right! : nil
    }
}

func ?? <Value>(lhs: Binding<Optional<Value>>, rhs: Value) -> Binding<Value> {
    return Binding<Value>(get: {
        lhs.wrappedValue ?? rhs
    }, set: {
        lhs.wrappedValue = $0
    })
}
