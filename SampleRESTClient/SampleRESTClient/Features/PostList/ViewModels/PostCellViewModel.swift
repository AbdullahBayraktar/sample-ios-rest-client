//
//  PostCellViewModel.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import UIKit

class PostCellViewModel: NSObject {
    
    //MARK: Properties
    
    let post: Post
    
    //MARK: Lifecycle
    
    /**
     Initializes view model with post object.
     
     - Parameter post: Post Data Model.
     */
    init(post: Post) {
        self.post = post
    }
}

//MARK: CellRepresentable

extension PostCellViewModel: CellRepresentable {
    
    /**
     Registers a nib for table view cell
     */
    static func registerCell(tableView: UITableView) {
        
        let cellNib = UINib(nibName: PostsTableViewCell.className, bundle: nil)
        
        tableView.register(cellNib, forCellReuseIdentifier: PostsTableViewCell.className)
    }
    
    /**
     Dequeues an already allocated cell or allocates a new one.
     
     - Returns: Table View Cell Instance.
     */
    func dequeueCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PostsTableViewCell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.className) as! PostsTableViewCell!
        
        cell.setupLogic(with: post)
        cell.tag = indexPath.row
        
        return cell
    }
    
    /**
     Gets Data Model for the selected cell.
     
     - Returns: Data Model object of Any type.
     */
    func modelForSelectedCell() -> Any {
        return post
    }
}
