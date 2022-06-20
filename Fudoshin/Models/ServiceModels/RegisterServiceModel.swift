//
//  RegisterServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import Foundation

class RegisterServiceModel {
    internal let user: User

    init(id: String, firstName: String, lastName: String, email: String, password: String, beltLevel: BeltLevel) {
        self.user = User(id: id, firstName: firstName, lastName: lastName, email: email, password: password, beltLevel: beltLevel)
    }
    
    // persistence methods here
    
}
