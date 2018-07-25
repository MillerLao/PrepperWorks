//
//  VideosViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/24/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideosViewController: UIViewController {
    
    @IBOutlet weak var videoPlayer: YouTubePlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoPlayer.loadVideoID("WDkg3h8PCVU")
        print("The duration is:")
        print(videoPlayer.getDuration())
//        let myVideoURL = NSURL(string: "youtu.be/WDkg3h8PCVU")
//        videoPlayer.loadVideoURL(myVideoURL! as URL)

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
