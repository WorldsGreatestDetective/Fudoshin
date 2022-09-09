//
//  UIColorExt.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/7/22.
//

import Foundation
import UIKit

extension UIColor {
    static func beltLevelToColor(beltLevel: BeltLevel) -> UIColor {
        switch beltLevel {
        case .white:
            return white
        case .blue:
            return systemBlue
        case .purple:
            return systemPurple
        case .brown:
            return systemBrown
        case .black:
            return systemRed
        default:
            return white
        }
    }
}
