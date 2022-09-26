//
//  SettingsServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 8/5/22.
//

import Foundation

class SettingsServiceModel: SettingsServiceModelProtocol {
    
    internal var user: UserModelProtocol
    internal var appDatabase: AppDatabaseProtocol
    var id: String
    var beltLevel: BeltLevel
    
    init(appDatabase: AppDatabaseProtocol, user: UserModelProtocol) {
        self.user = user
        self.appDatabase = appDatabase
        
        id = user.id
        beltLevel = user.beltLevel
    }
    
    var password: String?
    var confirmPassword: String?
    var newBeltLevel: BeltLevel?
    var newEmail: String?
    
    internal func deleteUser() {
        do {
            try appDatabase.dbwriter.write({ db in
                try User.deleteOne(db, key: ["id" : id])
            })
        } catch {
            print(error)
        }
    }
    
    internal func deleteVisitsByUser() {
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
    
    private func updateUser() {
        do {
            try appDatabase.dbwriter.write({ db in
                try user.update(db)
            })
        } catch {
            print(error)
        }
    }
    
    func removeUserData() {
        deleteVisitsByUser()
        deleteUser()
    }
    
    func updateBeltLevel() {
        guard let newBeltLevel = newBeltLevel else {return}
        user.beltLevel = newBeltLevel
        
        updateUser()
    }
    
    func updateEmail() {
        guard let newEmail = newEmail else {return}
        user.email = newEmail
        
        updateUser()
    }
    
    func updatePassword() {
        guard let password = password else {return}
        let hashPassword = password.SHA384(string: password)
        user.password = hashPassword
        
        updateUser()
    }
    
    func setPassword(password: String) {
        self.password = password
    }
    
    func setConfirmPassword(confirmPassword: String) {
        self.confirmPassword = confirmPassword
    }
    
    func setNewEmail(email: String) {
        newEmail = email
    }
    
    func setNewBeltLevel(beltLevel: BeltLevel) {
        newBeltLevel = beltLevel
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
    
    func getBeltLevel() -> BeltLevel {
        return beltLevel
    }
    
    func keepUserLoggedOut() {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        deleteActiveUser()
    }
    
    internal func deleteActiveUser() {
        do {
            try ActiveUserDatabase.sharedPool.dbwriter.write({ db in
                try user.delete(db)
            })
        } catch {
            print(error)
        }
    }
    
    internal func hashUserPassword() {
        // MARK: WARNING! Never re-hash already persisted user passwords
        
        user.password = user.password.SHA384(string: user.password)
    }
}
