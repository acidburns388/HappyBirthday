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
    @IBOutlet weak var imageView: ImageSelectionView!
    @IBOutlet weak var imageViewButton: UIButton!
    @IBOutlet weak var showBirthdayScreenButton: RoundedButton!
    
    let defaults = UserDefaults.standard
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        validateNameAndDate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func configureUI() {
        view.backgroundColor = .pelicanBackgroundColor
        
        appTitleLabel.textColor = .textColor
        appTitleLabel.font = .bentonSansMedium(size: 21)
        appTitleLabel.text = LocalizedString.init("happyBirthday").resolve().uppercased()
        
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 4.0
        nameTextField.layer.masksToBounds = true
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.borderWidth = 0.1
        nameTextField.textColor = .textColor
        
        nameTextField.text = defaults.value(forKey: "name") as? String ?? LocalizedString.init("name").resolve()
        nameTextField.returnKeyType = .done
        nameTextField.delegate = self
        
        datePicker.backgroundColor = .clear
        datePicker.setValue(UIColor.black, forKeyPath: "textColor")
        
        if let savedDate: Date = defaults.value(forKey: "date") as? Date {
            datePicker.date = savedDate
        }
        
        if let saveImaged: UIImage = ImagePickerManager().getSavedImage() {
            imageView.image = saveImaged
        }
        
        showBirthdayScreenButton.setTitle(LocalizedString.init("ShowBirthdayScreen").resolve().uppercased(), for: .normal)
        showBirthdayScreenButton.setTitleColor(.white, for: .normal)
        showBirthdayScreenButton.isEnabled = false
    }
    
    @IBAction func onDatePickerValueChanged(_ sender: Any) {
        validateDateIsInRange()
        
        defaults.set(datePicker.date, forKey: "date")
        validateNameAndDate()
    }
    
    func validateDateIsInRange() {
        let currentDate: Date = Date()
        
        if datePicker.date > currentDate {
            datePicker.date = currentDate
        }
        
        let yearsToAdd: Int = -12
        var dateComponent: DateComponents = DateComponents()
        dateComponent.year = yearsToAdd
        
        if let tewlveYearsDate: Date = Calendar.current.date(byAdding: dateComponent, to: currentDate) {
            if datePicker.date < tewlveYearsDate {
                datePicker.date = tewlveYearsDate
            }
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == nameTextField {
            defaults.set(textField.text, forKey: "name")
            validateNameAndDate()
        }
    }
    
    func validateNameAndDate() {
        if nameTextField.text != LocalizedString.init("name").resolve() && datePicker.date != Date() {
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
    
    @IBAction func onShowBirthdayScreenClicked(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let birthdayScreenViewController = storyBoard.instantiateViewController(withIdentifier: "BirthdayScreenViewController") as? BirthdayScreenViewController {
            birthdayScreenViewController.date = datePicker.date
            birthdayScreenViewController.name = nameTextField.text ?? ""
            self.navigationController?.pushViewController(birthdayScreenViewController, animated: true)
        }
    }
}


