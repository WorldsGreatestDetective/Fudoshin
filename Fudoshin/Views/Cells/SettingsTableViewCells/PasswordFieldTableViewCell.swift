//
//  PasswordFieldTableViewCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/6/22.
//

import UIKit

class PasswordFieldTableViewCell: UITableViewCell {

    private let textField: UITextField = {
        let textField = TextFieldForCell()
        
        textField.textContentType = .newPassword
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textAlignment = .left
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        /*
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),  NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]
        let attributedText = NSAttributedString(string: "Email", attributes: attributes)
        textField.attributedPlaceholder = attributedText
         */
        
        textField.placeholder = "New password"
         
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

    func getPassword() -> String? {
        guard let password = textField.text else {return nil}
        return password
    }
    
    func getTextField() -> UITextField {
        return textField
    }
    
    func setTextFieldDelegate(delegate: PasswordSettingsViewController) {
        textField.delegate = delegate
    }
}
