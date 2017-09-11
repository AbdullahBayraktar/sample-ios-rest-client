//
//  UsersDataManager.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation

typealias FetchUsersCompletionHandler = (UsersResponse?, Error?) -> Void

@objc class UsersDataManager : DataManager {
    
    /**
     Fetches users from the server.
     
     - Parameter completionHandler: Callback after call is completed.
     */
    class func fetchUsers(
        with completionHandler: @escaping FetchUsersCompletionHandler) {
        
        let urlPath = getServiceURLPath(Constants.URLPath.users, withId: "")
        
        DataManager.fetchData(fromURL:urlPath, authorizationRequired:true, parameters: nil) { json, error, statusCode in
            
            let usersResponse = UsersResponse(jsonData: json!)
            
            completionHandler(usersResponse, error)
        }
    }
}
