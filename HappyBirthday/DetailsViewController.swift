//
//  ViewController.swift
//  HappyBirthday
//
//  Created by intellithings on 09/12/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewButton: UIButton!
    @IBOutlet weak var showBirthdayScreenButton: RoundedButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
        
        appTitleLabel.textColor = .textColor
        appTitleLabel.font = .bentonSansMedium(size: 21)
        appTitleLabel.text = "happy birthday".uppercased()
        
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 4.0
        nameTextField.layer.masksToBounds = true
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.borderWidth = 0.1
        nameTextField.textColor = .textColor
        
        nameTextField.text = defaults.value(forKey: "name") as? String ?? "Name"
        nameTextField.returnKeyType = .done
        
        datePicker.backgroundColor = .clear
        datePicker.setValue(UIColor.black, forKeyPath: "textColor")
        
        showBirthdayScreenButton.setTitle("Show birthday screen", for: .normal)
        showBirthdayScreenButton.setTitleColor(.white, for: .normal)
        showBirthdayScreenButton.isEnabled = false
    }
}

