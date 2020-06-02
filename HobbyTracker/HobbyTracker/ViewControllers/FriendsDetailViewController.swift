//
//  FriendsDetailViewController.swift
//  HobbyTracker
//
//  Created by Timothy Rooney on 6/1/20.
//  Copyright © 2020 Timothy Rooney. All rights reserved.
//

import UIKit

class FriendsDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var hobbyListTextView: UITextView!
    
    var friend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        var hobbyText = ""
        for hobby in friend.hobbies {
            hobbyText += "- \(hobby)\n"
        }
        
        hobbyListTextView.text = hobbyText
    }

}
