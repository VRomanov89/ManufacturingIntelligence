//
//  AuthVC.swift
//  ManufacturingIntelligence
//
//  Created by Volodymyr Romanov on 5/15/18.
//  Copyright © 2018 Vladimir Romanov. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {
    
    @IBOutlet weak var emailField: LoginTextFields!
    
    @IBOutlet weak var passwordField: LoginTextFields!
    
    @IBAction func signInButton(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            print("Successfully registered user")
                            self.dismiss(animated: true, completion: nil)
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
                
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self

        // Do any additional setup after loading the view.
    }

}

extension AuthVC: UITextFieldDelegate { }
