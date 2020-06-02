//
//  FriendTableViewCell.swift
//  HobbyTracker
//
//  Created by Timothy Rooney on 6/1/20.
//  Copyright © 2020 Timothy Rooney. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var numberOfHobbiesLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
//    deleted in alternate lecturer version
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

// deleted in alternate lecturer version
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        numberOfHobbiesLabel.text = "\(friend.hobbies.count)"
    }

}
