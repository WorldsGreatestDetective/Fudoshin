//
//  MonthlyVisitsServiceModel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 11/9/22.
//

import Foundation

class MonthlyVisitsServiceModel: MonthlyVisitsProtocol {
    internal var visits: [VisitModelProtocol]
    var monthofYear: Int
    var yearsByVisits: [Int]?
    var visitsByYear: [VisitModelProtocol]?
    
    init(visits: [VisitModelProtocol], monthofYear: Int) {
        self.visits = visits
        self.monthofYear = monthofYear
    }
    
    func filterVisitsByYear(by year: Int) -> [VisitModelProtocol] {
        //
        return visits
    }
    
    func appendYearsByVisits() {
        yearsByVisits = getYearsByVisitsFiltered()
    }
    
    func getYearsByVisitsFiltered() -> [Int]? {
        var years: [Int] = []
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        for visit in visits {
            let dateString = visit.visitDate
            guard let dateOfVisit = formatter.date(from: dateString) else {return nil}
            
            let yearComponent = Calendar.current.dateComponents([.year], from: dateOfVisit)
            guard let year = yearComponent.year else {return nil}
            
            if years.contains(year) == false {
                years.append(year)
            }
        }
        
        return years
    }
    
}
