//
//  User.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/13/22.
//

import Foundation
import GRDB

struct User: UserModelProtocol {
    let id: String = {
        let identifier: String = UUID().uuidString
        return identifier
    }()
    
    var firstName: String
    var lastName: String
    
    var email: String
    var password: String
    
    var beltLevel: BeltLevel
}

extension User: Equatable {}
extension User: Codable {}
extension User: PersistableRecord {}
extension User: FetchableRecord {}
