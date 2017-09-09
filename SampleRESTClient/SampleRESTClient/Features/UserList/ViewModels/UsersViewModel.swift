//
//  UsersViewModel.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import UIKit

class UsersViewModel: NSObject {
    
    static let tableViewRowHeight: CGFloat = 100
    
    //MARK: Properties
    
    private(set) var usersViewModels = [CellRepresentable]()
    
    /**
     Initializes view model.
     */
    override init() {
        //self.usersViewModels = user
        super.init()
    }
    
    //MARK: Service Calls
    
    /**
     Makes a service call via UsersDataManager to fetch user items.
     */
    func fetchUsers() {
        
        //TODO: To be impelemented
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
