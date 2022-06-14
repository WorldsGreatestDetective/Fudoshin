//
//  BeltLevel.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/13/22.
//

import Foundation
import GRDB

enum BeltLevel: Int {
    case white = 0
    case blue = 1
    case purple = 2
    case brown = 3
    case black = 4
}

extension BeltLevel: DatabaseValueConvertible {}
