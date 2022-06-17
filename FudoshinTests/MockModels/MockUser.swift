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
    let id: String
    
    var firstName: String
    var lastName: String
    
    var email: String
    var password: String
    
    var beltLevel: BeltLevel
    
    init() {
        self.id = {
            let identifier: String = UUID().uuidString
            return identifier
        }()
        
        self.firstName = "john"
        self.lastName = "deo"
        
        self.email = "email"
        self.password = "password"
        self.beltLevel = .white
    }
}
