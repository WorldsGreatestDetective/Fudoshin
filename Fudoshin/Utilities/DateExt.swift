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
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        let dateString = formatter.string(from: now)
        
        return dateString
    }
    
    static let formatterFull: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        
        return formatter
    }()
    
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
    
    static func monthIntToMonthString(monthInt: Int) -> String {
        switch monthInt {
        case 1:
            return "January"
        case 2:
            return "February"
        case 3:
            return "March"
        case 4:
            return "April"
        case 5:
            return "May"
        case 6:
            return "June"
        case 7:
            return "July"
        case 8:
            return "August"
        case 9:
            return "September"
        case 10:
            return "October"
        case 11:
            return "November"
        case 12:
            return "December"
        default:
            return ""
        }
    }
    
}

// Perhaps format dateString to be ready for being filtered in profile sm
