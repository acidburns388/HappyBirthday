//
//  ViewController.swift
//  HappyBirthday
//
//  Created by intellithings on 09/12/2021.
//

import UIKit

class DetailsViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewButton: UIButton!
    @IBOutlet weak var showBirthdayScreenButton: RoundedButton!
    
    let defaults = UserDefaults.standard
    var imagePicker = UIImagePickerController()
    
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
        nameTextField.delegate = self
        
        datePicker.backgroundColor = .clear
        datePicker.setValue(UIColor.black, forKeyPath: "textColor")
        
        if let savedDate: Date = defaults.value(forKey: "date") as? Date {
            datePicker.date = savedDate
        }
                
        if let image: UIImage = UIImage(named: "defaultPlaceHolderBlue") {
            imageView.layer.borderWidth = 7.0
            imageView.layer.masksToBounds = false
            imageView.layer.borderColor = UIColor.borderColor.cgColor
            imageView.layer.cornerRadius = image.size.height / 2
            imageView.clipsToBounds = true
            
            imageView.image = image
        }
        
        if let saveImaged: UIImage = ImagePickerManager().getSavedImage() {
            imageView.image = saveImaged
        }

        showBirthdayScreenButton.setTitle("Show birthday screen".uppercased(), for: .normal)
        showBirthdayScreenButton.setTitleColor(.white, for: .normal)
        showBirthdayScreenButton.isEnabled = false
        
        validateNameAndDate()
    }
    
    @IBAction func onDatePickerValueChanged(_ sender: Any) {
        defaults.set(datePicker.date, forKey: "date")
        validateNameAndDate()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == nameTextField {
            defaults.set(textField.text, forKey: "name")
            validateNameAndDate()
        }
    }
    
    func validateNameAndDate() {
        if nameTextField.text != "name" && datePicker.date != Date() {
            showBirthdayScreenButton.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func onImagePickClicked(_ sender: Any) {
        ImagePickerManager().pickImage(self) { image in
            self.imageView.image = image
        }
    }
}

    
