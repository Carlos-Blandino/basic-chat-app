//
//  ChatViewController.swift
//
//  basic-chat-app
//
//  Created by Carlos Blandino on 6/10/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var message: [Message] = [
        Message(sender: "2@2.com", body: "I'm here"),
        Message(sender: "3@3.com", body: "Hello there"),
        Message(sender: "2@2.com", body: "He is at it again")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = C.appName
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutTapped(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: C.cellIdentifier, for: indexPath)
        cell.textLabel!.text = message[indexPath.row].body
        return cell
    }
    
    
}
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
