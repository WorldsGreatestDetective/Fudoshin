//
//  StringExt.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/7/22.
//

import Foundation
import CryptoKit

extension String {
    func stringToBeltLevel(beltString: String) -> BeltLevel? {
        let beltLevels = ["White Belt", "Blue Belt", "Purple Belt", "Brown Belt", "Black Belt"]
        
        switch beltString {
        case beltLevels[0]:
            return .white
        case beltLevels[1]:
            return .blue
        case beltLevels[2]:
            return .purple
        case beltLevels[3]:
            return .brown
        case beltLevels[4]:
            return .black
        default:
            return nil
        }
    }
    
    func SHA384(string: String) -> String {
        let digest = CryptoKit.SHA384.hash(data: string.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }

}
