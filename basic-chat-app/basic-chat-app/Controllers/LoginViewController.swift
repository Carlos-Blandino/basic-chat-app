//
//  LoginViewController.swift
//
//  basic-chat-app
//
//  Created by Carlos Blandino on 6/10/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let errors = error?.localizedDescription {
                    let alert = UIAlertController(title: "Error", message: errors, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (uiAlertAction) in
                        //print(errors)
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: C.login, sender: self)
                }
            }
        }
        
    }
    
}
