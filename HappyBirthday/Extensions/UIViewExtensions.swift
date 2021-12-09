//
//  UIViewExtensions.swift
//  HappyBirthday
//
//  Created by intellithings on 09/12/2021.
//

import UIKit.UIView

extension UIView {
    func addBackgroundImage(named: String) {
        if let background: UIImage = UIImage(named: named) {
            let width = UIScreen.main.bounds.size.width
            let height = UIScreen.main.bounds.size.height
            
            let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageViewBackground.image = background
            
            imageViewBackground.contentMode = UIView.ContentMode.bottom
            
            self.addSubview(imageViewBackground)
            self.sendSubviewToBack(imageViewBackground)
        }
    }
}
