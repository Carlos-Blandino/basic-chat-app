//
//  RegisterViewController.swift
//
//  basic-chat-app
//
//  Created by Carlos Blandino on 6/10/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let errors = error {
                    let myError = "\(errors.localizedDescription)"
                    //                    let startingIndex =  (myError.firstIndex(of: "T")!)
                    //                    let substring = "\(myError[startingIndex...myError.firstIndex(of: ".")!])"
                    let alert = UIAlertController(title: "Error",
                                                  message: myError,
                                                  preferredStyle: UIAlertController.Style.alert)
                    
                    alert.addAction(UIAlertAction(title: "Okay",
                                                  style: UIAlertAction.Style.default,
                                                  handler: {(alert: UIAlertAction!) in print(myError)}))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "RegisterToChatSegue", sender: self)
                }
            }
        }
        
        
    }
    
}
