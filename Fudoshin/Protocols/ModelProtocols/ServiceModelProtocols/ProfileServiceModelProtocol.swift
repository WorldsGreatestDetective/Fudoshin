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
    
    var newVisit: VisitModelProtocol? {get set}
    var visits: [VisitModelProtocol] {get set}
    
    var email: String {get set}
    var password: String {get set}
    
    var id: String {get set}
    var firstName: String {get set}
    var lastName: String {get set}
    var beltLevel: BeltLevel {get set}
    
    func getCountByWeek() -> [Int]
    func getCountByMonth() -> [Int]
    func getCountByYear() -> [Int]
    func getCountByTotal() -> [Int]
    
    func insertNewVisit()
    func setNewVisit(visit: VisitModelProtocol)
}

// init profile sm with user property parameters, set user with params, fetch and set visits by user id as tested
//
