//
//  Extensions.swift
//  PostmodernTech
//
//  Created by Viktor Radulov on 1/24/21.
//

import SwiftUI

extension TextField where Label == Text {
    public init(_ titleKey: String, _ text: Binding<String?>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
        self.init(titleKey, text: (text ?? titleKey), onEditingChanged: onEditingChanged, onCommit: onCommit)
    }
}
