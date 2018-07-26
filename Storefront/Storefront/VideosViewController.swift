//
//  VideosViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/24/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideosViewController: UIViewController
//, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var videoPlayer: YouTubePlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates for TableView
//        videoTableView.delegate = self
//        videoTableView.dataSource = self
        
        videoPlayer.loadVideoID("pFy5kaCteGE")
//        let myVideoURL = NSURL(string: "youtu.be/WDkg3h8PCVU")
//        videoPlayer.loadVideoURL(myVideoURL! as URL)
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
    
    // ----------------------------------
    //  MARK: - Accounts -
    //
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
}
