//
//  DataManager.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

@objc enum RequestFailureReason: Int {
    case noResponse = -1
    case internetOffline = 0
    case badRequest = 400
    case authenticationFailed = 401
    case notFound = 404
    case unknown = 500
}

typealias ErrorCompletionHandler = (Error?) -> Void

class DataManager: NSObject {
    
    static let baseEndPoint = "https://jsonplaceholder.typicode.com"
    
    // MARK: - Get and Post Methods
    
    class func fetchData(
        fromURL urlString: String,
        authorizationRequired: Bool,
        parameters: Parameters?,
        completionHandler: @escaping RequestCompletionHandler) {
        
        let fullUrlString = baseEndPoint + urlString
        
        AlamofireWrapper.requestGet(fullUrlString, parameters: parameters, headers: nil) { json, error, statusCode in
            
            return completionHandler(json, error, statusCode)
        }
    }
    
    class func postData(
        withURL urlString: String,
        authorizationRequired: Bool,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        completionHandler: @escaping RequestCompletionHandler) {
        
        let fullUrlString = DataManager.baseEndPoint + urlString
        
        AlamofireWrapper.requestPost(fullUrlString, parameters: parameters, headers: nil, encoding: encoding) { json, error, statusCode in
            
            return completionHandler(json, error, statusCode)
        }
    }
    
    //MARK: Helpers
    
    class func getServiceURLPath(
        _ urlPath: String,
        withId id: String) -> String {
        
        return urlPath.replacingOccurrences(of: "%@", with: id)
    }
}
