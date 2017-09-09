//
//  UserCellViewModel.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import UIKit

class UserCellViewModel: NSObject {
    
    //MARK: Properties
    
    let user: User
    
    //MARK: Lifecycle
    
    /**
     Initializes view model with user object.
     
     - Parameter user: User Data Model.
     */
    init(user: User) {
        self.user = user
    }
}

//MARK: CellRepresentable

extension UserCellViewModel: CellRepresentable {
    
    /**
     Registers a nib for table view cell
     */
    static func registerCell(tableView: UITableView) {
        
        let cellNib = UINib(nibName: UsersTableViewCell.className, bundle: nil)
        
        tableView.register(cellNib, forCellReuseIdentifier: UsersTableViewCell.className)
    }
    
    /**
     Dequeues an already allocated cell or allocates a new one.
     
     - Returns: Table View Cell Instance.
     */
    func dequeueCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UsersTableViewCell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.className) as! UsersTableViewCell!
        
        cell.setupLogic(with: user)
        cell.tag = indexPath.row
        
        return cell
    }
    
    /**
     Gets Data Model for the selected cell.
     
     - Returns: Data Model object of Any type.
     */
    func modelForSelectedCell() -> Any {
        return user
    }
}
