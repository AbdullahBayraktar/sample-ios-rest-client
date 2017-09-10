//
//  UsersResponse.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import SwiftyJSON

class UsersResponse {
    
    var users = [User]()
    
    required init?(jsonData: SwiftyJSON.JSON) {
        
        self.users = jsonData.arrayValue.map({User(jsonData:$0)})
    }
}
