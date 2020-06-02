//
//  AddFriendsViewController.swift
//  HobbyTracker
//
//  Created by Timothy Rooney on 6/1/20.
//  Copyright © 2020 Timothy Rooney. All rights reserved.
//

import UIKit

protocol AddFriendDelegate {
    func friendWasCreated(_ friend: Friend)
}

class AddFriendsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    
    @IBOutlet weak var hobbyOneTextField: UITextField!
    @IBOutlet weak var hobbyTwoTextField: UITextField!
    @IBOutlet weak var hobbyThreeTextField: UITextField!
    
    var delegate: AddFriendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        // code in youtube video is: nameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text,
            let hometown = hometownTextField.text,
            !name.isEmpty,
            !hometown.isEmpty else { return }
        
        var friend = Friend(name: name, hometown: hometown, hobbies: [])
        
        if let hobbyOne = hobbyOneTextField.text,
            !hobbyOne.isEmpty {
            friend.hobbies.append(hobbyOne)
        }
        
        if let hobbyTwo = hobbyTwoTextField.text,
            !hobbyTwo.isEmpty {
            friend.hobbies.append(hobbyTwo)
        }
        
        if let hobbyThree = hobbyThreeTextField.text,
            !hobbyThree.isEmpty {
            friend.hobbies.append(hobbyThree)
        }
        
        delegate?.friendWasCreated(friend)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AddFriendsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // becomeFirstResponder() lets cursor switch between text fields
        
        if let text = textField.text,
            !text.isEmpty {
            switch textField {
            case nameTextField:
                hometownTextField.becomeFirstResponder()
            case hometownTextField:
                hobbyOneTextField.becomeFirstResponder()
            case hobbyOneTextField:
                hobbyTwoTextField.becomeFirstResponder()
            case hobbyTwoTextField:
                hobbyThreeTextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        
    
        return false
    }
}
