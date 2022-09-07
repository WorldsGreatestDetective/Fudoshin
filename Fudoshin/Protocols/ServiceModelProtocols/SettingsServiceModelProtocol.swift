//
//  SettingsServiceModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 8/5/22.
//

import Foundation

protocol SettingsServiceModelProtocol {
    var id: String {get set}
    var appDatabase: AppDatabaseProtocol {get set}
    
    var beltLevel: BeltLevel {get set}
    
    var password: String? {get set}
    var confirmPassword: String? {get set}
    
    func removeUserData()
    func deleteUser()
    func deleteVisitsByUser()
    
    func setPassword(password: String)
    func setConfirmPassword(confirmPassword: String)
    func isPasswordConfirmed() -> Bool?
}
