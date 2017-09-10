//
//  PostsResponse.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import SwiftyJSON

class PostsResponse {
    
    var posts = [Post]()
    
    required init?(jsonData: SwiftyJSON.JSON) {
        
        self.posts = jsonData.arrayValue.map({Post(jsonData:$0)})
    }
}
