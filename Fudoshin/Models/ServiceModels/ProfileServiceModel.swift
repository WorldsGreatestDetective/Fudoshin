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
        
        setAllVisits()
        keepUserLoggedIn()
    }
    
    internal var newVisit: VisitModelProtocol? = nil
    
    internal var visits: [VisitModelProtocol] = []
    internal var noGiVisits: [VisitModelProtocol] = []
    internal var giVisits: [VisitModelProtocol] = []
    
    var email: String
    var password: String
    var id: String
    var firstName: String
    var lastName: String
    var beltLevel: BeltLevel
    
    func isUserUpdated() -> Bool? {
        guard let fetchedUser = fetchUserById() else {return nil}
        
        if user.beltLevel == fetchedUser.beltLevel,
           user.password == fetchedUser.password,
           user.email == fetchedUser.email {
            return true
        } else {
            return false
        }
    }
    
    func getCountByWeek() -> Int? {
        guard let weeks = getWeeksByVisits() else {return nil}
        
        let visitsThisWeek = weeks.filter {$0 == Date.currentWeekOfMonth} // TODO: Rename constant; doesnt make sense
        return visitsThisWeek.count
    }
    
    func getCountByWeekGi() -> Int? {
        guard let weeks = getWeeksByVisitsGi() else {return nil}
        
        let visitsThisWeek = weeks.filter {$0 == Date.currentWeekOfMonth}
        return visitsThisWeek.count
    }
    
    func getCountByWeekNoGi() -> Int? {
        guard let weeks = getWeeksByVisitsNoGi() else {return nil}
        
        let visitsThisWeek = weeks.filter {$0 == Date.currentWeekOfMonth}
        return visitsThisWeek.count
    }
    
    func getCountByMonth() -> Int? {
        guard let months = getMonthsByVisits() else {return nil}
        
        let visitsThisMonth = months.filter {$0 == Date.currentMonth}
        return visitsThisMonth.count
    }
    
    func getCountByMonthGi() -> Int? {
        guard let months = getMonthsByVisitsGi() else {return nil}
        
        let visitsThisMonth = months.filter {$0 == Date.currentMonth}
        return visitsThisMonth.count
    }
    
    func getCountByMonthNoGi() -> Int? {
        guard let months = getMonthsByVisitsNoGi() else {return nil}
        
        let visitsThisMonth = months.filter {$0 == Date.currentMonth}
        return visitsThisMonth.count
    }
    
    func getCountByYear() -> Int? {
        guard let years = getYearsByVisits() else {return nil}
        
        let visitsThisYear = years.filter {$0 == Date.currentYear}
        return visitsThisYear.count
    }
    
    func getCountByYearGi() -> Int? {
        guard let years = getYearsByVisitsGi() else {return nil}
        
        let visitsThisYear = years.filter {$0 == Date.currentYear}
        return visitsThisYear.count
    }
    
    func getCountByYearNoGi() -> Int? {
        guard let years = getYearsByVisitsNoGi() else {return nil}
        
        let visitsThisYear = years.filter {$0 == Date.currentYear}
        return visitsThisYear.count
    }
    
    func getCountByTotal() -> Int? {
        return visits.count
    }
    
    func getCountByTotalGi() -> Int? {
        return giVisits.count
    }
    
    func getCountByTotalNoGi() -> Int? {
        return noGiVisits.count
    }
    
    internal func getWeeksByVisits() -> [Int]? {
        var weeks: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in visits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {print("Could not format string"); return nil}
            
            let weekComponent = Calendar.current.dateComponents([.weekOfMonth], from: dateOfVisit)
            guard let week = weekComponent.weekOfMonth else {print("could not extract component"); return nil}
            
            weeks.append(week)
        }
        
        return weeks
    }
    
    internal func getWeeksByVisitsGi() -> [Int]? {
        var weeks: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in giVisits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let weekComponent = Calendar.current.dateComponents([.weekOfMonth], from: dateOfVisit)
            guard let week = weekComponent.weekOfMonth else {return nil}
            
            weeks.append(week)
        }
        
        return weeks
    }
    
    internal func getWeeksByVisitsNoGi() -> [Int]? {
        var weeks: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in noGiVisits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let weekComponent = Calendar.current.dateComponents([.weekOfMonth], from: dateOfVisit)
            guard let week = weekComponent.weekOfMonth else {return nil}
            
            weeks.append(week)
        }
        
        return weeks
    }
    
    internal func getMonthsByVisits() -> [Int]? {
        var months: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in visits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let monthComponent = Calendar.current.dateComponents([.month], from: dateOfVisit)
            guard let month = monthComponent.month else {return nil}
            
            months.append(month)
        }
        
        return months
    }
    
    internal func getMonthsByVisitsGi() -> [Int]? {
        var months: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in giVisits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let monthComponent = Calendar.current.dateComponents([.month], from: dateOfVisit)
            guard let month = monthComponent.month else {return nil}
            
            months.append(month)
        }
        
        return months
    }
    
    internal func getMonthsByVisitsNoGi() -> [Int]? {
        var months: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in noGiVisits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let monthComponent = Calendar.current.dateComponents([.month], from: dateOfVisit)
            guard let month = monthComponent.month else {return nil}
            
            months.append(month)
        }
        
        return months
    }
    
    internal func getYearsByVisits() -> [Int]? {
        var years: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in visits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let yearComponent = Calendar.current.dateComponents([.year], from: dateOfVisit)
            guard let year = yearComponent.year else {return nil}
            
            years.append(year)
        }
        
        return years
    }
    
    internal func getYearsByVisitsGi() -> [Int]? {
        var years: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in giVisits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let yearComponent = Calendar.current.dateComponents([.year], from: dateOfVisit)
            guard let year = yearComponent.year else {return nil}
            
            years.append(year)
        }
        
        return years
    }
    
    internal func getYearsByVisitsNoGi() -> [Int]? {
        var years: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in noGiVisits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let yearComponent = Calendar.current.dateComponents([.year], from: dateOfVisit)
            guard let year = yearComponent.year else {return nil}
            
            years.append(year)
        }
        
        return years
    }
    
    func getVisits() -> [VisitModelProtocol] {
        return visits
    }
    
    func setVisits(visits: [VisitModelProtocol]) {
        self.visits = visits
    }
    
    func getUser() -> UserModelProtocol {
        return self.user
    }
    
    func saveNewVisit(id: String, visitDate: DateString, sessionType: SessionType, userid: String) {
        insertNewVisit(id: id, visitDate: visitDate, sessionType: sessionType, userid: userid)
        if let newVisit = newVisit {
            visits.append(newVisit)
        } else {
            return
        }
    }
    
    internal func setAllVisits() {
        guard let fetchedVisits = fetchVisitsByUser() else {return} // TODO: provide error handling
        
        visits = fetchedVisits
        
        let noGiVisits = visits.filter {$0.sessionType == .noGi}
        let giVisits = visits.filter {$0.sessionType == .gi}
        
        self.noGiVisits = noGiVisits
        self.giVisits = giVisits
    }
    
    func fetchUserById() -> UserModelProtocol? {
        var fetchedUser: UserModelProtocol?
        
        do {
            try appDatabase.dbwriter.write({ db in
                fetchedUser = try User.fetchOne(db, key: self.id)
            })
        } catch {
            print(error)
        }
        return fetchedUser
    }
    
    internal func fetchVisitsByUser() -> [VisitModelProtocol]? {
        var newVisits: [VisitModelProtocol]? = nil
        
        do {
            try appDatabase.dbwriter.write({ db in
                let fetchVisitsSQL = "SELECT * FROM Visit where userid = ?"
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
    
    internal func insertNewVisit(id: String, visitDate: DateString, sessionType: SessionType, userid: String) {
        newVisit = Visit(id: id, userid: userid, sessionType: sessionType, visitDate: visitDate)
        
        do {
            try appDatabase.dbwriter.write({ db in
                guard let newVisit = newVisit else {return}
                try newVisit.insert(db)
            })
        } catch {
            print(error)
        }
    }
    
    internal func keepUserLoggedIn() {
        
        if isOneActiveUser() == true {
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
            
            insertActiveUser()
        }
    }
    
    internal func insertActiveUser() {
        if checkForActiveUser() == false {
            do {
                try ActiveUserDatabase.sharedPool.dbwriter.write({ db in
                    try user.insert(db)
                })
            } catch {
                print(error)
            }
        }
    }
    
    internal func checkForActiveUser() -> Bool { // TODO: Rename method? (rename from protocol)
        var doesExist: Bool = false // TODO: true or false?
        
        do {
            try ActiveUserDatabase.sharedPool.dbwriter.read({ db in
                if try user.exists(db) == true {
                    doesExist = true
                } else {
                    doesExist = false
                }
            })
        } catch {
            print(error)
        }
        
        return doesExist
    }
    
    internal func isOneActiveUser() -> Bool {
        var users: [UserModelProtocol] = []
        
        do {
            try ActiveUserDatabase.sharedPool.dbwriter.read({ db in
                users = try User.fetchAll(db)
            })
        } catch {
            print(error)
        }
        if users.count > 1 {
            return false
        } else {
            return true
        }
    }
    
}
