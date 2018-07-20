//
//  MenuViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/18/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import Buy

class MenuViewController: UIViewController {
    
    var token: Storefront.CustomerAccessToken? = nil
    var name: String = ""
    var email: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuToCollections" {
            let collectionsVC = segue.destination as! CollectionsViewController
            
            collectionsVC.isMember = true
        } else if segue.identifier == "menuToAccount" {
            let accountVC = segue.destination as! UserAccountViewController
            
            accountVC.tempName = self.name
            accountVC.tempEmail = self.email
        }
    }
    
    
    @IBAction func accountButtonPressed(_ sender: Any) {
        
        if let token = token {
            Client.shared.getUserData(token: token) {
                firstName, lastName, email in
                
                if let fname = firstName {
                    if let lname = lastName {
                        self.name = "\(fname)  \(lname)"
                        print(self.name)
                    }
                } else {
                    self.name = "No Name"
                    print(self.name)
                }
                if let email = email {
                    self.email = email
                }
            }
        }
//        performSegue(withIdentifier: "menuToAccount", sender: self)
        
    }
    
}
