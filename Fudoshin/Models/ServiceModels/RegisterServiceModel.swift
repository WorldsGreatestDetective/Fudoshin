//
//  RegisterServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import Foundation

class RegisterServiceModel {
    internal let user: UserModelProtocol
    internal let appDatabase: AppDatabaseProtocol
    
    init(appDatabase: AppDatabaseProtocol, userModel: UserModelProtocol) {
        self.appDatabase = appDatabase
        user = userModel // TODO: Check SO or reddit to see if force-unwrap is ok here
    }
    
    func insertNewUser() {
        do {
            try appDatabase.dbwriter.write({ db in
                try user.insert(db)
            })
        } catch {
            print(error)
        }
    }
    
}
