//
//  LoginServiceModelTests.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 7/9/22.
//

import XCTest
import GRDB
@testable import Fudoshin

class LoginServiceModelTests: XCTestCase {
    
    let user = MockUser()

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try AppDatabase(dbwriter: dbQueue)
        
        let registerServiceModel = MockRegisterServiceModel(database: appDatabase)
        registerServiceModel.insertNewUser()
        
        let loginServiceModel = LoginServiceModel(email: user.email, password: user.password)
        let error = loginServiceModel.fetchUserByLogin()
        
        if error == nil {
            XCTAssertEqual(user.id, loginServiceModel.id)
        } else {
            print("login test failed")
        }
        
        
    }

}
