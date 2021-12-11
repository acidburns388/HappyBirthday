//
//  UIColorExtension.swift
//  HappyBirthday
//
//  Created by intellithings on 09/12/2021.
//

import UIKit.UIColor

extension UIColor {
    convenience init(red256: Int, green256: Int, blue256: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red256) / 255.0, green: CGFloat(green256) / 255.0, blue: CGFloat(blue256) / 255.0, alpha: alpha)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red256: red, green256: green, blue256: blue, alpha: 1.0)
    }
    
    public static var selectedAlpha: CGFloat {
        return 0.6
    }
    
    static var pelicanBackgroundColor: UIColor {
        return UIColor(red: 218, green: 241, blue: 246)
    }
    
    static var foxBackgroundColor: UIColor {
        return UIColor(red: 197, green: 232, blue: 223)
    }
    
    static var elephentBackgroundColor: UIColor {
        return UIColor(red: 254, green: 239, blue: 203)
    }
    
    static var textColor: UIColor {
        return UIColor(red: 57, green: 69, blue: 98)
    }
    
    static var buttonBackgourndColor: UIColor {
        return UIColor(red: 239, green: 123, blue: 123)
    }
    
    static var pelicanBorderColor: UIColor {
        return UIColor(red: 139, green: 221, blue: 228)
    }
    
    static var foxBorderColor: UIColor {
        return UIColor(red: 111, green: 197, blue: 175)
    }
    
    static var elephentBorderColor: UIColor {
        return UIColor(red: 254, green: 190, blue: 30)
    }
}
