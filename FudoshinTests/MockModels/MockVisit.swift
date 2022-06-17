//
//  MockVisit.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/16/22.
//

import Foundation
import GRDB
@testable import Fudoshin

struct MockVisit: VisitModelProtocol, Equatable, Codable, PersistableRecord, FetchableRecord {
    let id: String
    
    let visitDate: Date
    let userid: String
    
    init(userid: String, visitDate: Date) {
        self.id = {
            let identifier: String = UUID().uuidString
            return identifier
        }()
        
        self.visitDate = visitDate
        self.userid = userid
    }
}
