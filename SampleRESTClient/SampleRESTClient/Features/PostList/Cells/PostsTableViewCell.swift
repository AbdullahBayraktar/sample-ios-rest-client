//
//  PostsTableViewCell.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
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
     Assign the fields of post to UI components
     */
    func setupLogic(with post: Post) {
        
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}


