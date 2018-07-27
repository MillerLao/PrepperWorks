//
//  VideosViewController.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/24/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var videoTableView: UITableView!
    
    let videoList = ["pFy5kaCteGE", "bARlff_VCLY", "4FO0DQcI860", "DvWRBHpRtRM", "W8Aka88R0Ac", "3k5cNkGCAOc", "zzsoM2XNemw"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        videoTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "videoCell")
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
    //  MARK: - TableView Protocols -
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoTableViewCell
        
        cell.videoPlayer.loadVideoID(videoList[indexPath.row])
        return cell
    }
}
