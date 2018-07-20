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
    
    //Temp var to hold user data
    var tempName: String = ""
    var tempEmail: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        //Set temp data to actual labels to be displayed on screen
        name.text = tempName
        email.text = tempEmail
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
