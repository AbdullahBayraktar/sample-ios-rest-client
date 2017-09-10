//
//  UsersTableViewCell.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    //MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    //MARK: UI
    
    /**
     Sets UI components Fonts and Colors
     */
    private func setupUI(){
        
        selectionStyle = .none
        
        usernameLabel.textColor = Colors.Gray.dark
        nameLabel.textColor = Colors.Gray.medium
        emailLabel.textColor = Colors.Gray.dark
        addressLabel.textColor = Colors.Gray.medium
        
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        emailLabel.font = UIFont.systemFont(ofSize: 15.0)
        addressLabel.font = UIFont.systemFont(ofSize: 14.0)
    }

    //MARK: Logic
    
    /**
     Assign the fields of user to UI components
     */
    func setupLogic(with user: User,
                    usersAddress: String) {
        
        usernameLabel.text = "@" + user.username
        nameLabel.text = user.name
        emailLabel.text = user.email
        addressLabel.text = usersAddress
    }
}
