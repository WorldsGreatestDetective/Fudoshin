//
//  KeychainError.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/20/22.
//

import Foundation

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}
