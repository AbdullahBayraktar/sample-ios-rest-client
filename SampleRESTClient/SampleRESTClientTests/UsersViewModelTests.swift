//
//  UsersViewModelTests.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 11/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import XCTest
@testable import SampleRESTClient

class UsersViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserCellShouldDisplayCorrectName() {
        
        let user = User()
        user.name = "Abdullah Bayraktar"
        let viewModel = UserCellViewModel(user: user)
        
        XCTAssertEqual(viewModel.user.name, "Abdullah Bayraktar")
        XCTAssertNotEqual(viewModel.user.name, "Ian Keen")
    }
    
    func testUserCellShouldDisplayCorrectAddress() {

        let user = User()
        user.address.street = "Kulas Light"
        user.address.suite = "Apt. 556"
        user.address.city = "Gwenborough"
        user.address.zipcode = "92998-3874"
        let viewModel = UserCellViewModel(user: user)
        
        XCTAssertNotEqual(viewModel.address(), "")
        XCTAssertEqual(viewModel.address(), "Kulas Light Apt. 556 Gwenborough 92998-3874")
        XCTAssertNotEqual(viewModel.address(), "Kulas LightApt. 556Gwenborough92998-3874")
    }
    
}
