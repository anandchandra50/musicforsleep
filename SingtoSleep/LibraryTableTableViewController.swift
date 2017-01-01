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
        // performSegue(withIdentifier: "showRatingTable", sender: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view header
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40.0))
        
        let shuffleButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width - 250)/2, y: 10, width: 250, height: 40))
        shuffleButton.setTitle("Shuffle", for: UIControlState.normal)
        shuffleButton.backgroundColor = UIColor.green
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

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
