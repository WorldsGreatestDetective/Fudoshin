//
//  VisitModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/15/22.
//

import Foundation
import GRDB

protocol VisitModelProtocol: Codable, PersistableRecord, FetchableRecord { // TODO: - Change protocol properties to get only 
    var id: String {get set}
    var userid: String {get set} // TODO: Create Userid typealias?
    var sessionType: SessionType {get set}
    var visitDate: DateString {get set}
}

typealias DateString = String
