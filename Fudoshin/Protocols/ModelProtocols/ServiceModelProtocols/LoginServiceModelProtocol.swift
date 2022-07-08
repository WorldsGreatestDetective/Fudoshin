//
//  LoginServiceModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/23/22.
//

import Foundation

protocol LoginServiceModelProtocol {
    var user: UserModelProtocol {get set}
    var appDatabase: AppDatabaseProtocol {get set}
    
    
}
