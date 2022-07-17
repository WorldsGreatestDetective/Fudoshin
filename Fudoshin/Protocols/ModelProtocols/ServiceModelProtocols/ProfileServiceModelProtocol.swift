//
//  ProfileServiceModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/19/22.
//

import Foundation

protocol ProfileServiceModelProtocol {
    var user: UserModelProtocol {get set}
    var appDatabase: AppDatabaseProtocol {get set}
    
    var email: String {get set}
    var password: String {get set}
    
    var id: String? {get set}
    var firstName: String? {get set}
    var lastName: String? {get set}
    var beltLevel: BeltLevel? {get set}
}
