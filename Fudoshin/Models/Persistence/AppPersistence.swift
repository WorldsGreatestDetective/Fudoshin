//
//  AppPersistence.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/13/22.
//

import Foundation
import GRDB

extension AppDatabase {
    
    static let sharedPool = makeSharedPool()
    static let sharedQueue = makeSharedQueue()
    
    static func makeSharedPool() -> AppDatabase {
        do {
            let fileManager = FileManager()
            
            let folderURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("database", isDirectory: true)
            
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            
            let dbURL = folderURL.appendingPathComponent("db.sqlite")
            
            //var config = Configuration()
            
            let dbPool = try DatabasePool(path: dbURL.path)
            
            let database = try AppDatabase(dbwriter: dbPool)
            
            return database
        } catch {
            fatalError("\(error)")
        }
    }
    
    static func makeSharedQueue() -> AppDatabase {
        do {
            let fileManager = FileManager()
            
            let folderURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("database", isDirectory: true)
            
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            
            let dbURL = folderURL.appendingPathComponent("db.sqlite")
            let dbQueue = try DatabaseQueue(path: dbURL.path)
            
            let database = try AppDatabase(dbwriter: dbQueue)
            
            return database
        } catch {
            fatalError("\(error)")
        }
    }
}
