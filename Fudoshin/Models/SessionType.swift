//
//  SessionType.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/6/22.
//

import Foundation
import GRDB

enum SessionType: Int {
    case gi = 0
    case noGi = 1
}

extension SessionType: DatabaseValueConvertible {}
extension SessionType: Codable {}
