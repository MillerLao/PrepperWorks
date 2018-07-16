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
    
    
    @IBAction func submitPressed(_ sender: Any) {
        
//        Client.shared.createNewUser(newEmail: emailTextLabel.text, newPassword: passwordTextLabel.text)
        
        if let email = emailTextLabel.text {
            if let password = passwordTextLabel.text {
                let input = Storefront.CustomerCreateInput(email: email, password: password)
                
                let mutation = Storefront.buildMutation { $0
                    .customerCreate(input: input) { $0
                        .customer { $0
                            .id()
                            .email()
                            .firstName()
                            .lastName()
                        }
                        .userErrors { $0
                            .field()
                            .message()
                        }
                    }
                }
            }
        }
        
    }
    
    
}
