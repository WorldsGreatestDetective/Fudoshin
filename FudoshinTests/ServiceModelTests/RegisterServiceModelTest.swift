//
//  RegisterServiceModelTest.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/23/22.
//

import XCTest
import GRDB
@testable import Fudoshin

class RegisterServiceModelTest: XCTestCase {
    
    let user = MockUser()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInsertNewUser() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        let serviceModel = RegisterServiceModel(appDatabase: appDatabase, userModel: user)
        
        serviceModel.insertNewUser()
        try appDatabase.dbwriter.read({ db in
            try XCTAssertTrue(serviceModel.user.exists(db))
        })
    }
    
}
