//
//  MonthlyVisitsProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 11/9/22.
//

import Foundation

protocol MonthlyVisitsProtocol {
    var visits: [VisitModelProtocol] {get}
    var monthofYear: Int {get}
    var yearsByVisits: [Int]? {get set}
    var visitsByYear: [VisitModelProtocol]? {get set}
    
    func appendYearsByVisits()
    func filterVisitsByYear(by year: Int) -> [VisitModelProtocol]
}
