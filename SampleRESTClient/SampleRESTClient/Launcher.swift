//
//  Launcher.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

class Launcher {
    
    static func launch(with window: UIWindow?) {
        if let rootViewController = window?.rootViewController as? UINavigationController,
            let viewController = rootViewController.viewControllers.first as? UsersViewController {
            let viewModel = UsersViewModel()
            viewController.viewModel = viewModel
            viewController.router = UsersRouter(viewModel: viewModel)
        }
    }
}
