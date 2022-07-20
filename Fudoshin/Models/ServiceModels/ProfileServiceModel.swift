//
//  ProfileServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/19/22.
//

import Foundation

class ProfileServiceModel: ProfileServiceModelProtocol {
    internal var user: UserModelProtocol
    internal var appDatabase: AppDatabaseProtocol
    
    init(appDatabase: AppDatabaseProtocol, email: String, password: String, id: String, firstName: String, lastName: String, beltLevel: BeltLevel) {
        self.appDatabase = appDatabase
        
        self.email = email
        self.password = password
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.beltLevel = beltLevel
        
        self.user = User(id: id, firstName: firstName, lastName: lastName, email: email, password: password, beltLevel: beltLevel)
        
        if let fetchedVisits = fetchVisitsByUser() {
            setVisits(visits: fetchedVisits)
        } else {
            setVisits(visits: [])
        }
    }
    
    internal var newVisit: VisitModelProtocol?
    internal var visits: [VisitModelProtocol]
    
    
    
    var email: String
    var password: String
    var id: String
    var firstName: String
    var lastName: String
    var beltLevel: BeltLevel
    
    func getCountByWeek() -> [Int] {
        <#code#>
    }
    
    func getCountByMonth() -> [Int]? {
        guard let months = getMonthsByVisits() else {return nil}
        
        //let visitsByMonth = visits.filter {$0}
    }
    
    func getCountByYear() -> [Int] {
        <#code#>
    }
    
    func getCountByTotal() -> [Int] {
        <#code#>
    }
    
    func insertNewVisit() {
        guard let newVisit = newVisit else {return}
        
        do {
            try appDatabase.dbwriter.write({ db in
                try newVisit.insert(db)
            })
        } catch {
            print(error)
        }
    }
    
    internal func fetchVisitsByUser() -> [VisitModelProtocol]? {
        var newVisits: [VisitModelProtocol]? = nil
        
        do {
            try appDatabase.dbwriter.write({ db in
                let fetchVisitsSQL = "SELECT * FROM MockVisit where userid = ?"
                let fetchVisitsStmt = try db.makeStatement(sql: fetchVisitsSQL)
                fetchVisitsStmt.arguments = ["\(user.id)"]
                
                if let fetchedVisits = try? Visit.fetchAll(fetchVisitsStmt, arguments: fetchVisitsStmt.arguments, adapter: nil) {
                    newVisits = fetchedVisits
                }
            })
        } catch {
            print(error)
        }
        
        return newVisits
    }
    
    func getMonthsByVisits() -> [Int]? {
        var months: [Int] = []
        let formatter = DateFormatter()
        
        for visit in visits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let monthComponent = Calendar.current.dateComponents([.month], from: dateOfVisit)
            guard let month = monthComponent.month else {return nil}
            
            months.append(month)
        }
        
        return months
    }
    
    internal func setNewVisit(visit: VisitModelProtocol) {
        newVisit = visit
    }
    
    internal func setVisits(visits: [VisitModelProtocol]) {
        self.visits = visits
    }
    
}
