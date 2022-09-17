//
//  MockRegisterServiceModel.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/23/22.
//

import Foundation
import GRDB
@testable import Fudoshin

class MockRegisterServiceModel: RegisterServiceModelProtocol {
    func hashUserPassword() {
        //
    }
    
    var user: UserModelProtocol = MockUser()
    var appDatabase: AppDatabaseProtocol
    
    init(database: AppDatabaseProtocol) {
        self.appDatabase = database
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
