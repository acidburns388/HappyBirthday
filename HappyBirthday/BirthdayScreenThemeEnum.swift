//
//  BirthdayScreenThemeEnum.swift
//  HappyBirthday
//
//  Created by intellithings on 10/12/2021.
//

import UIKit.UIColor

enum ScreenTheme: Int, CaseIterable {
    case PELICAN
    case FOX
    case ELEPHENT
    
    public var image: String {
        switch self {
        case .PELICAN:
            return "iOsBgPelican2"
        case .FOX:
            return "iOsBgFox"
        case .ELEPHENT:
            return "iOsBgElephant"
        }
    }
    
    public var addImage: String {
        switch self {
        case .PELICAN:
            return "cameraIconBlue"
        case .FOX:
            return "cameraIconGreen"
        case .ELEPHENT:
            return "cameraIconYellow"
        }
    }
    
    public var placeHolder: String {
        switch self {
        case .PELICAN:
            return "defaultPlaceHolderBlue"
        case .FOX:
            return "defaultPlaceHolderGreen"
        case .ELEPHENT:
            return "defaultPlaceHolderYellow"
        }
    }
    
    public var backgroundColor: UIColor {
        switch self {
        case .PELICAN:
            return .pelicanBackgroundColor
        case .FOX:
            return .foxBackgroundColor
        case .ELEPHENT:
            return .elephentBackgroundColor
        }
    }
    
    public var borderColor: UIColor {
        switch self {
        case .PELICAN:
            return .pelicanBorderColor
        case .FOX:
            return .foxBorderColor
        case .ELEPHENT:
            return .elephentBorderColor
        }
    }
}
