//
//  OfferVC.swift
//  LightEcoPack
//
//  Created by Admin on 11.10.21.
//

import UIKit
import Firebase

class OfferVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        view.backgroundColor = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
        

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = nameTextField.text!
        
        if (!name.isEmpty) {
            Database.database().reference().child("usersOffer").child("newOffer").child(Auth.auth().currentUser!.uid).setValue(name)
        }
    
return true

}
    
}
