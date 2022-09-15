//
//  EmailFieldTableViewCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/3/22.
//

import UIKit

class EmailFieldTableViewCell: UITableViewCell {
    
    private let textField: UITextField = {
        let textField = TextFieldForCell()
        
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textAlignment = .left
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        /*
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),  NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]
        let attributedText = NSAttributedString(string: "Email", attributes: attributes)
        textField.attributedPlaceholder = attributedText
         */
        
        textField.placeholder = "New email"
         
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        contentView.addSubview(textField)
        textField.frame = bounds
    }
    
    func clearTextField() {
        textField.text = ""
    }
    
    func getEmail() -> String? {
        guard let email = textField.text else {return nil}
        return email
    }
    
    func setTextFieldDelegate(delegate: EmailSettingsViewController) {
        textField.delegate = delegate
    }
    
    func getTextField() -> UITextField {
        return textField
    }

}
