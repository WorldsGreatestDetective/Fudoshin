//
//  SettingsServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 8/5/22.
//

import Foundation

class SettingsServiceModel: SettingsServiceModelProtocol {
    var id: String
    var appDatabase: AppDatabaseProtocol
    
    init(appDatabase: AppDatabaseProtocol, id: String) {
        self.appDatabase = appDatabase
        self.id = id
    }
    
    func removeUserData() {
        deleteVisitsByUser()
        deleteUser()
    }
    
    func deleteUser() {
        do {
            try appDatabase.dbwriter.write({ db in
                try User.deleteOne(db, key: id)
            })
        } catch {
            print(error)
        }
    }
    
    func deleteVisitsByUser() {
        do {
            try appDatabase.dbwriter.write({ db in
                let fetchVisitsSQL = "DELETE FROM Visit where userid = ?"
                let fetchVisitsStmt = try db.makeStatement(sql: fetchVisitsSQL)
                fetchVisitsStmt.arguments = ["\(id)"]
                
                try fetchVisitsStmt.execute(arguments: fetchVisitsStmt.arguments)
            })
        } catch {
            print(error)
        }
    }
    
}
