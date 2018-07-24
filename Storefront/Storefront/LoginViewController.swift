//
//  LoginViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/18/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import Buy

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextLabel: UITextField!
    @IBOutlet weak var passwordTextLabel: UITextField!
    
    var cameFrom = ""
    var token: Storefront.CustomerAccessToken? = nil
    
    func testy() {
        
    }
    
    
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
            if let token = token {
                Client.shared.getUserData(token: token) {
                    firstName, lastName, email in
                    
                    let accountVC = segue.destination as! UserAccountViewController
                    
                    accountVC.tempEmail = email!
                    accountVC.tempName = "\(String(describing: firstName)) \(String(describing: lastName))"
                }
            }
        }
    }
    
    @IBAction func loginSubmitPressed(_ sender: Any) {
        
        if let email = emailTextLabel.text {
            if let password = passwordTextLabel.text {
                Client.shared.loginUser(userEmail: email, userPassword: password) {
                    token in
                    
                    if token != nil {
                        self.token = token
                        if self.cameFrom == "videos" {
                            self.performSegue(withIdentifier: "loginToVideos", sender: self)
                        } else {
                            self.performSegue(withIdentifier: "loginToAccount", sender: self)
                        }
                    } else {
                        print("Failed to login!")
                        self.loginFailAlert()
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
