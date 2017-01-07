//
//  RatingTableViewCell.swift
//  SingtoSleep
//
//  Created by Kevin Li on 1/1/17.
//  Copyright © 2017 Kevin Li. All rights reserved.
//

import UIKit

import youtube_ios_player_helper

class RatingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    @IBOutlet weak var playerView: YTPlayerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
