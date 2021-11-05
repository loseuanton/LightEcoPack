//
//  ProfileSettingsVC.swift
//  LightEcoPack
//
//  Created by Admin on 10.10.21.
//

import UIKit

class ProfileSettingsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet private weak var logoPhotoImage: UIImageView!
    @IBOutlet private weak var companyTextField: UITextField!
    @IBOutlet private weak var numberPhoneTextField: UITextField!
    @IBOutlet private weak var countryTextField: UITextField!
    @IBOutlet private weak var emailTextFiled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSaveData()
        view.backgroundColor = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)

    }
    @IBAction func saveDidTap() {
        let defaults = UserDefaults.standard
        let profile = Profile(logoPhoto: logoPhotoImage.image, nameCompany: companyTextField.text, phoneNumber: numberPhoneTextField.text, country: countryTextField.text, email: emailTextFiled.text)
        let profileData = try? JSONEncoder().encode(profile)
        defaults.setValue(profileData, forKey: "profileData")
        dismiss(animated: true, completion: nil)
    }
    private func loadSaveData() {
        let defaults = UserDefaults.standard
        if let profileData = defaults.data(forKey: "profileData") {
            let profile = try? JSONDecoder().decode(Profile.self, from: profileData)
            logoPhotoImage.image = profile?.logoPhoto
            companyTextField.text = profile?.nameCompany
            numberPhoneTextField.text = profile?.phoneNumber
            countryTextField.text = profile?.country
            emailTextFiled.text = profile?.email
        }
    }
    @IBAction func imageViewDidTap() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        navigationController?.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            logoPhotoImage.image = image
        }
    
    }
    

   

}
