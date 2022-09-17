//
//  RegisterServiceModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/23/22.
//

import Foundation

protocol RegisterServiceModelProtocol {
    var user: UserModelProtocol {get set}
    var appDatabase: AppDatabaseProtocol {get set}
    func insertNewUser()
    func hashUserPassword() 
}
