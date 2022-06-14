//
//  Visit.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import Foundation

struct Visit {
    let id: String = Visit.setid()
    let userid: String
    
    let visitDate: Date
    
    static func setid() -> String {
        let identifier: String = UUID().uuidString
        
        return identifier
    }
}
