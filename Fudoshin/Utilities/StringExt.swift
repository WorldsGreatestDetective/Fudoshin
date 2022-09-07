//
//  StringExt.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/7/22.
//

import Foundation

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
}
