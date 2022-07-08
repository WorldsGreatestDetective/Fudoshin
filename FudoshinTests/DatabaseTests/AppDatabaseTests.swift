//
//  AppDatabaseTests.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/15/22.
//
//  TODO: Be sure to test db schema see: https://github.com/groue/GRDB.swift/blob/master/Documentation/DemoApps/GRDBDemoiOS/GRDBDemoiOSTests/AppDatabaseTests.swift
//

import XCTest
import GRDB
@testable import Fudoshin

class AppDatabaseTests: XCTestCase {
    
    var user = MockUser()
    
    // TODO: Test the db itself 

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
        
        let visit = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        
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
        
        let visit = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            try visit.insert(db)
            
            if let newVisit = try MockVisit.fetchOne(db, key: visit.id) {
                XCTAssertEqual(visit.visitDate, newVisit.visitDate)
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
    
    func testUserDelete() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            try user.delete(db)
            
            try XCTAssertFalse(user.exists(db))
        })
    }
    
    func testVisitDelete() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        let visit = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            try visit.insert(db)
            try visit.delete(db)
            
            try XCTAssertFalse(visit.exists(db))
        })
    }
    
    func testFetchAllUsers() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        let userOne = MockUser()
        let userTwo = MockUser()
        let userThree = MockUser()
        
        let userArray: [MockUser] = [userOne, userTwo, userThree]
        
        try appDatabase.dbwriter.write({ db in
            for user in userArray {
                try user.insert(db)
            }
            
            let newUserArray: [MockUser] = try MockUser.fetchAll(db)
            XCTAssertEqual(userArray, newUserArray)
        })
    }
}
