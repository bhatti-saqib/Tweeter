//
//  TweetsViewController.swift
//  Tweeter
//
//  Created by Saqib Bhatti on 07/04/2019.
//  Copyright © 2019 Saqib Bhatti. All rights reserved.
//

import UIKit

class TweetsViewController:UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweets:[String] = []
    var post:PostViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as! TweetsCell
        cell.tweetLabel.text = tweets[indexPath.row]
        
        return cell  // return
    }
    
    
    // The following method will return back the input message to the previous screen and display it in the table
    @IBAction func unwindFromPostVC(_ sender:UIStoryboardSegue) {
        if sender.source is PostViewController {
            if let senderVC = sender.source as? PostViewController {
                tweets = senderVC.message
            }
            tableView.reloadData()
        }
    }
}

