//
//  User.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/13/22.
//

import Foundation

struct User {
    let id: String = setid()
    
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    
    var beltLevel: BeltLevel
    var visitLog: [Visit]
    
    static func setid() -> String {
        let identifier: String = UUID().uuidString
        
        return identifier
    }
}
