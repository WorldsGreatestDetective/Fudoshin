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
    var beltLevel: BeltLevel
    
    init(appDatabase: AppDatabaseProtocol, id: String, beltLevel: BeltLevel) {
        self.appDatabase = appDatabase
        self.id = id
        self.beltLevel = beltLevel
    }
    
    var password: String?
    var confirmPassword: String?
    
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
    
    func setPassword(password: String) {
        self.password = password
    }
    
    func setConfirmPassword(confirmPassword: String) {
        self.confirmPassword = confirmPassword
    }
    
    func isPasswordConfirmed() -> Bool? {
        guard let password = password else {return nil}
        guard let confirmPassword = confirmPassword else {return nil}

        if password == confirmPassword {
            return true
        } else {
            return false
        }
    }
    
}
