//
//  Operators.swift
//  AncientMagic
//
//  Created by Viktor Radulov on 1/24/21.
//

import Foundation

extension Optional where Wrapped == String {
    static func + (left: String?, right: String?) -> String? {
        return left != nil && right != nil ? left! + right! : nil
    }
}
