//
//  LoginView.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 4/29/22.
//

import UIKit

class LoginView: UIView {
    
    private var delegate: LoginViewDelegateProtocol?

    private let logoLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fudoshin"
        label.font = UIFont(name: "cochin", size: 32)
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = label.frame.width
        label.textAlignment = .center
        
        return label
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textAlignment = .left
        textField.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.9)
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.setLeftPaddingPoints(24)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular) /*, NSAttributedString.Key.foregroundColor : UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)*/]
        let attributedText = NSAttributedString(string: "Email", attributes: attributes)
        textField.attributedPlaceholder = attributedText
    
        /*textField.placeholder = "email"
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left*/
    
        return textField
    }()
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textAlignment = .left
        textField.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.9)
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.setLeftPaddingPoints(24)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), /*,NSAttributedString.Key.foregroundColor : NamedColors.darkGray*/]
        let attributedText = NSAttributedString(string: "Password", attributes: attributes)
        textField.attributedPlaceholder = attributedText
    
        /*textField.placeholder = "password"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textAlignment = .left*/
    
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let fieldStackView = UIStackView()
    private let buttonStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        configureSubViews()
        addTargetsToButtons()
        activateConstraints()
    }
    
    private func configureSubViews() {
        configureStackViews()
        let views = [logoLabel, fieldStackView, buttonStackView]
        
        for view in views {
            addSubview(view)
        }
    }
    
    private func configureStackViews() {
        let fields = [emailField, passwordField]
        let buttons = [loginButton, registerButton]
        
        fieldStackView.translatesAutoresizingMaskIntoConstraints = false
        fieldStackView.axis = .vertical
        fieldStackView.spacing = 15
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 15
        
        for field in fields {
            fieldStackView.addArrangedSubview(field)
        }
        
        for button in buttons {
            buttonStackView.addArrangedSubview(button)
        }
    }
    
    private func activateConstraints() {
        let constraintsArray: [NSLayoutConstraint] = [logoLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), logoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50), fieldStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), fieldStackView.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 120), buttonStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), buttonStackView.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 40)]
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    private func addTargetsToButtons() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func registerButtonTapped() {
        // delegate method
    }
    
    @objc private func loginButtonTapped() {
        // delegate method
    }
    
    func setDelegate(delegate: LoginViewDelegateProtocol) {
        self.delegate = delegate
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

}

extension UITextField { // TODO: Move to util as UITextFieldExt
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
