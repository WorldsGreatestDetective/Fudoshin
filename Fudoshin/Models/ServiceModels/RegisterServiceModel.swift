//
//  RegisterServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import Foundation

class RegisterServiceModel: RegisterServiceModelProtocol {
    internal var user: UserModelProtocol
    internal var appDatabase: AppDatabaseProtocol
    
    init(appDatabase: AppDatabaseProtocol, userModel: UserModelProtocol) {
        self.appDatabase = appDatabase
        user = userModel 
    }
    
    func insertNewUser() {
        hashUserPassword()
        
        do {
            try appDatabase.dbwriter.write({ db in
                try user.insert(db)
            })
        } catch {
            print(error)
        }
    }
    
    func hashUserPassword() {
        user.password = user.password.SHA384(string: user.password)
    }
    
}
