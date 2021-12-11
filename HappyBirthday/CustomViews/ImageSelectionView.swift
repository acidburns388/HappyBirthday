//
//  ImageSelectionView.swift
//  HappyBirthday
//
//  Created by intellithings on 09/12/2021.
//

import UIKit

class ImageSelectionView: UIView {
    var image: UIImage?
    var theme: ScreenTheme = .PELICAN
        
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .clear
        
        let imageName: String = theme.placeHolder
        if let image: UIImage = self.image {
            setImage(image)
        } else if let image: UIImage = UIImage(named: imageName) {
            setImage(image)
        }
    }
    
    fileprivate func setImage(_ image: UIImage) {
        let imageView: UIImageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 221, height: 221)
        let radius: CGFloat = imageView.frame.size.width / 2

        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 7.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = theme.borderColor.cgColor
        imageView.layer.cornerRadius = radius
        imageView.clipsToBounds = true
        
        self.addSubview(imageView)
        
        let addImageName: String = theme.addImage
        if let addImage: UIImage = UIImage(named: addImageName) {
            let addImageView: UIImageView = UIImageView(image: addImage)
            
            let degreeA = 0.785398 // 45
            let degreeB = 1.178097 // 67.5
            
            let addImageX = radius * cos(degreeA) - 18
            let addImageY = radius * sin(degreeB) - 13
            
            addImageView.frame = CGRect(x: radius + addImageX, y: radius - addImageY, width: 36, height: 36)
            self.addSubview(addImageView)
        }
    }
}
