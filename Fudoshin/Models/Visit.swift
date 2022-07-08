//
//  Visit.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import Foundation
import GRDB

struct Visit: VisitModelProtocol {
    var id: String
    var userid: String
    var sessionType: SessionType
    
    var visitDate: DateString
    
    static func setid() -> String {
        let identifier: String = UUID().uuidString
        
        return identifier
    }
}

extension Visit: Codable {}
extension Visit: PersistableRecord {}
extension Visit: FetchableRecord {}
