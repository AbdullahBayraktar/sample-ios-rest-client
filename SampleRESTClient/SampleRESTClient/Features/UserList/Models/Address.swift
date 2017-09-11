//
//  Address.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import SwiftyJSON

class Address {
    
    //MARK: Properties
    
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var latitude: String
    var longitude: String
    
    //MARK: Initializer
    
    init() {
        self.street = ""
        self.suite = ""
        self.city = ""
        self.zipcode = ""
        self.latitude = ""
        self.longitude = ""
    }
    
    required init(jsonData: SwiftyJSON.JSON) {
        
        self.street = jsonData["street"].stringValue
        self.suite = jsonData["suite"].stringValue
        self.city = jsonData["city"].stringValue
        self.zipcode = jsonData["zipcode"].stringValue
        self.latitude = jsonData["geo"]["latitude"].stringValue
        self.longitude = jsonData["geo"]["longitude"].stringValue
    }
}
