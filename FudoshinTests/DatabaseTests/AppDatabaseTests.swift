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
        
        let users: [MockUser] = [userOne, userTwo, userThree]
        
        try appDatabase.dbwriter.write({ db in
            for user in users {
                try user.insert(db)
            }
            
            let newUsers: [MockUser] = try MockUser.fetchAll(db)
            XCTAssertEqual(users, newUsers)
        })
    }
    
    func testFetchAllVisits() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try MockDatabase(dbwriter: dbQueue)
        
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            
            for visit in visits {
                try visit.insert(db)
            }
            
            let fetchVisitsSQL = "SELECT * FROM MockVisit where userid = ?"
            let fetchVisitsStmt = try db.makeStatement(sql: fetchVisitsSQL)
            fetchVisitsStmt.arguments = ["\(user.id)"]
            
            let newVisits = try MockVisit.fetchAll(fetchVisitsStmt, arguments: fetchVisitsStmt.arguments, adapter: nil)
            
            XCTAssertEqual(visits, newVisits)
            for visit in newVisits {
                XCTAssertEqual(visit.userid, user.id)
            }
        })
    }
    
    /*
     let fetchUserSQL = "SELECT * FROM VisitLog WHERE userid = ?"
     let fetchUserStatement = try db.makeStatement(sql: fetchUserSQL)
             
     fetchUserStatement.arguments = ["\(userid)"]
     
     visitLog = try VisitLog.fetchAll(fetchUserStatement, arguments: fetchUserStatement.arguments, adapter: nil)
     */
}
