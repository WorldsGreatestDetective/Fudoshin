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
    
    func removeUserData()
    func deleteUser()
    func deleteVisitsByUser()
}
