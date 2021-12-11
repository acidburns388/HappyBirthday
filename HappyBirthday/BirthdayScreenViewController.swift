//
//  BirthdayScreenViewController.swift
//  HappyBirthday
//
//  Created by intellithings on 09/12/2021.
//

import UIKit

class BirthdayScreenViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var imageView: ImageSelectionView!
    @IBOutlet weak var imageViewButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var shareTheNewsButton: RoundedButton!
    
    let defaults = UserDefaults.standard
    var date: Date?
    var name: String = ""
    var imagePicker: UIImagePickerController = UIImagePickerController()
    var ageToShare: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let themeNumber: Int = Int.random(in: 0..<3)
        if let theme: ScreenTheme = ScreenTheme.init(rawValue: themeNumber) {
            configureUI(theme: theme)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func onBackButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onImagePickClicked(_ sender: Any) {
        ImagePickerManager().pickImage(self) { image in
            self.imageView.image = image
            self.imageView.layoutSubviews()
        }
    }
    
    func configureUI(theme: ScreenTheme) {
        view.backgroundColor = theme.backgroundColor
        imageView.theme = theme
        
        backButton.setImage(UIImage(named: "arrowBackBlue"), for: .normal)
        
        nameLabel.textColor = .textColor
        nameLabel.font = .bentonSansMedium(size: 21)
        nameLabel.text = String(format: LocalizedString.init("todayIs").resolve().uppercased(), name.uppercased())
        
        ageLabel.textColor = .textColor
        ageLabel.font = .bentonSansMedium(size: 21)
        
        setViewsAndTextsForSelectedDate()
        
        if let saveImaged: UIImage = ImagePickerManager().getSavedImage() {
            imageView.image = saveImaged
        }
        
        shareTheNewsButton.setTitle(LocalizedString.init("shareTheNews").resolve(), for: .normal)
        shareTheNewsButton.setTitleColor(.white, for: .normal)
        shareTheNewsButton.setImage(UIImage(named: "shareWhiteSmall"), for: .normal)
        shareTheNewsButton.semanticContentAttribute = .forceRightToLeft
        
        backgroundImageView.image = UIImage(named: theme.image)
    }
    
    func setViewsAndTextsForSelectedDate() {
        if let date: Date = self.date {
            let currentDate: Date = Date()
            
            let selecedYear: Int = date.get(.year)
            let currentYear: Int = currentDate.get(.year)
            
            let selecedMonth: Int = date.get(.month)
            let currentMonth: Int = currentDate.get(.month)
            let monthDifference = currentMonth - selecedMonth
            
            let selecedDay: Int = date.get(.day)
            let currentDay: Int = currentDate.get(.day)
            let daysDifference = currentDay - selecedDay
            
            if var annualDaysDifference = Calendar.current.dateComponents([.day], from: date, to: currentDate).day {
                annualDaysDifference += 1 // counting starts from zero
                let leapYears: Int = Utils.getLeapYerasBetweenTwoYears(startYear: selecedYear, endYear: currentYear)
                annualDaysDifference += leapYears
                
                if annualDaysDifference >= 365 {
                    let yearsToDispaly: Int = annualDaysDifference / 365
                    self.ageToShare = yearsToDispaly
                    ageImageView.image = UIImage(named: "ageNumber\(yearsToDispaly)")
                    ageLabel.text = LocalizedString.init("yearOld").resolve().uppercased()
                } else {
                    var monthsToDispaly: Int = 0
                    if selecedMonth < currentMonth {
                        if daysDifference >= 0 {
                            monthsToDispaly = monthDifference
                        }
                    } else if selecedMonth > currentMonth {
                        monthsToDispaly = monthDifference + 1
                    } else {
                        if selecedYear < currentYear {
                            if daysDifference <= 0 {
                                monthsToDispaly = 12
                            }
                        }
                    }
                    
                    self.ageToShare = monthsToDispaly
                    ageImageView.image = UIImage(named: "ageNumber\(monthsToDispaly)")
                    ageLabel.text = LocalizedString.init("monthOld").resolve().uppercased()
                }
            }
        }
    }
    
    @IBAction func onShareTheNewsButtonClicked(_ sender: Any) {
        if let image: UIImage = self.imageView.image, let ageText: String = ageLabel.text, let ageToShare: Int = self.ageToShare {
            let message: String = String(format: LocalizedString.init("todayIs").resolve().uppercased(), name.uppercased()) + " \(ageToShare) " + ageText
            
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [image, message], applicationActivities: nil)
            self.navigationController?.present(activityViewController, animated: true, completion: nil)
        }
    }
}


