//
//  AuthVC.swift
//  LightEcoPack
//
//  Created by Admin on 6.10.21.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthVC: UIViewController, UITextFieldDelegate {
    let color = UIColor(red: 91.0 / 255.0, green: 64.0 / 255.0, blue: 48.0 / 255.0, alpha: 1)
    var signUp: Bool = true {
        willSet {
            if newValue {
                titleLabel.text = "Регистрация"
                nameField.isHidden = false
                enterButtom.setTitle("Войти", for: .normal)
            } else {
                titleLabel.text = "Вход"
                nameField.isHidden = true
                enterButtom.setTitle("Регистрация", for: .normal)
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButtom: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        view.backgroundColor = UIColor(red: 217.0 / 255.0, green: 201.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
        titleLabel.textColor = color
        enterButtom.tintColor = color
        
        
    }
    
    @IBAction func switchLogin() {
        signUp = !signUp
    }
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let email = emailField.text!
        let name = nameField.text!
        let password = passwordField.text!
        
        
        if (signUp) {
            if (!name.isEmpty && !email.isEmpty && !password.isEmpty) {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                        print(result!.user.uid)
                        let ref = Database.database().reference().child("users")
                        ref.child((result?.user.uid)!).updateChildValues(["name" : name, "email" : email])
                        self.showNewVC()
                    }
                }
            } else {
                showAlert()
            }
        } else {
            if (!email.isEmpty && !password.isEmpty) {
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                        self.showNewVC()
                    }
                }
            } else {
                showAlert()
            }
        }
        return true
        
        
    }
    func showNewVC() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PersonalAreaVC")
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

