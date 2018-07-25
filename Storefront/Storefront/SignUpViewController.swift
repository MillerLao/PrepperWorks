//
//  SignUpViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/12/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import Buy

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func signUpFailAlert(errorMsg: String) {
        let alert = UIAlertController(title: "Sign Up Failed", message: errorMsg, preferredStyle: .alert)
      
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
        
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitPressed(_ sender: AnyObject) {
        
        if let email = emailTextField.text, let password = passwordTextField.text, let firstName = fNameTextField.text, let lastName = lNameTextField.text {
            Client.shared.createNewUser(newEmail: email, newPassword: password, newFirstName: firstName, newLastName: lastName) {
                customer, errorMessage in
                
                if customer == nil {
                    if let errMsg = errorMessage {
                        print("Failed to create account")
                        self.signUpFailAlert(errorMsg: errMsg)
                    }
                } else {
                    self.performSegue(withIdentifier: "signUpToLogin", sender: self)
                }
            }
        }
    }
}
