//
//  RatingTableViewCell.swift
//  SingtoSleep
//
//  Created by Rohit Chandra on 11/10/16.
//  Copyright © 2016 Anand Chandra. All rights reserved.
//

import UIKit
import YouTubePlayer

class RatingTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingVideo: YouTubePlayerView!
    @IBOutlet weak var ratingSlider: UISlider!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
