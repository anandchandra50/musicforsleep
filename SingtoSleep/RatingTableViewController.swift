//
//  RatingTableViewController.swift
//  SingtoSleep
//
//  Created by Kevin Li on 1/1/17.
//  Copyright © 2017 Kevin Li. All rights reserved.
//

import UIKit

class RatingTableViewController: UITableViewController {

    var library = MusicLibrary().library
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ratingCell", for: indexPath) as! RatingTableViewCell
        
        let row = indexPath.row
        
        // Set cell title
        if let genre = library[row]["genre"] {
            cell.songTitleLabel.text = genre
        }
        
        // Set cell video
        let playerVars = ["playsinline": 1]
        if let songID = library[row]["videoID"] {
            cell.playerView.load(withVideoId: songID, playerVars: playerVars)
        }
        
        // Connect like/dislike buttons
        cell.likeButton.tag = row
        cell.dislikeButton.tag = row
        
        cell.likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        cell.dislikeButton.addTarget(self, action: #selector(dislikeButtonPressed), for: .touchUpInside)
        
        // Check if the user has already rated the songs (Like = 1, Dislike = -1)
        cell.likeButton.isEnabled = true
        cell.dislikeButton.isEnabled = true
        if (UserDefaults.standard.integer(forKey: "songWithID\(row)") == 1) {
            cell.likeButton.isEnabled = false
        } else if (UserDefaults.standard.integer(forKey: "songWithID\(row)") == -1) {
            cell.dislikeButton.isEnabled = false
        }
        
        return cell
    }
 
    // MARK: Rating System
    
    func likeButtonPressed(_ sender: UIButton) {
        // Set song as liked in UserDefaults
        UserDefaults.standard.set(1, forKey: "songWithID\(sender.tag)")
        UserDefaults.standard.synchronize()
        
        // Reload the cell to update buttons
        let indexPath = IndexPath(item: sender.tag, section: 0)
        self.tableView.reloadRows(at: [indexPath], with: .none)
        
        print("like \(sender.tag)")
        
    }
    
    func dislikeButtonPressed(_ sender: UIButton) {
        // Set song as liked in UserDefaults
        UserDefaults.standard.set(-1, forKey: "songWithID\(sender.tag)")
        UserDefaults.standard.synchronize()
        
        // Reload the cell to update buttons
        let indexPath = IndexPath(item: sender.tag, section: 0)
        self.tableView.reloadRows(at: [indexPath], with: .none)
        
        print("dislike \(sender.tag)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
