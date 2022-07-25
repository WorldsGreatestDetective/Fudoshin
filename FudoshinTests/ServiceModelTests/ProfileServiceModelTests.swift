//
//  ProfileServiceModelTests.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 7/22/22.
//

import XCTest
import GRDB
@testable import Fudoshin

class ProfileServiceModelTests: XCTestCase {
    
    let database: MockDatabase = {
        var db: MockDatabase? = nil
        
        do {
            let dbQueue = DatabaseQueue()
            db = try MockDatabase(dbwriter: dbQueue)
        } catch {
            print(error)
        }
        
        return db!
    }()
    
    let user = MockUser()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCountByTotal() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let count = profileServiceModel.getCountByTotal()
        XCTAssertEqual(count, visits.count)
    }
    
    func testGetCountByWeek() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let countByWeek = profileServiceModel.getCountByWeek()
        XCTAssertEqual(countByWeek, visits.count)
    }
    
    func testCountbyMonth() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let countByMonth = profileServiceModel.getCountByMonth()
        XCTAssertEqual(countByMonth, visits.count)
    }
    
    func testGetCountByYears() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let countByYear = profileServiceModel.getCountByYear()
        XCTAssertEqual(countByYear, visits.count)
    }
    
    func testGetCountByTotalGi() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let visitsGi = [visitOne, visitTwo]
        let countGi = profileServiceModel.getCountByTotalGi()
        
        XCTAssertEqual(countGi, visitsGi.count)
    }
    
    func testGetCountByWeekGi() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let visitsGi = [visitOne, visitTwo]
        let countByWeek = profileServiceModel.getCountByWeekGi()
        
        XCTAssertEqual(countByWeek, visitsGi.count)
    }
    
    func testCountByMonthGi() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let visitsGi = [visitOne, visitTwo]
        let countbyMonthGi = profileServiceModel.getCountByMonthGi()
        
        XCTAssertEqual(countbyMonthGi, visitsGi.count)
    }
    
    func testGetCountByYearGi() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let visitsGi = [visitOne, visitTwo]
        let countByYearGi = profileServiceModel.getCountByYearGi()
        
        XCTAssertEqual(countByYearGi, visitsGi.count)
    }
    
    func testGetCountByTotalNoGi() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let visitsNoGi = [visitThree]
        let countNoGi = profileServiceModel.getCountByTotalNoGi()
        
        XCTAssertEqual(countNoGi, visitsNoGi.count)
    }
    
    func testGetCountByWeekNoGi() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let visitsNoGi = [visitThree]
        let countByWeekNoGi = profileServiceModel.getCountByWeekNoGi()
        
        XCTAssertEqual(countByWeekNoGi, visitsNoGi.count)
    }
    
    func testGetCountByMonthNoGi() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let visitsNoGi = [visitThree]
        let countByMonth = profileServiceModel.getCountByMonthNoGi()
        
        XCTAssertEqual(countByMonth, visitsNoGi.count)
    }
    
    func testGetCountByYearNoGi() throws {
        let visitOne = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitTwo = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: user.id)
        let visitThree = MockVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: user.id)
        
        let visits = [visitOne, visitTwo, visitThree]
        
        try database.dbwriter.write { db in
            try user.insert(db)
            for visit in visits {
                try visit.insert(db)
            }
        }
        
        let profileServiceModel = ProfileServiceModel(appDatabase: database, email: user.email, password: user.password, id: user.id, firstName: user.firstName, lastName: user.lastName, beltLevel: user.beltLevel)
        
        if let fetchedVisits = profileServiceModel.fetchVisitsByUser() {
            profileServiceModel.setVisits(visits: fetchedVisits)
        } else {
            print("visits could not be fetched")
        }
        
        let visitsNoGi = [visitThree]
        let countByYear = profileServiceModel.getCountByYearNoGi()
        
        XCTAssertEqual(countByYear, visitsNoGi.count)
    }

}
