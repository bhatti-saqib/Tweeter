//
//  PostViewController.swift
//  Tweeter
//
//  Created by Saqib Bhatti on 07/04/2019.
//  Copyright © 2019 Saqib Bhatti. All rights reserved.
//

import UIKit


class PostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    
    var message:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /*@IBAction func newMessageBtnPressed(_ sender: UIButton) {
        if let msg = tweetTextView.text {
            print("message:\(msg)")
        }
        else {
            print("Empty")
        }
        dismiss(animated: true, completion: nil)
    }*/
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newMessage = tweetTextView.text {
            message = [newMessage]
        }
    }
}
