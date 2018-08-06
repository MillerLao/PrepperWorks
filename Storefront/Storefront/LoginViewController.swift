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
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    var cameFrom = ""
    let keychain = KeychainSwift()
    
    var email: String = ""
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loginFailAlert() {
        let alert = UIAlertController(title: "Login Failed", message: "The email and password you entered did not match", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToAccount" {
            let accountVC = segue.destination as! UserAccountViewController
            accountVC.tempName = self.name
            accountVC.tempEmail = self.email
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        SVProgressHUD.show()
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                Client.shared.loginUser(userEmail: email, userPassword: password) {
                    token in
                    
                    if let token = token {
                        self.keychain.set(token.accessToken, forKey: "accessToken")
                        if self.cameFrom == "videos" {
                            self.performSegue(withIdentifier: "loginToVideos", sender: self)
                            SVProgressHUD.dismiss()
                        } else {
                            Client.shared.getUserData(token: token.accessToken) {
                                fName, lName, email in
                                
                                if let email = email {
                                    self.email = email
                                }
                                if let firstName = fName {
                                    if let lastName = lName {
                                        self.name = "\(firstName) \(lastName)"
                                    } else {
                                        self.name = "\(firstName)"
                                    }
                                } else {
                                    self.name = ""
                                }
                                self.performSegue(withIdentifier: "loginToAccount", sender: self)
                                SVProgressHUD.dismiss()
                            }
                        }
                    } else {
                        SVProgressHUD.dismiss()
                        self.loginFailAlert()
                    }
                }
            }
        }
    }
    
}
