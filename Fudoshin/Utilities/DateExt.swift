//
//  DateExt.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/20/22.
//

import Foundation

extension Date {
    static func setDateStringFromNow() -> DateString {
        let now = Date()
        let formatter = DateFormatter()
        
        let dateString = formatter.string(from: now)
        
        return dateString
    }
    
    static let currentWeekOfMonth: Int? = {
        let now = Date()
        
        let weekComponent = Calendar.current.dateComponents([.weekOfMonth], from: now)
        let week = weekComponent.weekOfMonth
        
        return week
    }()
    
    static let currentMonth: Int? = {
        let now = Date()
        
        let monthComponent = Calendar.current.dateComponents([.month], from: now)
        let month = monthComponent.month
        
        return month
    }()
    
    static let currentYear: Int? = {
        let now = Date()
        
        let yearComponent = Calendar.current.dateComponents([.year], from: now)
        let year = yearComponent.year
        
        return year
    }()
    
}

// Perhaps format dateString to be ready for being filtered in profile sm
