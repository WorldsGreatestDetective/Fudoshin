//
//  User.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/13/22.
//

import Foundation
import GRDB

struct User: UserModelProtocol {
    var id: String 
    
    var firstName: String
    var lastName: String
    
    var email: String
    var password: String
    
    var beltLevel: BeltLevel
    
    static func setid() -> String{
        let identifier: String = UUID().uuidString
        
        return identifier
    }
}

extension User: Equatable {}
extension User: Codable {}
extension User: PersistableRecord {}
extension User: FetchableRecord {}
