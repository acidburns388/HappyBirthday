//
//  UIRoundedButton.swift
//  HappyBirthday
//
//  Created by intellithings on 09/12/2021.
//

import UIKit.UIButton

class RoundedButton: UIButton {   
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
        
        self.backgroundColor = .buttonBackgourndColor
        
        setTitleColor(.white, for: .normal)
        setTitleColor(.white.withAlphaComponent(UIColor.selectedAlpha), for: .highlighted)
        setTitleColor(.white.withAlphaComponent(UIColor.selectedAlpha), for: .disabled)
    }
}
