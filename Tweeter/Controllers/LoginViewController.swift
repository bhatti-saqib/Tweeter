//
//  ViewController.swift
//  Tweeter
//
//  Created by Saqib Bhatti on 06/04/2019.
//  Copyright © 2019 Saqib Bhatti. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
    }

    // MARK: Target-Actions
    
    @IBAction private func onLoginTap(sender: AnyObject?) {
        
        let tweetsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tweetsVC")
        
        self.present(tweetsVC, animated: true, completion: nil)
    }

}

