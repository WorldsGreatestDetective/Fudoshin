//
//  SettingsServiceModelTests.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 8/5/22.
//

import XCTest
import GRDB
@testable import Fudoshin

class SettingsServiceModelTests: XCTestCase {
    
    var user: User = {
        let user = User(id: User.setid(), firstName: "John", lastName: "Doe", email: "email", password: "password", beltLevel: .white)
        
        return user
    }()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testRemoveUserData() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try AppDatabase(dbwriter: dbQueue)
        
        let settingsServiceModel = SettingsServiceModel(appDatabase: appDatabase, user: user)
        
        let visitOne = Visit(id: Visit.setid(), userid: user.id, sessionType: .gi, visitDate: Date.setDateStringFromNow())
        let visitTwo = Visit(id: Visit.setid(), userid: user.id, sessionType: .noGi, visitDate: Date.setDateStringFromNow())
        let visitThree = Visit(id: Visit.setid(), userid: user.id, sessionType: .gi, visitDate: Date.setDateStringFromNow())
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        })
        
        settingsServiceModel.removeUserData()
        
        try appDatabase.dbwriter.write({ db in
            try XCTAssertFalse(user.exists(db))
            for visit in visits {
                try XCTAssertFalse(visit.exists(db))
            }
        })
    }
    
    func testUpdateEmail() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try AppDatabase(dbwriter: dbQueue)
        
        let settingsServiceModel = SettingsServiceModel(appDatabase: appDatabase, user: user)
        
        let visitOne = Visit(id: Visit.setid(), userid: user.id, sessionType: .gi, visitDate: Date.setDateStringFromNow())
        let visitTwo = Visit(id: Visit.setid(), userid: user.id, sessionType: .noGi, visitDate: Date.setDateStringFromNow())
        let visitThree = Visit(id: Visit.setid(), userid: user.id, sessionType: .gi, visitDate: Date.setDateStringFromNow())
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        })
        
        user.email = "newEmail"
        
        try appDatabase.dbwriter.write({ db in
            try user.update(db)
        })
        
        try appDatabase.dbwriter.read({ db in
            guard let fetchedUser = try User.fetchOne(db, key: user.id) else {return}
            XCTAssertEqual(user.email, fetchedUser.email)
        })
    }
    
    func testUpdateBeltLevel() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try AppDatabase(dbwriter: dbQueue)
        
        let settingsServiceModel = SettingsServiceModel(appDatabase: appDatabase, user: user)
        
        let visitOne = Visit(id: Visit.setid(), userid: user.id, sessionType: .gi, visitDate: Date.setDateStringFromNow())
        let visitTwo = Visit(id: Visit.setid(), userid: user.id, sessionType: .noGi, visitDate: Date.setDateStringFromNow())
        let visitThree = Visit(id: Visit.setid(), userid: user.id, sessionType: .gi, visitDate: Date.setDateStringFromNow())
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        })
        
        user.beltLevel = .blue
        
        try appDatabase.dbwriter.write({ db in
            try user.update(db)
        })
        
        try appDatabase.dbwriter.read({ db in
            guard let fetchedUser = try User.fetchOne(db, key: user.id) else {return}
            XCTAssertEqual(user.beltLevel, fetchedUser.beltLevel)
        })
    }
    
    func testUpdatePassword() throws {
        let dbQueue = DatabaseQueue()
        let appDatabase = try AppDatabase(dbwriter: dbQueue)
        
        let settingsServiceModel = SettingsServiceModel(appDatabase: appDatabase, user: user)
        
        let visitOne = Visit(id: Visit.setid(), userid: user.id, sessionType: .gi, visitDate: Date.setDateStringFromNow())
        let visitTwo = Visit(id: Visit.setid(), userid: user.id, sessionType: .noGi, visitDate: Date.setDateStringFromNow())
        let visitThree = Visit(id: Visit.setid(), userid: user.id, sessionType: .gi, visitDate: Date.setDateStringFromNow())
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try appDatabase.dbwriter.write({ db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        })
        
        user.password = "newPassword"
        
        try appDatabase.dbwriter.write({ db in
            try user.update(db)
        })
        
        try appDatabase.dbwriter.read({ db in
            guard let fetchedUser = try User.fetchOne(db, key: user.id) else {return}
            XCTAssertEqual(user.password, fetchedUser.password)
        })
    }
    
}
