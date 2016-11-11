//
//  RatingViewController.swift
//  SingtoSleep
//
//  Created by Rohit Chandra on 11/10/16.
//  Copyright © 2016 Anand Chandra. All rights reserved.
//

import UIKit


class RatingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var ratingTableView: UITableView!
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
