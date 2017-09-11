//
//  Company.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import Foundation
import SwiftyJSON

class Company {
    
    //MARK: Properties
    
    var name: String
    var catchPhrase: String
    var bs: String
    
    //MARK: Initializer
    
    init() {
        self.name = ""
        self.catchPhrase = ""
        self.bs = ""
    }
    
    required init(jsonData: SwiftyJSON.JSON) {
        
        self.name = jsonData["name"].stringValue
        self.catchPhrase = jsonData["catchPhrase"].stringValue
        self.bs = jsonData["bs"].stringValue
    }
}
