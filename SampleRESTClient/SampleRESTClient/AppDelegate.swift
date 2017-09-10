//
//  AppDelegate.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 08/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Launcher.launch(with: window)
        
        return true
    }
}
