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
    var giVisits: [VisitModelProtocol] {get set}
    var noGiVisits: [VisitModelProtocol] {get set}
    
    var email: String {get set}
    var password: String {get set}
    
    var id: String {get set}
    var firstName: String {get set}
    var lastName: String {get set}
    var beltLevel: BeltLevel {get set}
    
    func getCountByWeek() -> Int?
    func getCountByWeekGi() -> Int?
    func getCountByWeekNoGi() -> Int?
    
    func getCountByMonth() -> Int?
    func getCountByMonthGi() -> Int?
    func getCountByMonthNoGi() -> Int?
    
    func getCountByYear() -> Int?
    func getCountByYearGi() -> Int?
    func getCountByYearNoGi() -> Int?
    
    func getCountByTotal() -> Int?
    func getCountByTotalGi() -> Int?
    func getCountByTotalNoGi() -> Int?
    
    func getWeeksByVisits() -> [Int]?
    func getWeeksByVisitsGi() -> [Int]?
    func getWeeksByVisitsNoGi() -> [Int]?
    
    func getMonthsByVisits() -> [Int]?
    func getMonthsByVisitsGi() -> [Int]?
    func getMonthsByVisitsNoGi() -> [Int]?
    
    func getYearsByVisits() -> [Int]?
    func getYearsByVisitsGi() -> [Int]?
    func getYearsByVisitsNoGi() -> [Int]?
    
    func getVisits() -> [VisitModelProtocol]
    func setVisits(visits: [VisitModelProtocol])
    
    func getUser() -> UserModelProtocol
    
    func insertNewVisit(id: String, visitDate: DateString, sessionType: SessionType, userid: String)
    func setAllVisits()
    func saveNewVisit(id: String, visitDate: DateString, sessionType: SessionType, userid: String)
    func fetchVisitsByUser() -> [VisitModelProtocol]?
    
    func keepUserLoggedIn()
    
    func insertActiveUser()
    func checkForActiveUser() -> Bool
    func isOneActiveUser() -> Bool
}
