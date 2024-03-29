//
//  RegisterView.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import UIKit

class RegisterView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Properties
    
    private var delegate: RegisterViewDelegateProtocol?
    private let beltLevelsArray: [String] = ["White Belt", "Blue Belt", "Purple Belt", "Brown Belt", "Black Belt"]
    
    private let promptLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter Your Information Below"
        label.font = UIFont(name: "kefa", size: 24)
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
        textField.backgroundColor = .systemGray4
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.setLeftPaddingPoints(15)
    
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]
        let attributedText = NSAttributedString(string: "First name", attributes: attributes)
        textField.attributedPlaceholder = attributedText
    
        return textField
    }()
    
    private let lastNameField: UITextField = {
        let textField = UITextField()
    
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textAlignment = .left
        textField.backgroundColor = .systemGray4
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.setLeftPaddingPoints(15)
    
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]
        let attributedText = NSAttributedString(string: "Last name", attributes: attributes)
        textField.attributedPlaceholder = attributedText
        
        return textField
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textAlignment = .left
        textField.backgroundColor = .systemGray4
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.setLeftPaddingPoints(15)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),  NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]
        let attributedText = NSAttributedString(string: "Email", attributes: attributes)
        textField.attributedPlaceholder = attributedText
    
        return textField
    }()


    private let passwordField: UITextField = {
        let textField = UITextField()
    
        //textField.textContentType = .newPassword
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textAlignment = .left
        textField.backgroundColor = .systemGray4
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.setLeftPaddingPoints(15)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),  NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]
        let attributedText = NSAttributedString(string: "Password", attributes: attributes)
        textField.attributedPlaceholder = attributedText
    
        return textField
    }()
    
    private let confirmPasswordField: UITextField = {
        let textField = UITextField()
     
        //textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.backgroundColor = .systemGray4
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.setLeftPaddingPoints(15)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),  NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]
        let attributedText = NSAttributedString(string: "Confirm password", attributes: attributes)
        textField.attributedPlaceholder = attributedText
     
        return textField
     }()
    
    private let beltLevelField: UITextField = {
        let textField = UITextField()
     
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.backgroundColor = .systemGray4
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.setLeftPaddingPoints(15)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),  NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]
        let attributedText = NSAttributedString(string: "Belt level", attributes: attributes)
        textField.attributedPlaceholder = attributedText
     
        return textField
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemGray3
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)]
        let attributedText = NSAttributedString(string: "Confirm & Register", attributes: attributes)
        let attributedString = AttributedString(attributedText)
        
        var config = UIButton.Configuration.filled()
        
        config.attributedTitle = attributedString
        config.buttonSize = .medium
        
        button.configuration = config
        
        return button
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
        barButton.tintColor = .white
        
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
        backgroundColor = UIColor(white: 0.05, alpha: 1)
        
        beltPicker.delegate = self
        beltPicker.dataSource = self
        beltToolbar.items = [doneBeltBarButton]
        
        beltLevelField.inputView = beltPicker
        beltLevelField.inputAccessoryView = beltToolbar
        
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
        let constraintsArray: [NSLayoutConstraint] = [
            promptLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            promptLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            promptLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 70),
            
            stackView.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            
            registerButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30)
        ]
        
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
    
    func getBeltLevel() -> BeltLevel? {
        if let beltLevel = beltLevelField.text {
            let belt = beltLevel.stringToBeltLevel(beltString: beltLevel)
            return belt
        } else {
            return nil
        }
    }
    
    private func isPasswordvalid() -> Bool {
        if passwordField.text!.count <= 6 {
            return false
        } else {
            return true
        }
    }
    
    private func isNameFieldValid() -> Bool {
        var isValid = true
        
        firstNameField.text?.forEach({ char in
            if char.isWhitespace == true {
                isValid = false
            }
        })
        lastNameField.text?.forEach({ char in
            if char.isWhitespace == true {
                isValid = false
            }
        })
        
        return isValid
    }
    
    // MARK: - Button Target Methods
    
    @objc private func doneBeltBarButtonTapped(_ sender: UIButton) {
        endEditing(false)
    }
    
    @objc private func registerButtonTapped() {
        let array = [firstNameField.text, lastNameField.text, passwordField.text, confirmPasswordField.text, beltLevelField.text]
        
        for text in array {
            if text?.isEmpty == true {
                print(text)
                delegate?.presentAlertEmptyField()
                return
            }
        }
        
        if isNameFieldValid() == false {
            delegate?.presentAlertNameField()
            return
        }
        
        if isPasswordvalid() == false {
            delegate?.presentAlertPasswordField()
            return
        }
        
        delegate?.registerUser()
    }
    
    // MARK: - Picker View Delegate Methods
    
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
    
    /*
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            delegate?.presentAlertEmptyField()
        } else {
            switch textField {
            case firstNameField:
                firstNameField.text?.forEach({ char in
                    if char.isWhitespace == true {
                        delegate?.presentAlertNameField()
                    }
                })
            case lastNameField:
                lastNameField.text?.forEach({ char in
                    if char.isWhitespace == true {
                        delegate?.presentAlertNameField()
                    }
                })
            case passwordField:
                if passwordField.text!.count <= 6 {
                    delegate?.presentAlertPasswordField()
                }
            default:
                return
            }
        }
    }*/
}
