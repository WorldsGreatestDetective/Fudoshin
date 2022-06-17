//
//  RegisterView.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import UIKit

class RegisterView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // MARK: - Properties
    
    private var delegate: RegisterViewDelegateProtocol?

    private let beltLevelsArray: [String] = ["White Belt", "Blue Belt", "Purple Belt", "Brown Belt", "Black Belt", "Coral Belt"]
    
    private let promptLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter Your Information Below"
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = label.frame.width
        label.textAlignment = .center
        
        return label
    }()
    
    private let firstNameField: UITextField = {
        let textField = UITextField()
    
        textField.placeholder = "first name"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textAlignment = .left
    
        return textField
    }()
    
    private let lastNameField: UITextField = {
        let textField = UITextField()
    
        textField.placeholder = "last name"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textAlignment = .left
    
        return textField
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
    
        textField.placeholder = "email"
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
    
        return textField
    }()


    private let passwordField: UITextField = {
        let textField = UITextField()
    
        textField.placeholder = "password"
        textField.textContentType = .newPassword
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textAlignment = .left
    
        return textField
    }()
    
    private let confirmPasswordField: UITextField = {
        let textField = UITextField()
     
        textField.placeholder = "confirm password"
        textField.textContentType = .newPassword
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
     
        return textField
     }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm & Register", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let beltLevelField: UITextField = {
        let textField = UITextField()
     
        textField.placeholder = "belt level"
        textField.borderStyle = .roundedRect
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
        let barButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBeltBarButtonTapped))
        
        return barButton
    }()
    
    private let stackView = UIStackView()
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    private func commonInit() {
        let textFieldArray = [firstNameField, lastNameField, emailField]
        
        for textField in textFieldArray {
            textField.delegate = self
        }
        
        self.beltPicker.delegate = self
        self.beltPicker.dataSource = self
        
        self.beltLevelField.inputView = beltPicker
        self.beltLevelField.inputAccessoryView = beltToolbar
        
        let views: [UIView] = [firstNameField, lastNameField, emailField, passwordField, confirmPasswordField, beltLevelField]
        
        addSubview(promptLabel)
        addSubview(stackView)
        addSubview(registerButton)
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 17
        
        for view in views {
            stackView.addArrangedSubview(view)
        }
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        activateConstraints()
    }
    
    // MARK: - Constraints
    
    private func activateConstraints() {
        let constraintsArray: [NSLayoutConstraint] = [promptLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), promptLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30), promptLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 70), stackView.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 40), stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), stackView.widthAnchor.constraint(equalToConstant: 300), registerButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30)]
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    // MARK: - Getter and Setter Methods
    
    func setDelegate(delegate: RegisterViewDelegateProtocol) {
        self.delegate = delegate
    }
    
    func getFirstName() -> String? {
        if let firstName = firstNameField.text {
            return firstName
        } else {
            return nil
        }
    }
    
    func getLastName() -> String? {
        if let lastName = lastNameField.text {
            return lastName
        } else {
            return nil
        }
    }
    
    func getEmail() -> String? {
        if let email = emailField.text {
            return email
        } else {
            return nil
        }
    }
    
    func getPassword() -> String? {
        if let password = passwordField.text {
            return password
        } else {
            return nil
        }
    }
    
    func getConfirmPassword() -> String? {
        if let confirmPassword = confirmPasswordField.text {
            return confirmPassword
        } else {
            return nil
        }
    }
    
    func getBeltLevel() -> String? {
        if let beltLevel = beltLevelField.text {
            return beltLevel
        } else {
            return nil
        }
    }
    
    // MARK: - Button Target Methods
    
    @objc private func doneBeltBarButtonTapped() {
        beltPicker.delegate?.pickerView?(beltPicker, didSelectRow: 0, inComponent: 0)
        endEditing(false)
    }
    
    @objc private func registerButtonTapped() {
        
    }
    
    // MARK: - Picker View Delegate Methods
    
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return beltLevelsArray[row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        beltLevelField.text = beltLevelsArray[row]
    }

}