//
//  AppDatabaseProtocol.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/23/22.
//

import Foundation
import GRDB

protocol AppDatabaseProtocol {
    var dbwriter: DatabaseWriter {get}
    var migrator: DatabaseMigrator {get}
}
