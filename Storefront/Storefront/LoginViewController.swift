//
//  LoginViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/24/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import Buy
import KeychainSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    var cameFrom = ""
    var token: Storefront.CustomerAccessToken? = nil
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.navigationController?.setNavigationBarHidden(false, animated: false)
        //        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        self.navigationController?.navigationBar.isHidden = false
    }
    
    func loginFailAlert() {
        let alert = UIAlertController(title: "Login Failed", message: "The email and password you entered did not match", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToAccount" {
//            keychain.get("blahblah") gives a nil
            if let token = token {
                Client.shared.getUserData(token: token.accessToken) {
                    firstName, lastName, email in
            
                    let accountVC = segue.destination as! UserAccountViewController
                    
                    if let email = email {
                        accountVC.tempEmail = email
                    }
                    if let firstName = firstName {
                        if let lastName = lastName {
                            accountVC.tempName = "\(firstName)) \(lastName))"
                        } else {
                            accountVC.tempName = "None"
                        }
                    } else {
                        accountVC.tempName = "None"
                    }
                }
            }
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                Client.shared.loginUser(userEmail: email, userPassword: password) {
                    token in
                    
                    if let token = token {
                        self.token = token
                        self.keychain.set(token.accessToken, forKey: "accessToken")
                        if self.cameFrom == "videos" {
                            self.performSegue(withIdentifier: "loginToVideos", sender: self)
                        } else {
                            self.performSegue(withIdentifier: "loginToAccount", sender: self)
                        }
                    } else {
                        self.loginFailAlert()
                    }
                }
            }
        }
    }
    
}
