//
//  UsersViewModel.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import UIKit

typealias UsersCompletionHandler = (Error?) -> Void

class UsersViewModel: NSObject {
    
    static let tableViewRowHeight: CGFloat = 100
    
    //MARK: Properties
    
    private(set) var usersViewModels = [CellRepresentable]()
    
    //MARK: Service Calls
    
    /**
     Makes a service call via UsersDataManager to fetch user items.
     */
    func fetchUsers(with completionHandler: @escaping UsersCompletionHandler) {
        
        UsersDataManager.fetchUsers { [weak self](usersResponse, error) in
            
            if let users = usersResponse?.users {
                
                guard let `self` = self else { return }
                
                self.usersViewModels = users.map { self.viewModelFor(user: $0) }
            }
            
            completionHandler(error)
        }
    }
    
    //MARK: Helpers
    
    /**
     Gets cell view model for the specific User.
     
     - Parameter user: User Data Model.
     - Returns: a viewModel Object that conforms to CellRepresentable Protocol.
     */
    private func viewModelFor(user: User) -> CellRepresentable {
        
        let viewModel = UserCellViewModel(user: user)
        
        return viewModel
    }

}
