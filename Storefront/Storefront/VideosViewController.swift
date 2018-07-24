//
//  VideosViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/24/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "videosToMenu" {
            let menuVC = segue.destination as! MenuViewController
            
            menuVC.isLoggedIn = true
        }
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        performSegue(withIdentifier: "videosToMenu", sender: self)
    }


}
