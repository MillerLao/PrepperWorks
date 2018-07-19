//
//  MenuViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/18/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var token: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuToCollections" {
            let collectionsVC = segue.destination as! CollectionsViewController
            
            collectionsVC.isMember = true
        }
    }
}
