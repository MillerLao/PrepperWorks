//
//  UserAccountViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/19/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit

class UserAccountViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = "The Name"
        email.text = "The Email"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
