//
//  UserAccountViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/19/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import KeychainSwift

class UserAccountViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    let keychain = KeychainSwift()
    
    //Temp var to hold user data
    var tempName: String = ""
    var tempEmail: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(keychain.get("accessToken"))
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        //Set temp data to actual labels to be displayed on screen
        name.text = "tempName"
        email.text = "tempEmail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "accountToMenu" {
            let menuVC = segue.destination as! MenuViewController
            
            menuVC.isLoggedIn = true
        }
    }

    @IBAction func menuPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "accountToMenu", sender: self)
        
    }
    

}
