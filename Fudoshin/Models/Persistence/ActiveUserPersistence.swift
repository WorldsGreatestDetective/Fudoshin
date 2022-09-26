//
//  ActiveUserPersistence.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/23/22.
//

import Foundation
import GRDB

extension ActiveUserDatabase {
    static let sharedPool = makeSharedPool()
    static let sharedQueue = makeSharedQueue()
    
    static func makeSharedPool() -> AppDatabase {
        do {
            let fileManager = FileManager()
            
            let folderURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("activeUserDatabase", isDirectory: true)
            
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            
            let dbURL = folderURL.appendingPathComponent("activeUserdb.sqlite")
            
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
            
            let folderURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("activeUserDatabase", isDirectory: true)
            
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            
            let dbURL = folderURL.appendingPathComponent("activeUserdb.sqlite")
            
            //var configuration: Configuration()
            
            let dbQueue = try DatabaseQueue(path: dbURL.path)
            
            let database = try AppDatabase(dbwriter: dbQueue)
            
            return database
        } catch {
            fatalError("\(error)")
        }
    }
}
