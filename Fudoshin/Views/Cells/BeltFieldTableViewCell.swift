//
//  BeltFieldTableViewCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/2/22.
//

import UIKit

class BeltFieldTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let beltLevelsArray: [String] = ["White Belt", "Blue Belt", "Purple Belt", "Brown Belt", "Black Belt"]
    
    private let beltLevelField: UITextField = {
        let textField = UITextField()
     
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
        let barButton = UIBarButtonItem(title: "Done", style: .done, target: BeltFieldTableViewCell.self, action: #selector(doneBeltBarButtonTapped))
        
        return barButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit() {
        addSubview(beltLevelField)
        
        beltPicker.dataSource = self
        beltPicker.delegate = self
        
        beltLevelField.inputView = beltPicker
        beltLevelField.inputAccessoryView = beltToolbar
        
        beltToolbar.items = [doneBeltBarButton]
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
        beltLevelField.text = beltLevelsArray[row]
    }
    
    @objc private func doneBeltBarButtonTapped() {
        endEditing(false)
    }

}
