//
//  AppDatabaseTests.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/15/22.
//

import XCTest
import GRDB
@testable import Fudoshin

class AppDatabaseTests: XCTestCase {
    
    var user = MockUser()

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserInsert() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        try appDatabase.dbwriter.write { db in
            try user.insert(db)
            try XCTAssertTrue(user.exists(db))
        }
    }
    
    func testVisitInsert() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        let visit = MockVisit(userid: user.id, visitDate: Date.now)
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            
            try visit.insert(db)
            try XCTAssertTrue(visit.exists(db))
        })
    }
    
    func testUserFetch() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            
            let newUser = try MockUser.fetchOne(db, key: user.id)
            XCTAssertEqual(user, newUser)
        })
    }
    
    func testVisitFetch() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        let visit = MockVisit(userid: user.id, visitDate: Date.now)
        
        let otherVisit = visit
        XCTAssertEqual(visit, otherVisit)
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            try visit.insert(db)
            
            if let newVisit = try MockVisit.fetchOne(db, key: visit.id) {
               // XCTAssertEqual(visit.visitDate, newVisit.visitDate)
            }
        })
    }
    
    func testUserUpdate() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            user.firstName = "Jane"
            
            try user.update(db)
            let newUser = try MockUser.fetchOne(db, key: user.id)
            
            XCTAssertEqual(user, newUser)
        })
    }
    
    func testVisitUpdate() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
