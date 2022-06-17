//
//  UserModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/15/22.
//

import Foundation
import GRDB

protocol UserModelProtocol: Equatable, Codable, FetchableRecord, PersistableRecord {
    var id: String {get}
    var firstName: String {get set}
    var lastName: String {get set}
    var email: String {get set}
    var password: String {get set}
    var beltLevel: BeltLevel {get set}
}
