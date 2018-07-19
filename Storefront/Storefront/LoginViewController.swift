//
//  LoginViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/18/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextLabel: UITextField!
    @IBOutlet weak var passwordTextLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginSubmitPressed(_ sender: Any) {
        
        if let email = emailTextLabel.text {
            if let password = passwordTextLabel.text {
                Client.shared.loginUser(userEmail: email, userPassword: password) {
                    token in
                    
                    if token != nil {
                        self.performSegue(withIdentifier: "loginToMenu", sender: self)
                    } else {
                        print("Failed to login!")
                    }
                }
            } else {
                print("No password entered!")
            }
        } else {
            print("No email entered!")
        }
        
    }
}
