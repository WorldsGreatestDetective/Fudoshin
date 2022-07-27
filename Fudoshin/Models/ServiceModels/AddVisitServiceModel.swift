//
//  AddVisitServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/27/22.
//

import Foundation

class AddVisitServiceModel: AddVisitServiceModelProtocol {
    internal var visit: VisitModelProtocol?
    internal var appDatabase: AppDatabaseProtocol
    
    internal var userid: String
    internal var sessionType: SessionType?
    
    init(appDatabase: AppDatabaseProtocol, userid: String) {
        self.appDatabase = appDatabase
        self.userid = userid
    }
    
    func insertNewVisit() { // TODO: Add ErrorType? return
        guard let visit = visit else {return}

        do {
            try appDatabase.dbwriter.write({ db in
                try visit.insert(db)
            })
        } catch {
            print(error)
        }
    }
    
    func setVisit(sessionType: SessionType) {
        setSessionType(sessionType: sessionType)
        visit = Visit(id: Visit.setid(), userid: userid, sessionType: sessionType, visitDate: Date.setDateStringFromNow())
    }
    
    internal func setSessionType(sessionType: SessionType) {
        self.sessionType = sessionType
    }
    
}
