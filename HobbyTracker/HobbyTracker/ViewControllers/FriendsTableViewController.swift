//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Timothy Rooney on 6/1/20.
//  Copyright © 2020 Timothy Rooney. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
//    var friends: [Friend] = [Friend(name: "Patrick", hometown: "New Jersey", hobbies: ["running"])]
     var friends: [Friend] = []
    // if you want to start out with no friends

    //
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddFriendModalSegue" {
            if let addFriendVC = segue.destination as? AddFriendsViewController {
                addFriendVC.delegate = self
            }
        } else if segue.identifier == "ShowFriendsDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let friendDetailVC = segue.destination as? FriendsDetailViewController{
                friendDetailVC.friend = friends[indexPath.row]
            }
        }
 
    }
    

}


//extension FriendsTableViewController: UITableViewDelegate {
    
//}

extension FriendsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        
        // original build
//        cell.nameLabel.text = friends[indexPath.row].name
//        cell.hometownLabel.text = friends[indexPath.row].hometown
//        cell.numberOfHobbiesLabel.text = "\(friends[indexPath.row].hobbies.count)"
//
        // alternate build
        // maybe there's a way to assign a friend object to the cell as a whole? 
         let friend = friends[indexPath.row]
         cell.friend = friend
        
        return cell
    }
    
    
}

extension FriendsTableViewController: AddFriendDelegate {
    
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
