//
//  AddVisitServiceModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/26/22.
//

import Foundation

protocol AddVisitServiceModelProtocol {
    var visit: VisitModelProtocol? {get set}
    var appDatabase: AppDatabaseProtocol {get set}
    var userid: String {get set}
    var sessionType: SessionType? {get set}
    
    func insertNewVisit()
    func setVisit(sessionType: SessionType)
    func setSessionType(sessionType: SessionType)
}
