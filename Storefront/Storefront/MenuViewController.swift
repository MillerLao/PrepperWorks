//
//  MenuViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/24/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var isLoggedIn:Bool = false
    var sender:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}
