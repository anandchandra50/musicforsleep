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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
        
        return cell
    }
 
    // MARK: Rating System
    
    func likeButtonPressed(_ sender: UIButton) {
        print("like \(sender.tag)")
    }
    
    func dislikeButtonPressed(_ sender: UIButton) {
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
