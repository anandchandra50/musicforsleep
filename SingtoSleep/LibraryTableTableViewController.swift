//
//  LibraryTableTableViewController.swift
//  SingtoSleep
//
//  Created by Kevin Li on 12/4/16.
//  Copyright © 2016 Kevin Li. All rights reserved.
//

import UIKit

class LibraryTableTableViewController: UITableViewController {
    
    var library = MusicLibrary().library

    override func viewDidLoad() {
        super.viewDidLoad()

         // Preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // If the user is opening the app for the first time, open the rating table
        if (!UserDefaults.standard.bool(forKey: "hasLaunchedOnce")) {
            UserDefaults.standard.set(true, forKey: "hasLaunchedOnce")
            UserDefaults.standard.synchronize()
            
            performSegue(withIdentifier: "showRatingTable", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view header
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Create header at top of table to hold shuffle button so that it always stays at the top
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40.0))
        headerView.backgroundColor = UIColor.white
        
        let shuffleButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width - 250)/2, y: 10, width: 250, height: 40))
        shuffleButton.setTitle("shuffle", for: UIControlState.normal)
        shuffleButton.backgroundColor = UIColor.green
        shuffleButton.addTarget(self, action: #selector(shuffleButtonPressed), for: .touchUpInside)
        headerView.addSubview(shuffleButton)
        
        return headerView
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        
        let row = indexPath.row
        
        if let genre = library[row]["genre"] {
            cell.songTitleLabel.text = genre
        }
    
        // Replace later to load image asynchronously, LazyTableImages?
        if let songID = library[row]["videoID"] {
            let thumbnailURL = "https://img.youtube.com/vi/\(songID)/default.jpg"
            
            if let data = NSData(contentsOf: URL(string: thumbnailURL)!) {
                cell.songImageView.image = UIImage(data: data as Data)
            }
        }

        return cell
    }
    
    // MARK: - General
    
    func shuffleButtonPressed() {
        print("Button Pressed")
        //TODO:
        //shuffle
        //get rid of text
        //reloading video every time
        //weighting of songs
        

//        // Toggle shuffle, save value in UserDefaults
//        if (!UserDefaults.standard.bool(forKey: "shuffle")) {
//            UserDefaults.standard.set(true, forKey: "shuffle")
//            print("Shuffle on")
//        } else {
//            UserDefaults.standard.set(false, forKey: "shuffle")
//            print("Shuffle off")
//        }
//        
//        UserDefaults.standard.synchronize()
    }

    
    // MARK: - Navigation

    @IBAction func tempButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showRatingTable", sender: nil)
    }
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPlayer", sender: self)
     }
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // Segue to song player
        if (segue.identifier == "showPlayer") {
            let playerViewController = segue.destination as! PlayerViewController
            let indexPath = tableView.indexPathForSelectedRow!
            playerViewController.trackID = indexPath.row
        }
    }
}
