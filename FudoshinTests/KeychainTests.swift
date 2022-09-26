//
//  KeychainTests.swift
//  FudoshinTests
//
//  Created by Nathan Reilly on 9/22/22.
//

import XCTest

final class KeychainTests: XCTestCase {
    /*
    func testKeychainGeneric() throws {
        
        // MARK: insert
        
        let email = "email"
        let password = "password"
        let service = "some service"
        
        let insertQuery: [String : Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : email,
            kSecAttrService as String : service,
            kSecAttrGeneric as String : password
        ]
        
        let insertStatus = SecItemAdd(insertQuery as CFDictionary, nil)
        guard insertStatus == errSecSuccess else {throw KeychainError.unhandledError(status: insertStatus)}
        
        // MARK: fetch
        
        let fetchService = "some service"
        
        let fetchQuery: [String : Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrService as String : fetchService,
            kSecReturnAttributes as String : true
        ]
        
        var item: CFTypeRef?
        let fetchStatus = SecItemCopyMatching(fetchQuery as CFDictionary, nil)
        
        guard fetchStatus != errSecItemNotFound else {throw KeychainError.noPassword}
        guard fetchStatus == errSecSuccess else {throw KeychainError.unhandledError(status: fetchStatus)}
        
        guard let existingItem = item as? [String : Any],
              let fetchedPassword = existingItem[kSecAttrGeneric as String] as? String,
              let fetchedEmail = existingItem[kSecAttrAccount as String] as? String
        else {
            throw KeychainError.noPassword
        }
        
        XCTAssertEqual(password, fetchedPassword)
    }

    func testKeychainInternet() throws {
        let email = "email"
        let password = "password"
        let passwordData = password.data(using: String.Encoding.utf8)!
        let server = "some server"
        
        let insertQuery: [String : Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: email,
            kSecValueData as String: passwordData,
            kSecAttrServer as String: server
        ]
        
        let status = SecItemAdd(insertQuery as CFDictionary, nil)
        guard status == errSecSuccess else {throw KeychainError.unhandledError(status: status)}
        
        let fetchServer = "some server"
        
        let query: [String : Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrServer as String: fetchServer,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        let fetchStatus = SecItemCopyMatching(query as CFDictionary, &item)
        
        do {
            guard fetchStatus != errSecItemNotFound else {throw KeychainError.noPassword}
            guard fetchStatus == errSecSuccess else {throw KeychainError.unhandledError(status: fetchStatus)}
            
            guard let existingItem = item as? [String : Any],
                  let fetchedPasswordData = existingItem[kSecValueData as String] as? Data,
                  let fetchedPassword = String(data: fetchedPasswordData, encoding: String.Encoding.utf8),
                  let fetchedEmail = existingItem[kSecAttrAccount as String] as? String
            else {
                throw KeychainError.unexpectedPasswordData
            }
            
            XCTAssertEqual(password, fetchedPassword)
        }
    }*/
}
