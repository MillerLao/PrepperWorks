//
//  VideosViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/24/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var videoPlayer: YouTubePlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates for TableView
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        //Register .xib file
        videoTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "videoCell")
        
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoTableViewCell
        
        let videoArray = ["pFy5kaCteGE", "bARlff_VCLY", "4FO0DQcI860"]
        cell.videoPlayer.loadVideoID(videoArray[indexPath.row])
        
        return cell
    }
}
