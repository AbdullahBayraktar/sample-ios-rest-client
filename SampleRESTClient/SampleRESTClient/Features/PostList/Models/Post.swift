//
//  Post.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import SwiftyJSON

class Post {
    
    //MARK: Properties
    
    var userId: String
    var id: String
    var title: String
    var body: String
    
    //MARK: Initializer
    
    required init(jsonData: SwiftyJSON.JSON) {
        
        self.userId = jsonData["userId"].stringValue
        self.id = jsonData["id"].stringValue
        self.title = jsonData["title"].stringValue
        self.body = jsonData["body"].stringValue
    }
}
