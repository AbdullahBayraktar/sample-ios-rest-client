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
        
        //TODO: To be implemented
    }
    
    //MARK: Logic
    
    /**
     Assign the fields of user to UI components
     */
    func setupLogic(with user: User) {
        
        //TODO: To be implemented
    }
}
