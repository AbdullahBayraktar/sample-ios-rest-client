//
//  Router.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

protocol Router {
    
    /**
     Routes to the Screen specified by routeId.
     
     - Parameter routeID: Screen to be routed to.
     - Parameter context: The current view controller.
     - Parameter parameters: Any data or model that should be passed to the next view controller.
     */
    func route(
        to routeID: String,
        from context: UIViewController,
        parameters: Any?
    )
}
