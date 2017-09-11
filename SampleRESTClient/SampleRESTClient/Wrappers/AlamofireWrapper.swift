//
//  AlamofireWrapper.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Alamofire
import SwiftyJSON

public typealias RequestCompletionHandler = (SwiftyJSON.JSON?, Error?, Int) -> Void

public class AlamofireWrapper: NSObject {
    
    //MARK: - Request Methods
    
    /// Creates a DataRequest using the request method of Alamofire to retrieve the contents of the specified url,

    /// - parameter urlString: The URL.
    /// - parameter method: The HTTP method.
    /// - parameter parameters: The parameters. `nil` by default.
    /// - parameter encoding: The parameter encoding. `URLEncoding.default` by default.
    /// - parameter headers: The HTTP headers.
    
    public class func request(
        _ method: HTTPMethod,
        urlString: String,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: [String: String]?,
        completionHandler: @escaping RequestCompletionHandler){
        
        let request = Alamofire.request(urlString, method: method, parameters: parameters, encoding: encoding, headers: headers)
        request.validate()
        request.responseString { (response) -> Void in
            switch response.result {
            case .success(let value):
                let json = value.data(using: String.Encoding.utf8)
                    .flatMap{ JSON(data: $0) } ?? JSON(NSNull())
                
                //No Response Case
                let statusCode = response.response?.statusCode ?? -1
                
                print(request)
                return completionHandler(json, nil, statusCode)
            case .failure(let error):
                let data = response.data
                let jsonString = String(data: data!, encoding: String.Encoding.utf8)
                let json = jsonString?.data(using: String.Encoding.utf8)
                    .flatMap{ JSON(data: $0) } ?? JSON(NSNull())
                
                //No Internet Connection Case
                let statusCode = response.response?.statusCode ?? 0
                return completionHandler(json, error, statusCode)
            }
        }
    }
    
    //MARK: - Public
    
    /// Creates a Get Request using the request method of Alamofire to retrieve the contents of the specified url,
    
    /// - parameter urlString: The URL.
    /// - parameter parameters: The parameters. `nil` by default.
    /// - parameter headers: The HTTP headers.
    /// - parameter completionHandler: The callback of the reqest.
    
    public class func requestGet(
        _ urlString: String,
        parameters: Parameters? = nil,
        headers: HTTPHeaders?,
        completionHandler: @escaping RequestCompletionHandler) {
        
        self.request(.get, urlString: urlString, parameters: parameters, encoding: URLEncoding.default, headers: headers, completionHandler: completionHandler)
    }
    
    /// Creates a Post Request using the request method of Alamofire to retrieve the contents of the specified url,
    
    /// - parameter urlString: The URL.
    /// - parameter parameters: The parameters. `nil` by default.
    /// - parameter headers: The HTTP headers.
    /// - parameter completionHandler: The callback of the reqest.
    
    public class func requestPost(
        _ urlString: String,
        parameters: Parameters? = nil,
        headers: HTTPHeaders?,
        encoding: ParameterEncoding,
        completionHandler: @escaping RequestCompletionHandler) {
        
        self.request(.post, urlString: urlString, parameters: parameters, encoding: encoding, headers: headers, completionHandler: completionHandler)
    }
}
