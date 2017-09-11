//
//  User.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    //MARK: Properties
    
    var id: String
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
    
    //MARK: Initializers
    
    init() {
        
        self.id = ""
        self.name = ""
        self.username = ""
        self.email = ""
        self.address = Address()
        self.phone = ""
        self.website = ""
        self.company = Company()
    }
    
    required init(jsonData: SwiftyJSON.JSON) {
        
        self.id = jsonData["id"].stringValue
        self.name = jsonData["name"].stringValue
        self.username = jsonData["username"].stringValue
        self.email = jsonData["email"].stringValue
        self.address = Address(jsonData: jsonData["address"])
        self.phone = jsonData["phone"].stringValue
        self.website = jsonData["website"].stringValue
        self.company = Company(jsonData: jsonData["company"])
        
    }
}
