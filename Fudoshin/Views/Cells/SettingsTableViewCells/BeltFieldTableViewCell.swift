//
//  BeltFieldTableViewCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/2/22.
//

import UIKit

class BeltFieldTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let beltLevelsArray: [String] = ["White Belt", "Blue Belt", "Purple Belt", "Brown Belt", "Black Belt"]
    
    private let textField: UITextField = {
        let textField = TextFieldForCell()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "New belt level"
        textField.textAlignment = .left
     
        return textField
    }()
    
    private let beltPicker: UIPickerView = {
        let pickerView = UIPickerView()
        
        return pickerView
    }()
    
    private let beltToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        
        toolbar.sizeToFit()
       
        return toolbar
    }()
    
    private let doneBeltBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(doneBeltBarButtonTapped))
        
        barButton.tintColor = .white
        
        return barButton
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
        
        beltPicker.dataSource = self
        beltPicker.delegate = self
        
        textField.inputView = beltPicker
        textField.inputAccessoryView = beltToolbar
        textField.frame = bounds
        
        beltToolbar.items = [doneBeltBarButton]
    }
    
    func getBeltLevel() -> BeltLevel? {
        guard let beltLevel = textField.text else {return nil}
        return beltLevel.stringToBeltLevel(beltString: beltLevel)
    }
    
    func setTextFieldDelegate(delegate: BeltSettingsViewController) {
        textField.delegate = delegate
    }
    
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return beltLevelsArray[row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = beltLevelsArray[row]
    }
    
    @objc private func doneBeltBarButtonTapped(_ sender: UIButton) {
        endEditing(false)
    }

}
