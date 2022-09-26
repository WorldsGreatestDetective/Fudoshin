//
//  KeychainErrorTests.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 9/22/22.
//

import Foundation

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}
