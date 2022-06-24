//
//  MockVisit.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/16/22.
//

import Foundation
import GRDB
@testable import Fudoshin

struct MockVisit: VisitModelProtocol, Equatable {
    var id: String
    var visitDate: DateString
    var userid: String
}
