//
//  LoginServiceModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/23/22.
//

import Foundation

protocol LoginServiceModelProtocol {
    var user: UserModelProtocol? {get set}
    var appDatabase: AppDatabaseProtocol {get set}
    
    var email: String {get set}
    var password: String {get set}
    
    var id: String? {get set}
    var firstName: String? {get set}
    var lastName: String? {get set}
    var beltLevel: BeltLevel? {get set}
    
    func fetchUserByLogin() -> ErrorType?
    func filterUsersByEmail(users: [UserModelProtocol]) -> [UserModelProtocol]?
    func filterUsersByPassword(users: [UserModelProtocol]) -> [UserModelProtocol]?
    
    func setid(id: String)
    func setFirstName(firstName: String)
    func setLastName(lastName: String)
    func setBeltlevel(beltLevel: BeltLevel)
    func setEmail(email: String)
    func setPassword(password: String)
}
