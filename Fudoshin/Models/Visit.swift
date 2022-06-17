//
//  Visit.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import Foundation
import GRDB

struct Visit: VisitModelProtocol {
    let id: String 
    let userid: String
    
    let visitDate: Date
    
    init(userid: String) {
        self.id = Visit.setid()
        self.visitDate = Date()
        
        self.userid = userid
    }
    
    static func setid() -> String {
        let identifier: String = UUID().uuidString
        
        return identifier
    }
}

extension Visit: Codable {}

extension Visit: PersistableRecord {}

extension Visit: FetchableRecord {}
