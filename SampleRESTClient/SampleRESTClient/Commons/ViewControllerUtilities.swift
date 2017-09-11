//
//  ViewControllerUtilities.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 11/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

class ViewControllerUtilities {
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func showActivityIndicatory(uiView: UIView) {
        
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,
                                           y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        container.tag = 999
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(uiView: UIView) {
        
        activityIndicator.stopAnimating()
        
        for view in uiView.subviews{
            if view.tag == 999{
                view.removeFromSuperview()
            }
        }
    }
}
