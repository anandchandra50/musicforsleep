//
//  RatingViewController.swift
//  SingtoSleep
//
//  Created by Rohit Chandra on 11/10/16.
//  Copyright © 2016 Anand Chandra. All rights reserved.
//

import UIKit
import YouTubePlayer

class RatingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var ratingTableView: UITableView!
    
    let videoArray: [String] = ["9E6b3swbnWg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingTableView.delegate = self
        ratingTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ratingTableView.dequeueReusableCell(withIdentifier: "RatingTableCell", for: indexPath) as! RatingTableViewCell
        //cell.videoID = videoArray[indexPath.row]
        cell.ratingVideo.loadVideoID(videoArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
