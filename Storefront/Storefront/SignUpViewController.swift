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
        
        if let email = emailTextLabel.text {
            if let password = passwordTextLabel.text {
                Client.shared.createNewUser(newEmail: email, newPassword: password) {
                    customer in
                    
                    if customer == nil {
                        print("Failed to create account")
                    } else {
                        print("Success")
                    }
                }
            }
        }
        
//        let input = Storefront.CustomerCreateInput.create(
//            email:            emailTextLabel.text!,
//            password:         passwordTextLabel.text!,
//            firstName:        .value("John"),
//            lastName:         .value("Smith"),
//            acceptsMarketing: .value(true)
//        )
//
//        let mutation = Storefront.buildMutation { $0
//            .customerCreate(input: input) { $0
//                .customer { $0
//                    .id()
//                    .email()
//                    .firstName()
//                    .lastName()
//                }
//                .userErrors { $0
//                    .field()
//                    .message()
//                }
//            }
//        }
        
    }
}
