//
//  MockUser.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/16/22.
//

import Foundation
import GRDB
@testable import Fudoshin

struct MockUser: UserModelProtocol, Equatable, Codable, PersistableRecord, FetchableRecord {
    var id: String = User.setid()
    
    var firstName: String = "Joe"
    var lastName: String = "shmoe"
    
    var email: String = "email"
    var password: String = "password"
    
    var beltLevel: BeltLevel = .white
}
