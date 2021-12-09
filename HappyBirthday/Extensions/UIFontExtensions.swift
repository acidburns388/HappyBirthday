//
//  UIFontExtensions.swift
//  HappyBirthday
//
//  Created by intellithings on 09/12/2021.
//

import UIKit.UIFont

extension UIFont {
    class func bentonSansMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "BentonSans-Medium", size: size) ?? .systemFont(ofSize: size)
    }
}
