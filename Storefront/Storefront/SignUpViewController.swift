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
    
    @IBOutlet weak var emailTextLabel: UITextField!
    
    @IBOutlet weak var passwordTextLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func signUpFailAlert() {
        let alert = UIAlertController(title: "Sign Up Failed", message: "Please fill in all fields!", preferredStyle: .alert)
      
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
        
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitPressed(_ sender: AnyObject) {
        
        if let email = emailTextLabel.text {
            if let password = passwordTextLabel.text {
                Client.shared.createNewUser(newEmail: email, newPassword: password) {
                    customer in
                    
                    if customer == nil {
                        print("Failed to create account")
                        self.signUpFailAlert()
                    } else {
//                        self.performSegue(withIdentifier: "signUpToLogin", sender: self)
                    }
                }
            } else {
                print("No password entered!")
                signUpFailAlert()
            }
        } else {
            print("No email entered!")
            signUpFailAlert()
        }
    }
}
