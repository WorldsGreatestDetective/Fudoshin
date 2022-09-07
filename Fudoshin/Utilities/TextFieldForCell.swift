//
//  TextFieldForCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/5/22.
//

import UIKit

class TextFieldForCell: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 40)
    }
}
