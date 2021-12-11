//
//  Localized.swift
//  HappyBirthday
//
//  Created by intellithings on 11/12/2021.
//

import Foundation

struct LocalizedString {
    var key: String

    init(_ key: String) {
        self.key = key
    }

    func resolve() -> String {
        NSLocalizedString(key, comment: "")
    }
}

extension LocalizedString: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        key = value
    }
}
