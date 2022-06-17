//
//  VisitModelProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/15/22.
//

import Foundation
import GRDB

protocol VisitModelProtocol: Equatable, Codable, PersistableRecord, FetchableRecord {
    var id: String {get}
    var userid: String {get} // TODO: Create Userid typealias
    var visitDate: Date {get}
}
