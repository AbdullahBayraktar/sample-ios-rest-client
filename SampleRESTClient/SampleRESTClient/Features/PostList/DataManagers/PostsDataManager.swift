//
//  PostsDataManager.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation

typealias FetchPostsCompletionHandler = (PostsResponse?, Error?) -> Void

class PostsDataManager : DataManager {
    
    /**
     Fetches posts from the server.
     - Parameter userId: Id for the user which the posts are related to.
     - Parameter completionHandler: Callback after call is completed.
     */
    
    class func fetchPosts(
        withUserId userId: String,
        completionHandler: @escaping FetchPostsCompletionHandler) {
        
        let urlPath = getServiceURLPath(Constants.URLPath.posts, withId: "")
        let parameters = ["userId": userId]
        
        DataManager.fetchData(fromURL:urlPath, authorizationRequired:true, parameters: parameters) { json, error, statusCode in
            
            let postsResponse = PostsResponse(jsonData: json!)
            
            completionHandler(postsResponse, error)
        }
    }
}
