//
//  VideoTableViewCell.swift
//  Storefront
//
//  Created by HKP3 Waylon on 7/27/18.
//  Copyright © 2018 Shopify Inc. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
