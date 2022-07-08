//
//  MockDatabase.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 6/16/22.
//

import Foundation
import GRDB
@testable import Fudoshin

class MockDatabase: AppDatabaseProtocol {
    let dbwriter: DatabaseWriter
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        migrator.eraseDatabaseOnSchemaChange = true //uncomment when implementing future changes to data models and having to create new schema as a result
        
        migrator.registerMigration("schemaChange0") { db in
            try db.create(table: "MockUser", body: { t in
                t.column("id", .text).primaryKey().notNull(onConflict: nil)
                t.column("firstName", .text).notNull(onConflict: nil)
                t.column("lastName", .text).notNull(onConflict: nil)
                t.column("email", .text).notNull(onConflict: nil)
                t.column("password", .text).notNull(onConflict: nil)
                t.column("beltLevel", .integer).notNull(onConflict: nil)
            })
            try db.create(table: "MockVisit", body: { t in
                t.column("id", .text).primaryKey().notNull(onConflict: nil)
                t.column("userid", .text).references("MockUser").notNull(onConflict: nil)
                t.column("visitDate", .text).notNull(onConflict: nil)
                t.column("sessionType", .integer).notNull(onConflict: nil)
            })
        }
        return migrator
    }
    
    init(dbwriter: DatabaseWriter) throws {
        self.dbwriter = dbwriter
        try migrator.migrate(dbwriter)
    }
}
