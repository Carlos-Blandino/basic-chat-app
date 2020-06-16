//
//  WelcomeViewController.swift
//
//  basic-chat-app
//
//  Created by Carlos Blandino on 6/10/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        let theTitle = C.appName
        var count = 0.0
        for letter in theTitle {
            Timer.scheduledTimer(withTimeInterval: 0.1 + count, repeats: false) { (theTimer) in
                self.titleLabel.text!.append(letter)
            }
            count += 0.1
            print(Date().timeIntervalSince)
        }
        
    }
    

}
