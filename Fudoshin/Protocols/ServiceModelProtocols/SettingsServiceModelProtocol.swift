//
//  SettingsServiceModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 8/5/22.
//

import Foundation

protocol SettingsServiceModelProtocol {
    var id: String {get set}
    var user: UserModelProtocol {get set}
    var appDatabase: AppDatabaseProtocol {get set}
    
    var beltLevel: BeltLevel {get set}
    
    var newBeltLevel: BeltLevel? {get set}
    var newEmail: String? {get set}
    
    var password: String? {get set}
    var confirmPassword: String? {get set}
    
    func removeUserData()
    func deleteUser()
    func deleteVisitsByUser()

    func setPassword(password: String)
    func setConfirmPassword(confirmPassword: String)
    func setNewBeltLevel(beltLevel: BeltLevel)
    func setNewEmail(email: String)
    
    func isPasswordConfirmed() -> Bool?
    
    func updateBeltLevel()
    func updateEmail()
    func updatePassword()
    
    func getBeltLevel() -> BeltLevel
    
    func keepUserLoggedOut()
    func deleteActiveUser()
    
    func hashUserPassword() 
}
