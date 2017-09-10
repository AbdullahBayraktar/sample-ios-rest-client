//
//  UIStoryboard+storyboards.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    enum Storyboard: String {
        case users
        case posts
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    // MARK: - Class Functions
    
    /**
     Loads a storyboard with the given filename in the bundle.
     
     - Parameter storyboard: Storyboard to be loaded.
     - Parameter bundle: Bundle which the storyboard is available.
     - Returns: UIStoryboard instance.
     */
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    // MARK: - View Controller Instantiation
    
    /**
     Instantiates a view controller with the given identifier.
     
     - Parameter storyboardIdentifiable: identifier for the view controller.
     - Returns: instantiated view controller instance.
     */
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Could not instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}
