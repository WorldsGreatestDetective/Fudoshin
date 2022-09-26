//
//  ActiveUserDatabase.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/23/22.
//

import Foundation
import GRDB

class ActiveUserDatabase: AppDatabaseProtocol {
    let dbwriter: DatabaseWriter
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        migrator.eraseDatabaseOnSchemaChange = false //uncomment when implementing future changes to data models and having to create new schema as a result
        
        migrator.registerMigration("schemaChange0") { db in
            try db.create(table: "User", body: { t in
                t.column("id", .text).primaryKey().notNull(onConflict: nil)
                t.column("firstName", .text).notNull(onConflict: nil)
                t.column("lastName", .text).notNull(onConflict: nil)
                t.column("email", .text).notNull(onConflict: nil)
                t.column("password", .text).notNull(onConflict: nil)
                t.column("beltLevel", .integer).notNull(onConflict: nil)
            })
        }
        return migrator
    }
    
    init(dbwriter: DatabaseWriter) throws {
        self.dbwriter = dbwriter
        try migrator.migrate(dbwriter)
    }
}
