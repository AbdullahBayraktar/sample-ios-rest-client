//
//  PostsRouter.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

class PostsRouter: Router {
    
    unowned var viewModel: PostsViewModel
    
    /**
     Creats PostsRouter Instance with a viewModel.
     
     - Parameter viewModel: keep a weak reference to the viewModel.
     */
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
    }
    
    /**
     Routes to the Screen specified by routeId.
     
     - Parameter routeID: Screen to be routed to.
     - Parameter context: The current view controller.
     - Parameter parameters: Any data or model that should be passed to the next view controller.
     */
    
    func route(
        to routeID: String,
        from context: UIViewController,
        parameters: Any?){

        //TODO: To be implemented when needed
    }

}
