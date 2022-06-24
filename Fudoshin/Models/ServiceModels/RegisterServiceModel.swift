//
//  RegisterServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import Foundation

class RegisterServiceModel {
    internal let user: User
    internal let appDatabase: AppDatabase
    
    init(db: AppDatabase, userModel: UserModelProtocol) {
        appDatabase = db
        user = userModel as! User // TODO: Check SO or reddit to see if force-unwrap is ok here
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
