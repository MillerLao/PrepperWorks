//
//  MenuViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/24/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import KeychainSwift

class MenuViewController: UIViewController {
    
    var isLoggedIn:Bool = false
    var sender:String = ""
    let keychain = KeychainSwift()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if keychain.get("accessToken") != nil {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuToCollections" {
            let collectionsVC = segue.destination as! CollectionsViewController
            
            if isLoggedIn {
                collectionsVC.isMember = true
            }
        } else if segue.identifier == "menuToLogin" {
            let loginVC = segue.destination as! LoginViewController
            
            loginVC.cameFrom = self.sender
        } else if segue.identifier == "menuToAccount" {
            let accountVC = segue.destination as! UserAccountViewController
            if let accessToken = keychain.get("accessToken") {
                Client.shared.getUserData(token: accessToken) {
                    fName, lName, email in
                    
                    
                    if let email = email {
                        accountVC.tempEmail = email
                    }
                    if let firstName = fName {
                        if let lastName = lName {
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
    
    @IBAction func collectionsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "menuToCollections", sender: self)
    }
    
    
    @IBAction func videoButtonPressed(_ sender: Any) {
        if isLoggedIn {
            performSegue(withIdentifier: "menuToVideos", sender: self)
        } else {
            self.sender = "videos"
            performSegue(withIdentifier: "menuToLogin", sender: self)
        }
    }
    
    @IBAction func accountButtonPressed(_ sender: Any) {
        if isLoggedIn {
            performSegue(withIdentifier: "menuToAccount", sender: self)
        } else {
            self.sender = "account"
            performSegue(withIdentifier: "menuToLogin", sender: self)
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        keychain.delete("accessToken")
        isLoggedIn = false
        performSegue(withIdentifier: "menuToCollections", sender: self)
    }
    
    
}
