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
}

// Perhaps format dateString to be ready for being filtered in profile sm
