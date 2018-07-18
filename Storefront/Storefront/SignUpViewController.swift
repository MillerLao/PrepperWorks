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
        //Stuff to do after the view loads
    }
    
    
    @IBAction func submitPressed(_ sender: AnyObject) {
        
        if let email = emailTextLabel.text {
            if let password = passwordTextLabel.text {
                Client.shared.createNewUser(newEmail: email, newPassword: password) {
                    customer in
                    
                    if customer == nil {
                        print("Failed to create account")
                    } else {
                        self.performSegue(withIdentifier: "signUpToLogin", sender: self)
                    }
                }
            }
        }
    }
}
