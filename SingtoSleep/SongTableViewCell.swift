//
//  SongTableViewCell.swift
//  SingtoSleep
//
//  Created by Kevin Li on 12/4/16.
//  Copyright © 2016 Anand Chandra. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func dislikeButtonPressed(_ sender: Any) {
        dislikeButton.titleLabel?.textColor = UIColor.black
        likeButton.titleLabel?.textColor = UIColor.lightGray
        print("button pressed")

    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        likeButton.titleLabel?.textColor = UIColor.black
        dislikeButton.titleLabel?.textColor = UIColor.lightGray

    }
    
}
