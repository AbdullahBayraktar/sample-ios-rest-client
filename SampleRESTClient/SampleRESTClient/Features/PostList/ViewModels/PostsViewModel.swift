//
//  PostsViewModel.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import UIKit

typealias PostsCompletionHandler = (Error?) -> Void

class PostsViewModel: NSObject {
    
    static let tableViewRowHeight: CGFloat = 100
    
    //MARK: Properties
    
    var userId: String
    private(set) var postsViewModels = [CellRepresentable]()
    
    //MARK: Lifecycle
    
    required init(userId: String) {
        self.userId = userId
        super.init()
    }
    
    //MARK: Service Calls
    
    /**
     Makes a service call via PostsDataManager to fetch post items.
     */
    func fetchPosts(with completionHandler: @escaping PostsCompletionHandler) {
        
        PostsDataManager.fetchPosts(withUserId: userId) { [weak self] (postsResponse, error) in
            
            if let posts = postsResponse?.posts {
                
                guard let `self` = self else { return }
                
                self.postsViewModels = posts.map { self.viewModelFor(post: $0) }
            }
            
            completionHandler(error)
        }
    }
    
    //MARK: Helpers
    
    /**
     Gets cell view model for the specific Post.
     
     - Parameter post: Post Data Model.
     - Returns: a viewModel Object that conforms to CellRepresentable Protocol.
     */
    private func viewModelFor(post: Post) -> CellRepresentable {
        
        let viewModel = PostCellViewModel(post: post)
        
        return viewModel
    }
    
}
